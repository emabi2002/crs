/**
 * Universal CRS Data Parser for 2022-2025
 * This script reads CSV files and generates SQL migration files
 */

import * as fs from 'fs';
import * as path from 'path';

// Configuration for each year
const YEARS_TO_PROCESS = ['2022', '2023', '2024', '2025'];

// Helper to generate valid UUIDs (format: 8-4-4-4-12 hex characters)
function generateId(year: string, prefix: string, index: number): string {
  const yearHex = parseInt(year).toString(16).padStart(4, '0');
  const prefixMap: Record<string, string> = {
    'ag': 'a100',  // agencies
    'of': '0f00',  // officers
    'fs': 'f500',  // funding sources
    'ct': 'c100',  // contractors
    'tn': '1000',  // tenders
    'ca': 'ca00',  // contract awards
    'ap': 'a900',  // approvals
  };
  const prefixHex = prefixMap[prefix] || '0000';
  const padded = index.toString(16).padStart(12, '0');
  // Format: prefixHex(4) + yearHex(4) = 8 chars for first segment
  return `${prefixHex}${yearHex}-0000-0000-0000-${padded}`;
}

// Helper to escape SQL strings
function escapeSql(str: string | null | undefined): string {
  if (!str || str === '-' || str === 'NA' || str === 'N/A' || str === 'Nil' || str.trim() === '') return 'NULL';
  let cleaned = str.replace(/^"+|"+$/g, '').trim();
  cleaned = cleaned.replace(/'/g, "''");
  if (cleaned === '-' || cleaned === 'NA' || cleaned === 'N/A') return 'NULL';
  return `'${cleaned}'`;
}

// Helper to parse currency values
function parseCurrency(str: string | null | undefined): number | null {
  if (!str || str === '-' || str === 'NA' || str === 'Pending' || str === 'Pending APC') return null;

  // Skip if it looks like a certificate/reference number (contains "Cert", "CCP", "APC No", etc.)
  const lowerStr = str.toLowerCase();
  if (lowerStr.includes('cert no') || lowerStr.includes('ccp') || lowerStr.includes('apc no') ||
      lowerStr.includes('apc#') || lowerStr.includes('letter') || lowerStr.includes('objection')) {
    // Try to extract just the value part after K or PGK
    const valueMatch = str.match(/[KPG]{1,3}\s*[\d,]+\.?\d*/i);
    if (valueMatch) {
      const cleaned = valueMatch[0].replace(/[KPGkpg\s,]/g, '');
      const value = parseFloat(cleaned);
      if (!isNaN(value) && value < 10000000000000) { // Less than 10 trillion
        return value;
      }
    }
    return null;
  }

  // Look for currency patterns like K1,234,567.89 or PGK 1,234,567.89
  const currencyMatch = str.match(/[KPG]{1,3}\s*[\d,]+\.?\d*/i);
  if (currencyMatch) {
    const cleaned = currencyMatch[0].replace(/[KPGkpg\s,]/g, '');
    const value = parseFloat(cleaned);
    if (!isNaN(value) && value < 10000000000000) {
      return value;
    }
  }

  // Fallback: try to find any reasonable number
  const cleaned = str.replace(/[KPGkpgUSDusdAUDaud,"""''$\s]/g, '').trim();
  const match = cleaned.match(/[\d]+\.?\d*/);
  if (match) {
    const value = parseFloat(match[0]);
    // Only accept values that look like realistic contract amounts (less than 10 trillion)
    if (!isNaN(value) && value < 10000000000000 && value > 0) {
      return value;
    }
  }
  return null;
}

// Helper to parse dates - handles many formats
function parseDate(str: string | null | undefined): string | null {
  if (!str || str === '-' || str === 'NA' || str === 'Completed' || str === 'Withdrawn' || str === 'Pending') return null;

  const months: Record<string, string> = {
    'jan': '01', 'january': '01', 'feb': '02', 'february': '02',
    'mar': '03', 'march': '03', 'apr': '04', 'april': '04',
    'may': '05', 'jun': '06', 'june': '06', 'jul': '07', 'july': '07',
    'aug': '08', 'august': '08', 'sep': '09', 'sept': '09', 'september': '09',
    'oct': '10', 'october': '10', 'nov': '11', 'november': '11',
    'dec': '12', 'december': '12'
  };

  // Helper to validate date components
  const isValidDate = (day: number, month: number, year: number): boolean => {
    if (month < 1 || month > 12) return false;
    if (day < 1 || day > 31) return false;
    if (year < 2000 || year > 2030) return false;
    // Check days in month
    const daysInMonth = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    if (day > daysInMonth[month]) return false;
    return true;
  };

  // Pattern: day month year (e.g., "28th January 2025", "14/05/2024")
  const pattern = /(\d{1,2})(?:st|nd|rd|th)?\s*[\/\s]?\s*([a-zA-Z]+)[\/\s,]*\s*(\d{4})/i;
  const match = str.match(pattern);
  if (match) {
    const dayNum = parseInt(match[1]);
    const monthStr = match[2].toLowerCase();
    const month = months[monthStr] || months[monthStr.substring(0, 3)];
    const year = parseInt(match[3]);
    if (month && isValidDate(dayNum, parseInt(month), year)) {
      return `${year}-${month}-${dayNum.toString().padStart(2, '0')}`;
    }
  }

  // Pattern: dd/mm/yy or dd/mm/yyyy
  const slashPattern = /(\d{1,2})\/(\d{1,2})\/(\d{2,4})/;
  const slashMatch = str.match(slashPattern);
  if (slashMatch) {
    const dayNum = parseInt(slashMatch[1]);
    const monthNum = parseInt(slashMatch[2]);
    let year = slashMatch[3];
    if (year.length === 2) {
      year = parseInt(year) > 50 ? `19${year}` : `20${year}`;
    }
    const yearNum = parseInt(year);

    if (isValidDate(dayNum, monthNum, yearNum)) {
      return `${year}-${monthNum.toString().padStart(2, '0')}-${dayNum.toString().padStart(2, '0')}`;
    }
  }

  return null;
}

// Determine tender status from status field
function determineStatus(status: string, contractor: string, tfecStatus: string): string {
  const statusLower = (status || '').toLowerCase();
  const tfecLower = (tfecStatus || '').toLowerCase();

  if (statusLower.includes('cancel') || statusLower.includes('withdrawn') || tfecLower.includes('cancel')) {
    return 'Cancelled';
  }
  if (statusLower.includes('executed') || statusLower.includes('contract executed') || statusLower.includes('contract awarded') || statusLower.includes('contract signed')) {
    return 'Awarded';
  }
  if (statusLower.includes('awarded') && contractor && contractor !== '-') {
    return 'Awarded';
  }
  if (statusLower.includes('pending') || statusLower.includes('awaiting')) {
    if (tfecLower.includes('complete') || tfecLower.includes('concluded')) {
      return 'Approved';
    }
    return 'Submitted for Approval';
  }
  if (statusLower.includes('retender') || statusLower.includes('re-tender')) {
    return 'Cancelled';
  }
  if (contractor && contractor !== '-' && contractor !== 'NA' && contractor.length > 2) {
    return 'Awarded';
  }
  if (tfecLower.includes('complete') || tfecLower.includes('done')) {
    return 'Approved';
  }
  if (tfecLower.includes('pending') || tfecLower.includes('tfec') || tfecLower.includes('progress')) {
    return 'Evaluation';
  }

  return 'Active';
}

// Parse CSV content
function parseCSV(content: string): string[][] {
  const lines = content.split('\n');
  const result: string[][] = [];

  for (const line of lines) {
    const trimmedLine = line.trim();
    if (!trimmedLine) continue;

    const values: string[] = [];
    let current = '';
    let inQuotes = false;

    for (let i = 0; i < trimmedLine.length; i++) {
      const char = trimmedLine[i];
      if (char === '"') {
        inQuotes = !inQuotes;
      } else if (char === ',' && !inQuotes) {
        values.push(current.replace(/^"+|"+$/g, '').trim());
        current = '';
      } else {
        current += char;
      }
    }
    values.push(current.replace(/^"+|"+$/g, '').trim());
    result.push(values);
  }

  return result;
}

// Process a single year's data
function processYear(year: string): {
  agencies: Map<string, { id: string; name: string; abbreviation: string }>;
  officers: Map<string, { id: string; name: string; agencyId: string }>;
  funding: Map<string, { id: string; name: string; donorName: string | null }>;
  contractors: Map<string, { id: string; name: string }>;
  records: any[];
  sql: string;
} {
  const csvPath = path.join(__dirname, `../uploads/${year}_crs.csv`);

  if (!fs.existsSync(csvPath)) {
    console.log(`File not found: ${csvPath}`);
    return { agencies: new Map(), officers: new Map(), funding: new Map(), contractors: new Map(), records: [], sql: '' };
  }

  const csvContent = fs.readFileSync(csvPath, 'utf-8');
  const rows = parseCSV(csvContent);
  const headers = rows[0];

  console.log(`\n=== Processing ${year} ===`);
  console.log(`Headers: ${headers.length} columns`);

  // Detect column structure based on year
  // 2022 format: Agency, Tender No, Action Officer, Project Description, Funding, Closing Date Time, APC Value, TFEC Status, Schedule TFEC Date, Approval Date Board Meeting No, Contractor, Contract Value, Status
  // 2023-2025 format: Agency, Tender No, Tender No Issued Date, Action Officer, Project Description, Funding, ...

  const hasIssuedDate = headers.some(h => h.toLowerCase().includes('issued'));

  interface RawRecord {
    agency: string;
    tenderNo: string;
    issuedDate: string;
    actionOfficer: string;
    projectDescription: string;
    funding: string;
    closingDateTime: string;
    apcValue: string;
    tfecStatus: string;
    approvalDate: string;
    contractor: string;
    contractValue: string;
    status: string;
  }

  const records: RawRecord[] = [];

  for (let i = 1; i < rows.length; i++) {
    const values = rows[i];
    if (!values || values.length < 5) continue;
    if (values[0] === '-' || !values[1]) continue;

    let record: RawRecord;

    if (hasIssuedDate) {
      // 2023-2025 format
      record = {
        agency: values[0] || '',
        tenderNo: values[1] || '',
        issuedDate: values[2] || '',
        actionOfficer: values[3] || '',
        projectDescription: values[4] || '',
        funding: values[5] || '',
        closingDateTime: values[6] || '',
        apcValue: values[7] || '',
        tfecStatus: values[9] || '',
        approvalDate: values[10] || '',
        contractor: values[11] || '',
        contractValue: values[12] || '',
        status: values[13] || values[12] || ''
      };
    } else {
      // 2022 format
      record = {
        agency: values[0] || '',
        tenderNo: values[1] || '',
        issuedDate: '',
        actionOfficer: values[2] || '',
        projectDescription: values[3] || '',
        funding: values[4] || '',
        closingDateTime: values[5] || '',
        apcValue: values[6] || '',
        tfecStatus: values[7] || '',
        approvalDate: values[9] || '',
        contractor: values[10] || '',
        contractValue: values[11] || '',
        status: values[12] || ''
      };
    }

    records.push(record);
  }

  console.log(`Parsed ${records.length} records`);

  // Extract unique entities
  const uniqueAgencies = new Map<string, { id: string; name: string; abbreviation: string }>();
  const uniqueOfficers = new Map<string, { id: string; name: string; agencyId: string }>();
  const uniqueFunding = new Map<string, { id: string; name: string; donorName: string | null }>();
  const uniqueContractors = new Map<string, { id: string; name: string }>();

  let agencyIndex = 1;
  let officerIndex = 1;
  let fundingIndex = 1;
  let contractorIndex = 1;

  for (const record of records) {
    // Agency
    if (record.agency && record.agency !== '-') {
      const agencyKey = record.agency.toLowerCase().replace(/\s+/g, ' ').trim();
      if (!uniqueAgencies.has(agencyKey)) {
        const abbrevMatch = record.agency.match(/\(([^)]+)\)/);
        const abbreviation = abbrevMatch ? abbrevMatch[1] : '';
        const name = record.agency.replace(/\s*\([^)]+\)\s*$/, '').trim();
        uniqueAgencies.set(agencyKey, {
          id: generateId(year, 'ag', agencyIndex++),
          name: name,
          abbreviation: abbreviation
        });
      }
    }

    // Officer
    if (record.actionOfficer && record.actionOfficer !== '-' && record.actionOfficer.length > 2) {
      const officerKey = record.actionOfficer.toLowerCase().replace(/[^a-z\s]/gi, '').trim();
      if (officerKey && !uniqueOfficers.has(officerKey)) {
        const agencyKey = record.agency.toLowerCase().replace(/\s+/g, ' ').trim();
        const agency = uniqueAgencies.get(agencyKey);
        uniqueOfficers.set(officerKey, {
          id: generateId(year, 'of', officerIndex++),
          name: record.actionOfficer.replace(/[^a-zA-Z\s\.]/g, '').trim(),
          agencyId: agency?.id || ''
        });
      }
    }

    // Funding Source
    if (record.funding && record.funding !== '-') {
      const fundingKey = record.funding.toLowerCase().replace(/\s+/g, ' ').trim();
      if (!uniqueFunding.has(fundingKey)) {
        let name = record.funding;
        let donorName: string | null = null;

        if (fundingKey.includes('adb') || fundingKey.includes('asian development')) {
          name = 'Asian Development Bank'; donorName = 'Asian Development Bank';
        } else if (fundingKey.includes('world bank')) {
          name = 'World Bank'; donorName = 'World Bank';
        } else if (fundingKey.includes('ausaid') || fundingKey.includes('australian') || fundingKey.includes('tssp')) {
          name = 'Australian Aid (TSSP)'; donorName = 'Australian Government (DFAT)';
        } else if (fundingKey.includes('gopng') || fundingKey.includes('government of papua')) {
          name = 'GoPNG'; donorName = null;
        } else if (fundingKey.includes('own source') || fundingKey.includes('own funding')) {
          name = 'Own Source Revenue'; donorName = null;
        } else if (fundingKey.includes('connect png')) {
          name = 'GoPNG Connect PNG'; donorName = null;
        }

        uniqueFunding.set(fundingKey, {
          id: generateId(year, 'fs', fundingIndex++),
          name: name,
          donorName: donorName
        });
      }
    }

    // Contractor
    if (record.contractor && record.contractor !== '-' && record.contractor !== 'NA' &&
        record.contractor !== 'N/A' && record.contractor.length > 2 &&
        !record.contractor.toLowerCase().includes('subject to') &&
        !record.contractor.toLowerCase().includes('blanket') &&
        !record.contractor.toLowerCase().includes('pending')) {
      const contractorKey = record.contractor.toLowerCase().replace(/\s+/g, ' ').trim();
      if (!uniqueContractors.has(contractorKey)) {
        uniqueContractors.set(contractorKey, {
          id: generateId(year, 'ct', contractorIndex++),
          name: record.contractor.replace(/^"+|"+$/g, '').trim()
        });
      }
    }
  }

  console.log(`Found ${uniqueAgencies.size} agencies, ${uniqueOfficers.size} officers, ${uniqueFunding.size} funding sources, ${uniqueContractors.size} contractors`);

  // Generate SQL
  let sql = `-- ============================================
-- ${year} CONTRACT REGISTRY DATA MIGRATION
-- Generated from ${year}_crs.csv
-- ============================================

`;

  // Agencies
  if (uniqueAgencies.size > 0) {
    sql += `\n-- AGENCIES (${uniqueAgencies.size} records)\n`;
    sql += `INSERT INTO agencies (id, name, abbreviation, level, sector) VALUES\n`;
    const agencyValues: string[] = [];
    for (const [key, agency] of uniqueAgencies) {
      const sector = key.includes('works') || key.includes('highway') ? 'Infrastructure' :
                     key.includes('education') ? 'Education' :
                     key.includes('health') ? 'Health' :
                     key.includes('finance') || key.includes('treasury') || key.includes('revenue') ? 'Finance' :
                     key.includes('transport') ? 'Transport' :
                     key.includes('fisheries') || key.includes('maritime') ? 'Maritime' :
                     key.includes('correctional') ? 'Justice' :
                     key.includes('defense') || key.includes('constabulary') ? 'Security' :
                     key.includes('provincial') || key.includes('district') ? 'Provincial' :
                     'Other';
      const level = key.includes('provincial') || key.includes('district') ? 'Provincial' : 'National';
      agencyValues.push(`    ('${agency.id}', '${agency.name.replace(/'/g, "''")}', '${agency.abbreviation}', '${level}', '${sector}')`);
    }
    sql += agencyValues.join(',\n') + '\nON CONFLICT (id) DO NOTHING;\n';
  }

  // Funding Sources
  if (uniqueFunding.size > 0) {
    sql += `\n-- FUNDING SOURCES (${uniqueFunding.size} records)\n`;
    sql += `INSERT INTO funding_sources (id, name, donor_name) VALUES\n`;
    const fundingValues: string[] = [];
    for (const [key, funding] of uniqueFunding) {
      const donorSql = funding.donorName ? `'${funding.donorName.replace(/'/g, "''")}'` : 'NULL';
      fundingValues.push(`    ('${funding.id}', '${funding.name.replace(/'/g, "''")}', ${donorSql})`);
    }
    sql += fundingValues.join(',\n') + '\nON CONFLICT (id) DO NOTHING;\n';
  }

  // Officers
  if (uniqueOfficers.size > 0) {
    sql += `\n-- OFFICERS (${uniqueOfficers.size} records)\n`;
    sql += `INSERT INTO officers (id, full_name, email, agency_id, role) VALUES\n`;
    const officerValues: string[] = [];
    for (const [key, officer] of uniqueOfficers) {
      const email = `${officer.name.toLowerCase().replace(/[^a-z]/g, '.').replace(/\.+/g, '.')}@npc.gov.pg`;
      const agencyId = officer.agencyId ? `'${officer.agencyId}'` : 'NULL';
      officerValues.push(`    ('${officer.id}', '${officer.name.replace(/'/g, "''")}', '${email}', ${agencyId}, 'Procurement Officer')`);
    }
    sql += officerValues.join(',\n') + '\nON CONFLICT (email) DO NOTHING;\n';
  }

  // Contractors
  if (uniqueContractors.size > 0) {
    sql += `\n-- CONTRACTORS (${uniqueContractors.size} records)\n`;
    sql += `INSERT INTO contractors (id, legal_name, trading_name, address, province, contact_person, phone, email, status, categories) VALUES\n`;
    const contractorValues: string[] = [];
    for (const [key, contractor] of uniqueContractors) {
      const name = contractor.name.replace(/'/g, "''");
      const category = key.includes('construction') || key.includes('engineering') || key.includes('build') ? 'Works' :
                       key.includes('supplies') || key.includes('enterprise') || key.includes('trading') ? 'Goods' :
                       key.includes('consult') || key.includes('architect') ? 'Consulting' :
                       key.includes('logistic') || key.includes('transport') ? 'Services' : 'Works';
      contractorValues.push(`    ('${contractor.id}', '${name}', '${name}', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['${category}'])`);
    }
    sql += contractorValues.join(',\n') + '\nON CONFLICT (id) DO NOTHING;\n';
  }

  // Tenders and Contract Awards
  sql += `\n-- TENDERS (${records.length} records)\n`;

  let tenderIndex = 1;
  let contractIndex = 1;
  let approvalIndex = 1;

  for (const record of records) {
    if (!record.tenderNo || record.tenderNo === '-') continue;

    const tenderId = generateId(year, 'tn', tenderIndex++);
    const agencyKey = record.agency.toLowerCase().replace(/\s+/g, ' ').trim();
    const agency = uniqueAgencies.get(agencyKey);
    const officerKey = record.actionOfficer.toLowerCase().replace(/[^a-z\s]/gi, '').trim();
    const officer = uniqueOfficers.get(officerKey);
    const fundingKey = record.funding.toLowerCase().replace(/\s+/g, ' ').trim();
    const funding = uniqueFunding.get(fundingKey);

    const closingDate = parseDate(record.closingDateTime) || parseDate(record.issuedDate);
    const estimatedValue = parseCurrency(record.apcValue);
    const status = determineStatus(record.status, record.contractor, record.tfecStatus);

    let procurementMethod = 'Open Tender';
    if (record.status.toLowerCase().includes('single source') || record.tenderNo.toLowerCase().includes('coi')) {
      procurementMethod = 'Single Source';
    }

    // Use subquery to find officer by email to handle cases where officer already exists with different UUID
    const officerEmail = officer ? `${officer.name.toLowerCase().replace(/[^a-z]/g, '.').replace(/\.+/g, '.')}@npc.gov.pg` : null;
    const officerSubquery = officerEmail ? `(SELECT id FROM officers WHERE email = '${officerEmail}' LIMIT 1)` : 'NULL';

    sql += `\n-- Tender: ${record.tenderNo}\n`;
    sql += `INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (\n`;
    sql += `    '${tenderId}',\n`;
    sql += `    '${record.tenderNo}',\n`;
    sql += `    ${agency ? `'${agency.id}'` : 'NULL'},\n`;
    sql += `    ${closingDate ? `'${closingDate}'` : `'${year}-01-01'`},\n`;
    sql += `    ${closingDate ? `'${closingDate} 10:00:00+10'` : 'NULL'},\n`;
    sql += `    '${procurementMethod}',\n`;
    sql += `    ${escapeSql(record.projectDescription.substring(0, 200))},\n`;
    sql += `    ${escapeSql(record.projectDescription)},\n`;
    sql += `    ${estimatedValue || 'NULL'},\n`;
    sql += `    ${funding ? `'${funding.id}'` : 'NULL'},\n`;
    sql += `    '${status}',\n`;
    sql += `    ${officerSubquery},\n`;
    sql += `    ${officerSubquery},\n`;
    sql += `    ${officerSubquery}\n`;
    sql += `) ON CONFLICT (tender_no) DO NOTHING;\n`;

    // Contract Award
    const contractValue = parseCurrency(record.contractValue);
    const contractorKey = record.contractor?.toLowerCase().replace(/\s+/g, ' ').trim();
    const contractor = uniqueContractors.get(contractorKey || '');

    if (contractor && contractValue && status === 'Awarded') {
      const contractId = generateId(year, 'ca', contractIndex++);
      const awardDate = parseDate(record.approvalDate) || parseDate(record.closingDateTime) || `${year}-12-31`;

      sql += `\nINSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (\n`;
      sql += `    '${contractId}',\n`;
      sql += `    '${tenderId}',\n`;
      sql += `    '${contractor.id}',\n`;
      sql += `    '${awardDate}',\n`;
      sql += `    ${contractValue},\n`;
      sql += `    'PGK',\n`;
      sql += `    'CON-${record.tenderNo}',\n`;
      sql += `    '${awardDate}',\n`;
      sql += `    '2026-12-31',\n`;
      sql += `    'Active'\n`;
      sql += `) ON CONFLICT (tender_id) DO NOTHING;\n`;
    }

    // Approval record
    if (record.approvalDate && record.approvalDate !== '-' && record.approvalDate.length > 3) {
      const approvalDate = parseDate(record.approvalDate);
      const approvalId = generateId(year, 'ap', approvalIndex++);

      let approvalType = 'NPC Board';
      if (record.approvalDate.toLowerCase().includes('nec')) {
        approvalType = 'NEC';
      } else if (record.approvalDate.toLowerCase().includes('tfec')) {
        approvalType = 'TFEC';
      }

      if (approvalDate) {
        sql += `\nINSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (\n`;
        sql += `    '${approvalId}',\n`;
        sql += `    '${tenderId}',\n`;
        sql += `    '${approvalType}',\n`;
        sql += `    ${escapeSql(record.approvalDate.substring(0, 50))},\n`;
        sql += `    '${approvalDate}',\n`;
        sql += `    'Approved'\n`;
        sql += `) ON CONFLICT (id) DO NOTHING;\n`;
      }
    }
  }

  sql += `\n-- END OF ${year} DATA MIGRATION\n`;

  // Write SQL to file
  const outputPath = path.join(__dirname, `../supabase/migrate-${year}-data.sql`);
  fs.writeFileSync(outputPath, sql);

  console.log(`\nSQL migration file generated: ${outputPath}`);
  console.log(`Summary for ${year}:`);
  console.log(`- ${uniqueAgencies.size} agencies`);
  console.log(`- ${uniqueOfficers.size} officers`);
  console.log(`- ${uniqueFunding.size} funding sources`);
  console.log(`- ${uniqueContractors.size} contractors`);
  console.log(`- ${records.length} tenders`);
  console.log(`- ${contractIndex - 1} contract awards`);
  console.log(`- ${approvalIndex - 1} approvals`);

  return { agencies: uniqueAgencies, officers: uniqueOfficers, funding: uniqueFunding, contractors: uniqueContractors, records, sql };
}

// Main execution
console.log('='.repeat(50));
console.log('NPC CONTRACT REGISTRY - DATA MIGRATION GENERATOR');
console.log('='.repeat(50));

const allStats = {
  agencies: 0,
  officers: 0,
  funding: 0,
  contractors: 0,
  tenders: 0,
  contracts: 0,
  approvals: 0
};

for (const year of YEARS_TO_PROCESS) {
  const result = processYear(year);
  allStats.agencies += result.agencies.size;
  allStats.officers += result.officers.size;
  allStats.funding += result.funding.size;
  allStats.contractors += result.contractors.size;
  allStats.tenders += result.records.length;
}

console.log('\n' + '='.repeat(50));
console.log('TOTAL SUMMARY (All Years Combined)');
console.log('='.repeat(50));
console.log(`Total Agencies: ${allStats.agencies}`);
console.log(`Total Officers: ${allStats.officers}`);
console.log(`Total Funding Sources: ${allStats.funding}`);
console.log(`Total Contractors: ${allStats.contractors}`);
console.log(`Total Tenders: ${allStats.tenders}`);
console.log('\nSQL files generated in supabase/ folder');
