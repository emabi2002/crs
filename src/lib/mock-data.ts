import type {
  Agency,
  Officer,
  FundingSource,
  Contractor,
  Tender,
  TenderWorkflowEvent,
  ContractAward,
  ContractMilestone,
  ContractVariation,
  ContractIssueRisk,
  Approval,
  Bid,
  PipelineStats,
  PortfolioSummary,
  AgencySpend,
  ContractorAwardSummary,
  MonthlyTrend,
} from './types';

// ============================================
// REFERENCE DATA
// ============================================

export const agencies: Agency[] = [
  { id: 'ag-001', name: 'Department of Works', abbreviation: 'DoW', level: 'National', sector: 'Infrastructure', created_at: '2024-01-01' },
  { id: 'ag-002', name: 'Department of Health', abbreviation: 'DoH', level: 'National', sector: 'Health', created_at: '2024-01-01' },
  { id: 'ag-003', name: 'Department of Education', abbreviation: 'DoE', level: 'National', sector: 'Education', created_at: '2024-01-01' },
  { id: 'ag-004', name: 'Department of Finance', abbreviation: 'DoF', level: 'National', sector: 'Finance', created_at: '2024-01-01' },
  { id: 'ag-005', name: 'Department of ICT', abbreviation: 'DICT', level: 'National', sector: 'ICT', created_at: '2024-01-01' },
  { id: 'ag-006', name: 'PNG Power Limited', abbreviation: 'PPL', level: 'National', sector: 'Energy', created_at: '2024-01-01' },
  { id: 'ag-007', name: 'National Roads Authority', abbreviation: 'NRA', level: 'National', sector: 'Infrastructure', created_at: '2024-01-01' },
  { id: 'ag-008', name: 'Western Province Administration', abbreviation: 'WPA', level: 'Provincial', sector: 'Administration', created_at: '2024-01-01' },
  { id: 'ag-009', name: 'Morobe Provincial Administration', abbreviation: 'MPA', level: 'Provincial', sector: 'Administration', created_at: '2024-01-01' },
  { id: 'ag-010', name: 'NCD Provincial Health Authority', abbreviation: 'NCDPHA', level: 'Provincial', sector: 'Health', created_at: '2024-01-01' },
];

export const officers: Officer[] = [
  { id: 'of-001', full_name: 'John Waiko', email: 'j.waiko@works.gov.pg', phone: '675 321 4567', agency_id: 'ag-001', role: 'Procurement Officer', created_at: '2024-01-01' },
  { id: 'of-002', full_name: 'Mary Tukul', email: 'm.tukul@health.gov.pg', phone: '675 321 4568', agency_id: 'ag-002', role: 'Procurement Officer', created_at: '2024-01-01' },
  { id: 'of-003', full_name: 'Peter Kuman', email: 'p.kuman@education.gov.pg', phone: '675 321 4569', agency_id: 'ag-003', role: 'Procurement Officer', created_at: '2024-01-01' },
  { id: 'of-004', full_name: 'Susan Naru', email: 's.naru@finance.gov.pg', phone: '675 321 4570', agency_id: 'ag-004', role: 'Management', created_at: '2024-01-01' },
  { id: 'of-005', full_name: 'James Kila', email: 'j.kila@ict.gov.pg', phone: '675 321 4571', agency_id: 'ag-005', role: 'Procurement Officer', created_at: '2024-01-01' },
  { id: 'of-006', full_name: 'Anna Maru', email: 'a.maru@npc.gov.pg', phone: '675 303 8800', agency_id: 'ag-004', role: 'Admin', created_at: '2024-01-01' },
  { id: 'of-007', full_name: 'David Eri', email: 'd.eri@nra.gov.pg', phone: '675 321 4573', agency_id: 'ag-007', role: 'Procurement Officer', created_at: '2024-01-01' },
  { id: 'of-008', full_name: 'Grace Sipo', email: 'g.sipo@ppl.com.pg', phone: '675 321 4574', agency_id: 'ag-006', role: 'Procurement Officer', created_at: '2024-01-01' },
];

export const fundingSources: FundingSource[] = [
  { id: 'fs-001', name: 'GoPNG', donor_name: undefined, program_code: 'GOPNG-2026' },
  { id: 'fs-002', name: 'Own Source Revenue', donor_name: undefined, program_code: undefined },
  { id: 'fs-003', name: 'World Bank', donor_name: 'World Bank', program_code: 'WB-PNG-2026' },
  { id: 'fs-004', name: 'ADB', donor_name: 'Asian Development Bank', program_code: 'ADB-PNG-2026' },
  { id: 'fs-005', name: 'DFAT Australia', donor_name: 'Australian Government', program_code: 'DFAT-PNG-2026' },
  { id: 'fs-006', name: 'JICA', donor_name: 'Japan International Cooperation Agency', program_code: 'JICA-PNG-2026' },
  { id: 'fs-007', name: 'EU Grant', donor_name: 'European Union', program_code: 'EU-PNG-2026' },
];

export const contractors: Contractor[] = [
  {
    id: 'ct-001', legal_name: 'Curtain Brothers (PNG) Ltd', trading_name: 'Curtain Bros', ipa_registration_no: 'IPA-001234',
    tax_id: 'TIN-001234', address: 'Section 47, Gordons', province: 'NCD', district: 'Moresby North',
    contact_person: 'Michael Curtain', phone: '675 325 1234', email: 'contracts@curtainbros.com.pg',
    status: 'Active', categories: ['Works'], created_at: '2020-01-01'
  },
  {
    id: 'ct-002', legal_name: 'Ela Motors Limited', trading_name: 'Ela Motors', ipa_registration_no: 'IPA-001235',
    tax_id: 'TIN-001235', address: 'Champion Parade, Boroko', province: 'NCD', district: 'Moresby South',
    contact_person: 'Robert Gillies', phone: '675 325 2345', email: 'sales@elamotors.com.pg',
    status: 'Active', categories: ['Goods'], created_at: '2020-01-01'
  },
  {
    id: 'ct-003', legal_name: 'Deloitte PNG', trading_name: 'Deloitte', ipa_registration_no: 'IPA-001236',
    tax_id: 'TIN-001236', address: 'Deloitte Tower, Port Moresby', province: 'NCD', district: 'Moresby South',
    contact_person: 'Sarah Thompson', phone: '675 325 3456', email: 'contact@deloitte.com.pg',
    status: 'Active', categories: ['Consulting', 'Services'], created_at: '2020-01-01'
  },
  {
    id: 'ct-004', legal_name: 'Datec PNG', trading_name: 'Datec', ipa_registration_no: 'IPA-001237',
    tax_id: 'TIN-001237', address: 'Datec Centre, Waigani', province: 'NCD', district: 'Moresby North-West',
    contact_person: 'Tom Kurio', phone: '675 325 4567', email: 'sales@datec.com.pg',
    status: 'Active', categories: ['Goods', 'Services'], created_at: '2020-01-01'
  },
  {
    id: 'ct-005', legal_name: 'Consort Express Lines', trading_name: 'Consort', ipa_registration_no: 'IPA-001238',
    tax_id: 'TIN-001238', address: 'Harbour City, Lae', province: 'Morobe', district: 'Lae',
    contact_person: 'Joe Tamate', phone: '675 472 1234', email: 'logistics@consort.com.pg',
    status: 'Active', categories: ['Services'], created_at: '2020-01-01'
  },
  {
    id: 'ct-006', legal_name: 'Hornibrook NGI Ltd', trading_name: 'Hornibrook', ipa_registration_no: 'IPA-001239',
    tax_id: 'TIN-001239', address: 'Gordons Industrial', province: 'NCD', district: 'Moresby North-East',
    contact_person: 'Mark Johnson', phone: '675 325 5678', email: 'projects@hornibrook.com.pg',
    status: 'Active', categories: ['Works'], created_at: '2020-01-01'
  },
  {
    id: 'ct-007', legal_name: 'China Harbour Engineering', trading_name: 'CHEC', ipa_registration_no: 'IPA-001240',
    tax_id: 'TIN-001240', address: 'Kennedy Road, Port Moresby', province: 'NCD', district: 'Moresby South',
    contact_person: 'Wei Zhang', phone: '675 325 6789', email: 'png@chec.bj.cn',
    status: 'Active', categories: ['Works'], created_at: '2020-01-01'
  },
  {
    id: 'ct-008', legal_name: 'McKinsey & Company PNG', trading_name: 'McKinsey', ipa_registration_no: 'IPA-001241',
    tax_id: 'TIN-001241', address: 'Credit House, Port Moresby', province: 'NCD', district: 'Moresby South',
    contact_person: 'Amanda Chen', phone: '675 325 7890', email: 'png@mckinsey.com',
    status: 'Active', categories: ['Consulting'], created_at: '2021-01-01'
  },
  {
    id: 'ct-009', legal_name: 'Pacific Building Solutions', trading_name: 'PBS', ipa_registration_no: 'IPA-001242',
    tax_id: 'TIN-001242', address: '6 Mile, Lae Road', province: 'NCD', district: 'Moresby North-East',
    contact_person: 'Paul Wari', phone: '675 325 8901', email: 'contracts@pbs.com.pg',
    status: 'Suspended', categories: ['Works'], created_at: '2019-01-01'
  },
  {
    id: 'ct-010', legal_name: 'Boroko Motors', trading_name: 'Boroko Motors', ipa_registration_no: 'IPA-001243',
    tax_id: 'TIN-001243', address: 'Boroko Drive', province: 'NCD', district: 'Moresby South',
    contact_person: 'James Kora', phone: '675 325 9012', email: 'sales@borokomotors.com.pg',
    status: 'Active', categories: ['Goods'], created_at: '2020-01-01'
  },
];

// ============================================
// TENDER DATA
// ============================================

export const tenders: Tender[] = [
  {
    id: 'tn-001', tender_no: 'NPC2026-001', agency_id: 'ag-001',
    issued_date: '2026-01-15', closing_datetime: '2026-02-15T16:00:00',
    procurement_method: 'Open Tender', project_title: 'Highlands Highway Rehabilitation - Section A',
    project_description: 'Major rehabilitation works for 50km section of Highlands Highway between Goroka and Kundiawa including resurfacing, drainage improvements, and bridge repairs.',
    estimated_value: 85000000, funding_source_id: 'fs-003', status_code: 'Evaluation',
    officer_id: 'of-001', created_by: 'of-001', updated_by: 'of-001',
    created_at: '2026-01-10', updated_at: '2026-02-16'
  },
  {
    id: 'tn-002', tender_no: 'NPC2026-002', agency_id: 'ag-002',
    issued_date: '2026-01-20', closing_datetime: '2026-02-20T16:00:00',
    procurement_method: 'Open Tender', project_title: 'Medical Equipment Supply - Port Moresby General Hospital',
    project_description: 'Supply and installation of diagnostic imaging equipment including CT scanner, MRI machine, and X-ray units for PMGH upgrade project.',
    estimated_value: 15000000, funding_source_id: 'fs-005', status_code: 'Approved',
    officer_id: 'of-002', created_by: 'of-002', updated_by: 'of-002',
    created_at: '2026-01-15', updated_at: '2026-02-01'
  },
  {
    id: 'tn-003', tender_no: 'NPC2026-003', agency_id: 'ag-003',
    issued_date: '2026-01-25', closing_datetime: '2026-02-25T16:00:00',
    procurement_method: 'Open Tender', project_title: 'School Infrastructure Program - Phase 2',
    project_description: 'Construction of 20 new primary schools in remote districts of Western, Gulf, and Sandaun provinces under the Education Infrastructure Program.',
    estimated_value: 45000000, funding_source_id: 'fs-004', status_code: 'Active',
    officer_id: 'of-003', created_by: 'of-003', updated_by: 'of-003',
    created_at: '2026-01-20', updated_at: '2026-01-25'
  },
  {
    id: 'tn-004', tender_no: 'NPC2026-004', agency_id: 'ag-005',
    issued_date: '2026-01-10', closing_datetime: '2026-02-10T16:00:00',
    procurement_method: 'Restricted Tender', project_title: 'National Digital ID System',
    project_description: 'Development and implementation of a national digital identification system including biometric capture, database infrastructure, and integration with government services.',
    estimated_value: 25000000, funding_source_id: 'fs-003', status_code: 'Awarded',
    officer_id: 'of-005', created_by: 'of-005', updated_by: 'of-005',
    created_at: '2026-01-05', updated_at: '2026-02-05'
  },
  {
    id: 'tn-005', tender_no: 'NPC2026-005', agency_id: 'ag-006',
    issued_date: '2026-02-01', closing_datetime: '2026-03-01T16:00:00',
    procurement_method: 'Open Tender', project_title: 'Solar Power Installation - 10 Provincial Hospitals',
    project_description: 'Design, supply, installation, and commissioning of solar power systems with battery storage for 10 provincial hospitals.',
    estimated_value: 18000000, funding_source_id: 'fs-006', status_code: 'Issued',
    officer_id: 'of-008', created_by: 'of-008', updated_by: 'of-008',
    created_at: '2026-01-28', updated_at: '2026-02-01'
  },
  {
    id: 'tn-006', tender_no: 'NPC2026-006', agency_id: 'ag-007',
    issued_date: '2025-11-15', closing_datetime: '2025-12-15T16:00:00',
    procurement_method: 'Open Tender', project_title: 'Lae-Nadzab Highway Upgrade',
    project_description: 'Upgrade of the Lae-Nadzab highway including dualization of key sections and installation of traffic management systems.',
    estimated_value: 120000000, funding_source_id: 'fs-004', status_code: 'Awarded',
    officer_id: 'of-007', created_by: 'of-007', updated_by: 'of-007',
    created_at: '2025-11-10', updated_at: '2026-01-20'
  },
  {
    id: 'tn-007', tender_no: 'NPC2026-007', agency_id: 'ag-004',
    issued_date: '2026-01-05', closing_datetime: '2026-02-05T16:00:00',
    procurement_method: 'Restricted Tender', project_title: 'Treasury Management System Upgrade',
    project_description: 'Upgrade of the IFMS treasury management module including new payment gateway integration and enhanced reporting capabilities.',
    estimated_value: 8500000, funding_source_id: 'fs-001', status_code: 'Submitted for Approval',
    officer_id: 'of-004', created_by: 'of-004', updated_by: 'of-004',
    created_at: '2026-01-02', updated_at: '2026-02-06'
  },
  {
    id: 'tn-008', tender_no: 'NPC2025-089', agency_id: 'ag-001',
    issued_date: '2025-09-01', closing_datetime: '2025-10-01T16:00:00',
    procurement_method: 'Open Tender', project_title: 'Port Moresby Road Network Improvement',
    project_description: 'Improvement of urban roads in Port Moresby including Waigani Drive, Hubert Murray Highway, and connecting roads.',
    estimated_value: 65000000, funding_source_id: 'fs-003', status_code: 'Awarded',
    officer_id: 'of-001', created_by: 'of-001', updated_by: 'of-001',
    created_at: '2025-08-25', updated_at: '2025-12-15'
  },
  {
    id: 'tn-009', tender_no: 'NPC2026-008', agency_id: 'ag-002',
    issued_date: '2026-02-03', closing_datetime: '2026-03-03T16:00:00',
    procurement_method: 'Request for Quotation', project_title: 'Medical Supplies - Q1 2026',
    project_description: 'Supply of essential medical consumables and pharmaceuticals for provincial health facilities.',
    estimated_value: 5000000, funding_source_id: 'fs-001', status_code: 'Draft',
    officer_id: 'of-002', created_by: 'of-002', updated_by: 'of-002',
    created_at: '2026-02-01', updated_at: '2026-02-03'
  },
  {
    id: 'tn-010', tender_no: 'NPC2026-009', agency_id: 'ag-009',
    issued_date: '2026-01-28', closing_datetime: '2026-02-28T16:00:00',
    procurement_method: 'Open Tender', project_title: 'Morobe Provincial Hospital Extension',
    project_description: 'Construction of new ward buildings and upgrade of existing facilities at Angau Memorial Hospital, Lae.',
    estimated_value: 35000000, funding_source_id: 'fs-005', status_code: 'Closed',
    officer_id: 'of-002', created_by: 'of-002', updated_by: 'of-002',
    created_at: '2026-01-25', updated_at: '2026-02-28'
  },
  {
    id: 'tn-011', tender_no: 'NPC2025-095', agency_id: 'ag-005',
    issued_date: '2025-10-15', closing_datetime: '2025-11-15T16:00:00',
    procurement_method: 'Single Source', project_title: 'Government Network Infrastructure',
    project_description: 'Extension of government network backbone to connect remaining provincial capitals.',
    estimated_value: 12000000, funding_source_id: 'fs-001', status_code: 'Awarded',
    officer_id: 'of-005', created_by: 'of-005', updated_by: 'of-005',
    created_at: '2025-10-10', updated_at: '2025-12-20'
  },
  {
    id: 'tn-012', tender_no: 'NPC2026-010', agency_id: 'ag-003',
    issued_date: '2026-02-01', closing_datetime: '2026-03-15T16:00:00',
    procurement_method: 'Open Tender', project_title: 'Teacher Training Program Consultancy',
    project_description: 'Engagement of consulting firm to design and deliver national teacher training program.',
    estimated_value: 3500000, funding_source_id: 'fs-007', status_code: 'Active',
    officer_id: 'of-003', created_by: 'of-003', updated_by: 'of-003',
    created_at: '2026-01-28', updated_at: '2026-02-01'
  },
];

// ============================================
// WORKFLOW EVENTS
// ============================================

export const workflowEvents: TenderWorkflowEvent[] = [
  { id: 'we-001', tender_id: 'tn-004', event_type: 'Issued', event_datetime: '2026-01-10T09:00:00', actor_officer_id: 'of-005' },
  { id: 'we-002', tender_id: 'tn-004', event_type: 'Closed', event_datetime: '2026-02-10T16:00:00', actor_officer_id: 'of-005' },
  { id: 'we-003', tender_id: 'tn-004', event_type: 'Evaluation Started', event_datetime: '2026-02-11T09:00:00', actor_officer_id: 'of-005' },
  { id: 'we-004', tender_id: 'tn-004', event_type: 'Evaluation Completed', event_datetime: '2026-02-20T17:00:00', actor_officer_id: 'of-005' },
  { id: 'we-005', tender_id: 'tn-004', event_type: 'Submitted to TFEC', event_datetime: '2026-02-22T10:00:00', actor_officer_id: 'of-005' },
  { id: 'we-006', tender_id: 'tn-004', event_type: 'TFEC Approved', event_datetime: '2026-02-28T15:00:00', notes: 'TFEC Meeting 2026-05', actor_officer_id: 'of-006' },
  { id: 'we-007', tender_id: 'tn-004', event_type: 'Awarded', event_datetime: '2026-03-05T10:00:00', notes: 'Contract awarded to Datec PNG', actor_officer_id: 'of-005' },
  { id: 'we-008', tender_id: 'tn-006', event_type: 'Awarded', event_datetime: '2026-01-20T10:00:00', notes: 'Contract awarded to CHEC', actor_officer_id: 'of-007' },
  { id: 'we-009', tender_id: 'tn-008', event_type: 'Awarded', event_datetime: '2025-12-15T10:00:00', notes: 'Contract awarded to Curtain Bros', actor_officer_id: 'of-001' },
];

// ============================================
// CONTRACT AWARDS
// ============================================

export const contractAwards: ContractAward[] = [
  {
    id: 'ca-001', tender_id: 'tn-004', contractor_id: 'ct-004',
    award_date: '2026-03-05', contract_value: 24500000, currency: 'PGK',
    contract_no: 'CON-2026-001', commencement_date: '2026-03-15', end_date: '2028-03-14',
    status: 'Active', created_at: '2026-03-05', updated_at: '2026-03-05'
  },
  {
    id: 'ca-002', tender_id: 'tn-006', contractor_id: 'ct-007',
    award_date: '2026-01-20', contract_value: 118000000, currency: 'PGK',
    contract_no: 'CON-2026-002', commencement_date: '2026-02-01', end_date: '2029-01-31',
    status: 'Under Implementation', created_at: '2026-01-20', updated_at: '2026-02-01'
  },
  {
    id: 'ca-003', tender_id: 'tn-008', contractor_id: 'ct-001',
    award_date: '2025-12-15', contract_value: 63500000, currency: 'PGK',
    contract_no: 'CON-2025-089', commencement_date: '2026-01-02', end_date: '2027-06-30',
    status: 'Delayed', created_at: '2025-12-15', updated_at: '2026-02-01'
  },
  {
    id: 'ca-004', tender_id: 'tn-011', contractor_id: 'ct-004',
    award_date: '2025-12-20', contract_value: 11800000, currency: 'PGK',
    contract_no: 'CON-2025-095', commencement_date: '2026-01-05', end_date: '2026-12-31',
    status: 'Active', created_at: '2025-12-20', updated_at: '2026-01-05'
  },
  {
    id: 'ca-005', tender_id: 'tn-002', contractor_id: 'ct-002',
    award_date: '2026-02-01', contract_value: 14200000, currency: 'PGK',
    contract_no: 'CON-2026-003', commencement_date: '2026-02-15', end_date: '2026-08-14',
    status: 'Active', created_at: '2026-02-01', updated_at: '2026-02-15'
  },
];

// ============================================
// CONTRACT MILESTONES
// ============================================

export const contractMilestones: ContractMilestone[] = [
  // Digital ID System (ca-001)
  { id: 'cm-001', contract_award_id: 'ca-001', milestone_name: 'Project Inception & Requirements', milestone_no: 1, due_date: '2026-04-15', completion_date: undefined, status: 'In Progress', payment_percentage: 10 },
  { id: 'cm-002', contract_award_id: 'ca-001', milestone_name: 'System Design & Architecture', milestone_no: 2, due_date: '2026-06-30', status: 'Not Started', payment_percentage: 15 },
  { id: 'cm-003', contract_award_id: 'ca-001', milestone_name: 'Development Phase 1', milestone_no: 3, due_date: '2026-10-31', status: 'Not Started', payment_percentage: 20 },
  { id: 'cm-004', contract_award_id: 'ca-001', milestone_name: 'Pilot Implementation', milestone_no: 4, due_date: '2027-03-31', status: 'Not Started', payment_percentage: 20 },
  { id: 'cm-005', contract_award_id: 'ca-001', milestone_name: 'National Rollout', milestone_no: 5, due_date: '2027-12-31', status: 'Not Started', payment_percentage: 25 },
  { id: 'cm-006', contract_award_id: 'ca-001', milestone_name: 'Final Acceptance & Handover', milestone_no: 6, due_date: '2028-03-14', status: 'Not Started', payment_percentage: 10 },

  // Lae-Nadzab Highway (ca-002)
  { id: 'cm-007', contract_award_id: 'ca-002', milestone_name: 'Mobilization', milestone_no: 1, due_date: '2026-03-01', completion_date: '2026-02-25', status: 'Completed', payment_percentage: 5 },
  { id: 'cm-008', contract_award_id: 'ca-002', milestone_name: 'Section 1 - Earthworks', milestone_no: 2, due_date: '2026-06-30', status: 'In Progress', payment_percentage: 15 },
  { id: 'cm-009', contract_award_id: 'ca-002', milestone_name: 'Section 1 - Paving', milestone_no: 3, due_date: '2026-10-31', status: 'Not Started', payment_percentage: 20 },
  { id: 'cm-010', contract_award_id: 'ca-002', milestone_name: 'Section 2 - Earthworks', milestone_no: 4, due_date: '2027-03-31', status: 'Not Started', payment_percentage: 15 },
  { id: 'cm-011', contract_award_id: 'ca-002', milestone_name: 'Section 2 - Paving', milestone_no: 5, due_date: '2027-08-31', status: 'Not Started', payment_percentage: 20 },
  { id: 'cm-012', contract_award_id: 'ca-002', milestone_name: 'Final Completion', milestone_no: 6, due_date: '2029-01-31', status: 'Not Started', payment_percentage: 25 },

  // POM Road Network (ca-003)
  { id: 'cm-013', contract_award_id: 'ca-003', milestone_name: 'Mobilization', milestone_no: 1, due_date: '2026-01-31', completion_date: '2026-02-05', status: 'Completed', payment_percentage: 5 },
  { id: 'cm-014', contract_award_id: 'ca-003', milestone_name: 'Waigani Drive Section', milestone_no: 2, due_date: '2026-04-30', status: 'Overdue', payment_percentage: 25 },
  { id: 'cm-015', contract_award_id: 'ca-003', milestone_name: 'Hubert Murray Highway', milestone_no: 3, due_date: '2026-08-31', status: 'Not Started', payment_percentage: 30 },
  { id: 'cm-016', contract_award_id: 'ca-003', milestone_name: 'Connecting Roads', milestone_no: 4, due_date: '2027-01-31', status: 'Not Started', payment_percentage: 25 },
  { id: 'cm-017', contract_award_id: 'ca-003', milestone_name: 'Final Completion', milestone_no: 5, due_date: '2027-06-30', status: 'Not Started', payment_percentage: 15 },

  // Medical Equipment (ca-005)
  { id: 'cm-018', contract_award_id: 'ca-005', milestone_name: 'Equipment Order & Shipping', milestone_no: 1, due_date: '2026-03-31', status: 'In Progress', payment_percentage: 40 },
  { id: 'cm-019', contract_award_id: 'ca-005', milestone_name: 'Delivery & Customs', milestone_no: 2, due_date: '2026-05-15', status: 'Not Started', payment_percentage: 20 },
  { id: 'cm-020', contract_award_id: 'ca-005', milestone_name: 'Installation & Commissioning', milestone_no: 3, due_date: '2026-07-15', status: 'Not Started', payment_percentage: 30 },
  { id: 'cm-021', contract_award_id: 'ca-005', milestone_name: 'Training & Handover', milestone_no: 4, due_date: '2026-08-14', status: 'Not Started', payment_percentage: 10 },
];

// ============================================
// CONTRACT VARIATIONS
// ============================================

export const contractVariations: ContractVariation[] = [
  {
    id: 'cv-001', contract_award_id: 'ca-003', variation_no: 1,
    variation_date: '2026-02-15', value_delta: 2500000, time_extension_days: 45,
    reason: 'Additional drainage works required due to unexpected ground conditions on Waigani Drive',
    approved_by: 'of-001', approval_ref: 'VAR-2026-001'
  },
  {
    id: 'cv-002', contract_award_id: 'ca-002', variation_no: 1,
    variation_date: '2026-03-10', value_delta: 5000000, time_extension_days: 0,
    reason: 'Addition of traffic management equipment at intersections per revised design',
    approved_by: 'of-007', approval_ref: 'VAR-2026-002'
  },
];

// ============================================
// CONTRACT ISSUES/RISKS
// ============================================

export const contractIssuesRisks: ContractIssueRisk[] = [
  {
    id: 'ir-001', contract_award_id: 'ca-003', type: 'Issue', severity: 'High',
    description: 'Contractor experiencing material supply delays due to shipping disruptions',
    owner_officer_id: 'of-001', opened_date: '2026-02-10'
  },
  {
    id: 'ir-002', contract_award_id: 'ca-003', type: 'Issue', severity: 'Medium',
    description: 'Traffic management causing complaints from road users',
    owner_officer_id: 'of-001', opened_date: '2026-02-05'
  },
  {
    id: 'ir-003', contract_award_id: 'ca-002', type: 'Risk', severity: 'Medium',
    description: 'Wet season approaching - potential for earthworks delays in coming months',
    owner_officer_id: 'of-007', opened_date: '2026-02-20'
  },
  {
    id: 'ir-004', contract_award_id: 'ca-001', type: 'Risk', severity: 'Low',
    description: 'Technical staff availability for requirements gathering phase',
    owner_officer_id: 'of-005', opened_date: '2026-03-10'
  },
  {
    id: 'ir-005', contract_award_id: 'ca-005', type: 'Risk', severity: 'Medium',
    description: 'International shipping delays may impact equipment delivery timeline',
    owner_officer_id: 'of-002', opened_date: '2026-02-25'
  },
];

// ============================================
// APPROVALS
// ============================================

export const approvals: Approval[] = [
  { id: 'ap-001', tender_id: 'tn-004', approval_type: 'TFEC', reference_no: 'TFEC-2026-05', approval_date: '2026-02-28', decision: 'Approved' },
  { id: 'ap-002', tender_id: 'tn-006', approval_type: 'NPC Board', reference_no: 'NPC-BM-2026-01', approval_date: '2026-01-15', decision: 'Approved' },
  { id: 'ap-003', tender_id: 'tn-008', approval_type: 'NPC Board', reference_no: 'NPC-BM-2025-12', approval_date: '2025-12-10', decision: 'Approved' },
  { id: 'ap-004', tender_id: 'tn-011', approval_type: 'TFEC', reference_no: 'TFEC-2025-22', approval_date: '2025-12-15', decision: 'Approved', notes: 'Single source justification accepted' },
  { id: 'ap-005', tender_id: 'tn-002', approval_type: 'TFEC', reference_no: 'TFEC-2026-04', approval_date: '2026-02-25', decision: 'Approved' },
  { id: 'ap-006', tender_id: 'tn-007', approval_type: 'TFEC', reference_no: 'TFEC-2026-06', approval_date: '2026-02-05', decision: 'Deferred', notes: 'Additional technical evaluation requested' },
];

// ============================================
// BIDS
// ============================================

export const bids: Bid[] = [
  { id: 'bd-001', tender_id: 'tn-004', contractor_id: 'ct-004', bid_price: 24500000, received_datetime: '2026-02-10T15:30:00', is_compliant: true },
  { id: 'bd-002', tender_id: 'tn-004', contractor_id: 'ct-003', bid_price: 28000000, received_datetime: '2026-02-10T14:45:00', is_compliant: true },
  { id: 'bd-003', tender_id: 'tn-006', contractor_id: 'ct-007', bid_price: 118000000, received_datetime: '2025-12-15T16:00:00', is_compliant: true },
  { id: 'bd-004', tender_id: 'tn-006', contractor_id: 'ct-001', bid_price: 125000000, received_datetime: '2025-12-15T15:30:00', is_compliant: true },
  { id: 'bd-005', tender_id: 'tn-006', contractor_id: 'ct-006', bid_price: 135000000, received_datetime: '2025-12-15T14:00:00', is_compliant: false, notes: 'Missing required certifications' },
  { id: 'bd-006', tender_id: 'tn-008', contractor_id: 'ct-001', bid_price: 63500000, received_datetime: '2025-10-01T15:45:00', is_compliant: true },
  { id: 'bd-007', tender_id: 'tn-008', contractor_id: 'ct-006', bid_price: 68000000, received_datetime: '2025-10-01T16:00:00', is_compliant: true },
  { id: 'bd-008', tender_id: 'tn-002', contractor_id: 'ct-002', bid_price: 14200000, received_datetime: '2026-02-20T15:00:00', is_compliant: true },
  { id: 'bd-009', tender_id: 'tn-001', contractor_id: 'ct-001', bid_price: 82000000, received_datetime: '2026-02-15T15:30:00', is_compliant: true },
  { id: 'bd-010', tender_id: 'tn-001', contractor_id: 'ct-007', bid_price: 78500000, received_datetime: '2026-02-15T14:45:00', is_compliant: true },
  { id: 'bd-011', tender_id: 'tn-001', contractor_id: 'ct-006', bid_price: 88000000, received_datetime: '2026-02-15T16:00:00', is_compliant: true },
];

// ============================================
// DASHBOARD STATS
// ============================================

export const pipelineStats: PipelineStats = {
  draft: 1,
  issued: 1,
  active: 2,
  closed: 1,
  evaluation: 1,
  approval: 1,
  approved: 1,
  awarded: 4,
};

export const portfolioSummary: PortfolioSummary = {
  total_tenders: 12,
  total_awarded_value: 232000000,
  active_contracts: 5,
  completed_contracts: 0,
  contractors_count: 10,
  agencies_count: 10,
};

export const agencySpend: AgencySpend[] = [
  { agency_name: 'National Roads Authority', abbreviation: 'NRA', total_value: 118000000, contract_count: 1 },
  { agency_name: 'Department of Works', abbreviation: 'DoW', total_value: 63500000, contract_count: 1 },
  { agency_name: 'Department of ICT', abbreviation: 'DICT', total_value: 36300000, contract_count: 2 },
  { agency_name: 'Department of Health', abbreviation: 'DoH', total_value: 14200000, contract_count: 1 },
];

export const contractorAwardSummary: ContractorAwardSummary[] = [
  { contractor_name: 'China Harbour Engineering', total_awarded: 118000000, contract_count: 1, avg_rating: 4.2 },
  { contractor_name: 'Curtain Brothers (PNG) Ltd', total_awarded: 63500000, contract_count: 1, avg_rating: 3.8 },
  { contractor_name: 'Datec PNG', total_awarded: 36300000, contract_count: 2, avg_rating: 4.5 },
  { contractor_name: 'Ela Motors Limited', total_awarded: 14200000, contract_count: 1, avg_rating: 4.0 },
];

export const monthlyTrends: MonthlyTrend[] = [
  { month: '2025-09', issued: 3, closed: 2, awarded: 1, value_awarded: 45000000 },
  { month: '2025-10', issued: 4, closed: 3, awarded: 2, value_awarded: 78000000 },
  { month: '2025-11', issued: 2, closed: 2, awarded: 1, value_awarded: 35000000 },
  { month: '2025-12', issued: 1, closed: 3, awarded: 2, value_awarded: 75300000 },
  { month: '2026-01', issued: 5, closed: 4, awarded: 2, value_awarded: 132500000 },
  { month: '2026-02', issued: 3, closed: 2, awarded: 1, value_awarded: 14200000 },
];

// Helper function to get related data
export function getAgencyById(id: string): Agency | undefined {
  return agencies.find(a => a.id === id);
}

export function getOfficerById(id: string): Officer | undefined {
  return officers.find(o => o.id === id);
}

export function getFundingSourceById(id: string): FundingSource | undefined {
  return fundingSources.find(f => f.id === id);
}

export function getContractorById(id: string): Contractor | undefined {
  return contractors.find(c => c.id === id);
}

export function getTenderById(id: string): Tender | undefined {
  return tenders.find(t => t.id === id);
}

export function getContractByTenderId(tenderId: string): ContractAward | undefined {
  return contractAwards.find(c => c.tender_id === tenderId);
}

export function getMilestonesByContractId(contractId: string): ContractMilestone[] {
  return contractMilestones.filter(m => m.contract_award_id === contractId);
}

export function getVariationsByContractId(contractId: string): ContractVariation[] {
  return contractVariations.filter(v => v.contract_award_id === contractId);
}

export function getIssuesByContractId(contractId: string): ContractIssueRisk[] {
  return contractIssuesRisks.filter(i => i.contract_award_id === contractId);
}

export function getWorkflowEventsByTenderId(tenderId: string): TenderWorkflowEvent[] {
  return workflowEvents.filter(w => w.tender_id === tenderId);
}

export function getBidsByTenderId(tenderId: string): Bid[] {
  return bids.filter(b => b.tender_id === tenderId);
}

export function getApprovalsByTenderId(tenderId: string): Approval[] {
  return approvals.filter(a => a.tender_id === tenderId);
}

// Enriched data getters
export function getEnrichedTenders(): Tender[] {
  return tenders.map(t => ({
    ...t,
    agency: getAgencyById(t.agency_id),
    officer: getOfficerById(t.officer_id),
    funding_source: getFundingSourceById(t.funding_source_id),
  }));
}

export function getEnrichedContracts(): ContractAward[] {
  return contractAwards.map(c => ({
    ...c,
    tender: getTenderById(c.tender_id),
    contractor: getContractorById(c.contractor_id),
  }));
}
