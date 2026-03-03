/**
 * Parse 2020 CRS Data and Generate SQL Insert Statements
 * This script reads the CSV data and creates normalized SQL inserts
 */

import * as fs from 'fs';
import * as path from 'path';

// Helper to generate valid UUIDs (deterministic for consistency)
// UUID format: 8-4-4-4-12 hex characters (only 0-9, a-f allowed)
function generateId(prefix: string, index: number): string {
  // Map prefix to a hex code
  const prefixMap: Record<string, string> = {
    'ag2020': 'a2002020', // agencies
    'of2020': '0f202020', // officers
    'fs2020': 'f5202020', // funding sources
    'ct2020': 'c2002020', // contractors
    'tn2020': '20002020', // tenders
    'ca2020': 'ca202020', // contract awards
    'ap2020': 'a9202020', // approvals
  };
  const hexPrefix = prefixMap[prefix] || '00000000';
  const padded = index.toString(16).padStart(12, '0');
  return `${hexPrefix}-0000-0000-0000-${padded}`;
}

// Helper to clean and escape SQL strings
function escapeSql(str: string | null | undefined): string {
  if (!str || str === '-' || str === 'NA' || str === 'N/A') return 'NULL';
  let cleaned = str.replace(/^"+|"+$/g, '').trim();
  cleaned = cleaned.replace(/'/g, "''");
  return `'${cleaned}'`;
}

// Helper to parse currency values
function parseCurrency(str: string | null | undefined): number | null {
  if (!str || str === '-' || str === 'NA') return null;
  const cleaned = str.replace(/[KPGkpgUSDusd,"""''$\s]/g, '').trim();
  const match = cleaned.match(/[\d,]+\.?\d*/);
  if (match) {
    const value = parseFloat(match[0].replace(/,/g, ''));
    return isNaN(value) ? null : value;
  }
  return null;
}

// Helper to parse dates
function parseDate(str: string | null | undefined): string | null {
  if (!str || str === '-' || str === 'NA' || str === 'Completed' || str === 'Withdrawn') return null;

  const months: Record<string, string> = {
    'jan': '01', 'january': '01',
    'feb': '02', 'february': '02',
    'mar': '03', 'march': '03',
    'apr': '04', 'april': '04',
    'may': '05',
    'jun': '06', 'june': '06',
    'jul': '07', 'july': '07',
    'aug': '08', 'august': '08',
    'sep': '09', 'sept': '09', 'september': '09',
    'oct': '10', 'october': '10',
    'nov': '11', 'november': '11',
    'dec': '12', 'december': '12'
  };

  // Pattern: day month year
  const pattern = /(\d{1,2})(?:st|nd|rd|th)?\s*[\/\s]?\s*([a-zA-Z]+)[\/\s,]*\s*(\d{4})/i;
  const match = str.match(pattern);

  if (match) {
    const day = match[1].padStart(2, '0');
    const monthStr = match[2].toLowerCase();
    const month = months[monthStr] || months[monthStr.substring(0, 3)];
    const year = match[3];

    if (month) {
      return `${year}-${month}-${day}`;
    }
  }

  // Try dd/mm/yy or dd/mm/yyyy format
  const slashPattern = /(\d{1,2})\/(\d{1,2})\/(\d{2,4})/;
  const slashMatch = str.match(slashPattern);
  if (slashMatch) {
    const day = slashMatch[1].padStart(2, '0');
    const month = slashMatch[2].padStart(2, '0');
    let year = slashMatch[3];
    if (year.length === 2) {
      year = parseInt(year) > 50 ? `19${year}` : `20${year}`;
    }
    return `${year}-${month}-${day}`;
  }

  return null;
}

// Determine tender status from the Status field
function determineStatus(status: string, contractor: string, tfecStatus: string): string {
  const statusLower = (status || '').toLowerCase();
  const tfecLower = (tfecStatus || '').toLowerCase();

  if (statusLower.includes('cancelled') || statusLower.includes('withdrawn') || statusLower.includes('cancel')) {
    return 'Cancelled';
  }
  if (statusLower.includes('executed') || statusLower.includes('contract executed')) {
    return 'Awarded';
  }
  if (statusLower.includes('pending')) {
    if (tfecLower.includes('complete') || tfecLower.includes('concluded')) {
      return 'Approved';
    }
    return 'Submitted for Approval';
  }
  if (statusLower.includes('retender')) {
    return 'Cancelled';
  }
  if (contractor && contractor !== '-' && contractor !== 'NA' && contractor.length > 2) {
    return 'Awarded';
  }
  if (tfecLower.includes('complete') || tfecLower.includes('done')) {
    return 'Approved';
  }
  if (tfecLower.includes('pending') || tfecLower.includes('tfec')) {
    return 'Evaluation';
  }

  return 'Closed';
}

// Read and parse CSV
const csvPath = path.join(__dirname, '../uploads/2020_crs.csv');
const csvContent = fs.readFileSync(csvPath, 'utf-8');

// Parse CSV (simple parser for this format)
const lines = csvContent.split('\n');
const headers = lines[0].split(',').map(h => h.replace(/^"+|"+$/g, '').trim());

interface RawRecord {
  agency: string;
  tenderNo: string;
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

for (let i = 1; i < lines.length; i++) {
  const line = lines[i].trim();
  if (!line) continue;

  // Parse CSV line (handling quoted fields with commas)
  const values: string[] = [];
  let current = '';
  let inQuotes = false;

  for (let j = 0; j < line.length; j++) {
    const char = line[j];
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

  if (values[0] === '-' || !values[1]) continue;

  records.push({
    agency: values[0] || '',
    tenderNo: values[1] || '',
    actionOfficer: values[2] || '',
    projectDescription: values[3] || '',
    funding: values[4] || '',
    closingDateTime: values[5] || '',
    apcValue: values[6] || '',
    tfecStatus: values[7] || '',
    approvalDate: values[9] || '', // Approval Date Board Meeting No
    contractor: values[10] || '',
    contractValue: values[11] || '',
    status: values[12] || ''
  });
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

// Process records to extract unique entities
for (const record of records) {
  // Agency
  if (record.agency && record.agency !== '-') {
    const agencyKey = record.agency.toLowerCase();
    if (!uniqueAgencies.has(agencyKey)) {
      const abbrevMatch = record.agency.match(/\(([^)]+)\)/);
      const abbreviation = abbrevMatch ? abbrevMatch[1] : '';
      const name = record.agency.replace(/\s*\([^)]+\)\s*$/, '').trim();

      uniqueAgencies.set(agencyKey, {
        id: generateId('ag2020', agencyIndex++),
        name: name,
        abbreviation: abbreviation
      });
    }
  }

  // Officer
  if (record.actionOfficer && record.actionOfficer !== '-') {
    const officerKey = record.actionOfficer.toLowerCase();
    if (!uniqueOfficers.has(officerKey)) {
      const agencyKey = record.agency.toLowerCase();
      const agency = uniqueAgencies.get(agencyKey);

      uniqueOfficers.set(officerKey, {
        id: generateId('of2020', officerIndex++),
        name: record.actionOfficer,
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
        name = 'Asian Development Bank';
        donorName = 'Asian Development Bank';
      } else if (fundingKey.includes('world bank')) {
        name = 'World Bank';
        donorName = 'World Bank';
      } else if (fundingKey.includes('exim') || fundingKey.includes('indian')) {
        name = 'Indian Exim Bank';
        donorName = 'Government of India';
      } else if (fundingKey.includes('gopng')) {
        name = 'GoPNG';
        donorName = null;
      }

      uniqueFunding.set(fundingKey, {
        id: generateId('fs2020', fundingIndex++),
        name: name,
        donorName: donorName
      });
    }
  }

  // Contractor
  if (record.contractor && record.contractor !== '-' && record.contractor !== 'NA' &&
      record.contractor.length > 2 &&
      !record.contractor.toLowerCase().includes('subject to') &&
      !record.contractor.toLowerCase().includes('blanket')) {
    const contractorKey = record.contractor.toLowerCase().replace(/\s+/g, ' ').trim();
    if (!uniqueContractors.has(contractorKey)) {
      uniqueContractors.set(contractorKey, {
        id: generateId('ct2020', contractorIndex++),
        name: record.contractor
      });
    }
  }
}

console.log(`Found ${uniqueAgencies.size} unique agencies`);
console.log(`Found ${uniqueOfficers.size} unique officers`);
console.log(`Found ${uniqueFunding.size} unique funding sources`);
console.log(`Found ${uniqueContractors.size} unique contractors`);

// Generate SQL
let sql = `-- ============================================
-- 2020 CONTRACT REGISTRY DATA MIGRATION
-- Generated from 2020_crs.csv
-- ============================================

`;

// Agencies
sql += `\n-- ============================================\n-- AGENCIES (${uniqueAgencies.size} records)\n-- ============================================\n`;
sql += `INSERT INTO agencies (id, name, abbreviation, level, sector) VALUES\n`;
const agencyValues: string[] = [];
for (const [key, agency] of uniqueAgencies) {
  const sector = key.includes('works') || key.includes('highway') ? 'Infrastructure' :
                 key.includes('education') ? 'Education' :
                 key.includes('health') ? 'Health' :
                 key.includes('finance') || key.includes('treasury') || key.includes('revenue') ? 'Finance' :
                 key.includes('transport') ? 'Transport' :
                 key.includes('commerce') ? 'Commerce' :
                 key.includes('fisheries') || key.includes('maritime') ? 'Maritime' :
                 key.includes('correctional') ? 'Justice' :
                 key.includes('statistical') ? 'Statistics' :
                 key.includes('capital district') || key.includes('ncdc') ? 'Local Government' :
                 key.includes('provincial') ? 'Provincial' :
                 'Other';
  const level = key.includes('provincial') || key.includes('district') ? 'Provincial' : 'National';

  agencyValues.push(`    ('${agency.id}', '${agency.name.replace(/'/g, "''")}', '${agency.abbreviation}', '${level}', '${sector}')`);
}
sql += agencyValues.join(',\n') + '\nON CONFLICT (id) DO NOTHING;\n';

// Funding Sources
sql += `\n-- ============================================\n-- FUNDING SOURCES (${uniqueFunding.size} records)\n-- ============================================\n`;
sql += `INSERT INTO funding_sources (id, name, donor_name) VALUES\n`;
const fundingValues: string[] = [];
for (const [key, funding] of uniqueFunding) {
  const donorSql = funding.donorName ? `'${funding.donorName.replace(/'/g, "''")}'` : 'NULL';
  fundingValues.push(`    ('${funding.id}', '${funding.name.replace(/'/g, "''")}', ${donorSql})`);
}
sql += fundingValues.join(',\n') + '\nON CONFLICT (id) DO NOTHING;\n';

// Officers
sql += `\n-- ============================================\n-- OFFICERS (${uniqueOfficers.size} records)\n-- ============================================\n`;
sql += `INSERT INTO officers (id, full_name, email, agency_id, role) VALUES\n`;
const officerValues: string[] = [];
for (const [key, officer] of uniqueOfficers) {
  const email = `${officer.name.toLowerCase().replace(/\s+/g, '.')}@npc.gov.pg`;
  const agencyId = officer.agencyId ? `'${officer.agencyId}'` : 'NULL';
  officerValues.push(`    ('${officer.id}', '${officer.name.replace(/'/g, "''")}', '${email}', ${agencyId}, 'Procurement Officer')`);
}
sql += officerValues.join(',\n') + '\nON CONFLICT (email) DO NOTHING;\n';

// Contractors
sql += `\n-- ============================================\n-- CONTRACTORS (${uniqueContractors.size} records)\n-- ============================================\n`;
sql += `INSERT INTO contractors (id, legal_name, trading_name, address, province, contact_person, phone, email, status, categories) VALUES\n`;
const contractorValues: string[] = [];
for (const [key, contractor] of uniqueContractors) {
  const name = contractor.name.replace(/'/g, "''");
  const category = key.includes('construction') || key.includes('engineering') || key.includes('building') || key.includes('builders') ? 'Works' :
                   key.includes('supplies') || key.includes('motors') || key.includes('trading') || key.includes('stationer') ? 'Goods' :
                   key.includes('consult') || key.includes('architect') ? 'Consulting' :
                   key.includes('logistic') || key.includes('express') || key.includes('post') ? 'Services' : 'Works';
  contractorValues.push(`    ('${contractor.id}', '${name}', '${name}', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['${category}'])`);
}
sql += contractorValues.join(',\n') + '\nON CONFLICT (id) DO NOTHING;\n';

// Note: If contractors with same name exist from other years, they will be added as separate entries.
// To avoid duplicates by name, you may need to manually deduplicate or add a unique constraint on legal_name.

// Tenders and Contract Awards
sql += `\n-- ============================================\n-- TENDERS (${records.length} records)\n-- ============================================\n`;

let tenderIndex = 1;
let contractIndex = 1;
let approvalIndex = 1;

for (const record of records) {
  if (!record.tenderNo || record.tenderNo === '-') continue;

  const tenderId = generateId('tn2020', tenderIndex++);
  const agencyKey = record.agency.toLowerCase();
  const agency = uniqueAgencies.get(agencyKey);
  const officerKey = record.actionOfficer.toLowerCase();
  const officer = uniqueOfficers.get(officerKey);
  const fundingKey = record.funding.toLowerCase().replace(/\s+/g, ' ').trim();
  const funding = uniqueFunding.get(fundingKey);

  const closingDate = parseDate(record.closingDateTime);
  const estimatedValue = parseCurrency(record.apcValue);
  const status = determineStatus(record.status, record.contractor, record.tfecStatus);

  let procurementMethod = 'Open Tender';
  if (record.tenderNo.toLowerCase().includes('coi')) {
    procurementMethod = 'Single Source';
  }

  // Generate officer email for lookup
  const officerEmail = officer ? `${officer.name.toLowerCase().replace(/\s+/g, '.')}@npc.gov.pg` : null;

  sql += `\n-- Tender: ${record.tenderNo}\n`;
  sql += `INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (\n`;
  sql += `    '${tenderId}',\n`;
  sql += `    '${record.tenderNo}',\n`;
  sql += `    ${agency ? `'${agency.id}'` : 'NULL'},\n`;
  sql += `    ${closingDate ? `'${closingDate}'` : "'2020-01-01'"},\n`;
  sql += `    ${closingDate ? `'${closingDate} 10:00:00+10'` : 'NULL'},\n`;
  sql += `    '${procurementMethod}',\n`;
  sql += `    ${escapeSql(record.projectDescription.substring(0, 200))},\n`;
  sql += `    ${escapeSql(record.projectDescription)},\n`;
  sql += `    ${estimatedValue || 'NULL'},\n`;
  sql += `    ${funding ? `'${funding.id}'` : 'NULL'},\n`;
  sql += `    '${status}',\n`;
  sql += `    ${officerEmail ? `(SELECT id FROM officers WHERE email = '${officerEmail}' LIMIT 1)` : 'NULL'},\n`;
  sql += `    ${officerEmail ? `(SELECT id FROM officers WHERE email = '${officerEmail}' LIMIT 1)` : 'NULL'},\n`;
  sql += `    ${officerEmail ? `(SELECT id FROM officers WHERE email = '${officerEmail}' LIMIT 1)` : 'NULL'}\n`;
  sql += `) ON CONFLICT (tender_no) DO NOTHING;\n`;

  // Contract Award (if contractor and contract value exist)
  const contractValue = parseCurrency(record.contractValue);
  const contractorKey = record.contractor?.toLowerCase().replace(/\s+/g, ' ').trim();
  const contractor = uniqueContractors.get(contractorKey || '');

  if (contractor && contractValue && status === 'Awarded') {
    const contractId = generateId('ca2020', contractIndex++);
    const awardDate = parseDate(record.approvalDate) || parseDate(record.closingDateTime) || '2020-12-31';

    sql += `\n-- Contract Award for ${record.tenderNo}\n`;
    sql += `INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (\n`;
    sql += `    '${contractId}',\n`;
    sql += `    '${tenderId}',\n`;
    sql += `    '${contractor.id}',\n`;
    sql += `    '${awardDate}',\n`;
    sql += `    ${contractValue},\n`;
    sql += `    'PGK',\n`;
    sql += `    'CON-${record.tenderNo}',\n`;
    sql += `    '${awardDate}',\n`;
    sql += `    '2025-12-31',\n`;
    sql += `    'Completed'\n`;
    sql += `) ON CONFLICT (tender_id) DO NOTHING;\n`;
  }

  // Approval record (if approval date exists)
  if (record.approvalDate && record.approvalDate !== '-' && record.approvalDate.length > 3) {
    const approvalDate = parseDate(record.approvalDate);
    const approvalId = generateId('ap2020', approvalIndex++);

    let approvalType = 'NPC Board';
    if (record.approvalDate.toLowerCase().includes('nec')) {
      approvalType = 'NEC';
    } else if (record.approvalDate.toLowerCase().includes('tfec')) {
      approvalType = 'TFEC';
    }

    if (approvalDate) {
      sql += `\n-- Approval for ${record.tenderNo}\n`;
      sql += `INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (\n`;
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

sql += `\n-- ============================================\n-- END OF 2020 DATA MIGRATION\n-- ============================================\n`;

// Write SQL to file
const outputPath = path.join(__dirname, '../supabase/migrate-2020-data.sql');
fs.writeFileSync(outputPath, sql);

console.log(`\nSQL migration file generated: ${outputPath}`);
console.log(`\nSummary:`);
console.log(`- ${uniqueAgencies.size} agencies`);
console.log(`- ${uniqueOfficers.size} officers`);
console.log(`- ${uniqueFunding.size} funding sources`);
console.log(`- ${uniqueContractors.size} contractors`);
console.log(`- ${records.length} tenders`);
console.log(`- ${contractIndex - 1} contract awards`);
console.log(`- ${approvalIndex - 1} approvals`);
