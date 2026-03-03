-- ============================================
-- 2019 CONTRACT REGISTRY DATA MIGRATION
-- Generated from 2019_crs.csv
-- ============================================

-- Disable triggers temporarily for bulk insert
-- ALTER TABLE tenders DISABLE TRIGGER ALL;


-- ============================================
-- AGENCIES (17 records)
-- ============================================
INSERT INTO agencies (id, name, abbreviation, level, sector) VALUES
    ('a1002019-0000-0000-0000-000000000001', 'Department of Works and Highways', 'DoWH', 'National', 'Infrastructure'),
    ('a1002019-0000-0000-0000-000000000002', 'Tourism Promotion Authority', 'TPA', 'National', 'Other'),
    ('a1002019-0000-0000-0000-000000000003', 'Department of Treasury', 'DoT', 'National', 'Finance'),
    ('a1002019-0000-0000-0000-000000000004', 'Department of Education', 'DoE', 'National', 'Education'),
    ('a1002019-0000-0000-0000-000000000005', 'Department of Lands and Physical Planning', 'DLPP', 'National', 'Lands'),
    ('a1002019-0000-0000-0000-000000000006', 'Department of Health', 'DoH', 'National', 'Health'),
    ('a1002019-0000-0000-0000-000000000007', 'Department of Works & NEC', '', 'National', 'Infrastructure'),
    ('a1002019-0000-0000-0000-000000000008', 'National Fisheries Authority', 'NFA', 'National', 'Maritime'),
    ('a1002019-0000-0000-0000-000000000009', 'Department of Commerce & Industry', '', 'National', 'Commerce'),
    ('a1002019-0000-0000-0000-00000000000a', 'Government Printing Office', 'GPO', 'National', 'Other'),
    ('a1002019-0000-0000-0000-00000000000b', 'Hela Provincial Administration', 'HPA', 'Provincial', 'Provincial'),
    ('a1002019-0000-0000-0000-00000000000c', 'Department of Finance', 'DoF', 'National', 'Finance'),
    ('a1002019-0000-0000-0000-00000000000d', 'PNG Electoral Commission', '', 'National', 'Governance'),
    ('a1002019-0000-0000-0000-00000000000e', 'Southern Highlands Provincial Administration', '', 'Provincial', 'Lands'),
    ('a1002019-0000-0000-0000-00000000000f', 'National Maritime Safety Authority', 'NMSA', 'National', 'Maritime'),
    ('a1002019-0000-0000-0000-000000000010', 'Department of Transport', 'DoT', 'National', 'Transport'),
    ('a1002019-0000-0000-0000-000000000011', 'Eastern Highlands Provincial Health Authority', 'EHPHA', 'Provincial', 'Health')
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- FUNDING SOURCES (6 records)
-- ============================================
INSERT INTO funding_sources (id, name, donor_name) VALUES
    ('f5002019-0000-0000-0000-000000000001', 'Australian Aid', 'Australian Government (DFAT)'),
    ('f5002019-0000-0000-0000-000000000002', 'Australian Aid', 'Australian Government (DFAT)'),
    ('f5002019-0000-0000-0000-000000000003', 'World Bank', 'World Bank'),
    ('f5002019-0000-0000-0000-000000000004', 'GoPNG', NULL),
    ('f5002019-0000-0000-0000-000000000005', 'GoPNG', NULL),
    ('f5002019-0000-0000-0000-000000000006', 'Asian Development Bank', 'Asian Development Bank')
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- OFFICERS (10 records)
-- ============================================
INSERT INTO officers (id, full_name, email, agency_id, role) VALUES
    ('0f002019-0000-0000-0000-000000000001', 'Guria Verave', 'guria.verave@npc.gov.pg', 'a1002019-0000-0000-0000-000000000001', 'Procurement Officer'),
    ('0f002019-0000-0000-0000-000000000002', 'Agaru Agarobe', 'agaru.agarobe@npc.gov.pg', 'a1002019-0000-0000-0000-000000000001', 'Procurement Officer'),
    ('0f002019-0000-0000-0000-000000000003', 'Babaga Naime', 'babaga.naime@npc.gov.pg', 'a1002019-0000-0000-0000-000000000001', 'Procurement Officer'),
    ('0f002019-0000-0000-0000-000000000004', 'Guria Kinibo', 'guria.kinibo@npc.gov.pg', 'a1002019-0000-0000-0000-000000000004', 'Procurement Officer'),
    ('0f002019-0000-0000-0000-000000000005', 'Geoffrey Kinibo', 'geoffrey.kinibo@npc.gov.pg', 'a1002019-0000-0000-0000-000000000004', 'Procurement Officer'),
    ('0f002019-0000-0000-0000-000000000006', 'Ernest Tunama', 'ernest.tunama@npc.gov.pg', 'a1002019-0000-0000-0000-000000000005', 'Procurement Officer'),
    ('0f002019-0000-0000-0000-000000000007', 'Frank Hare', 'frank.hare@npc.gov.pg', 'a1002019-0000-0000-0000-000000000007', 'Procurement Officer'),
    ('0f002019-0000-0000-0000-000000000008', 'Wanom Nothsman', 'wanom.nothsman@npc.gov.pg', 'a1002019-0000-0000-0000-000000000008', 'Procurement Officer'),
    ('0f002019-0000-0000-0000-000000000009', 'Hane Hekwa', 'hane.hekwa@npc.gov.pg', 'a1002019-0000-0000-0000-00000000000c', 'Procurement Officer'),
    ('0f002019-0000-0000-0000-00000000000a', 'Veari Hitolo', 'veari.hitolo@npc.gov.pg', 'a1002019-0000-0000-0000-000000000009', 'Procurement Officer')
ON CONFLICT (email) DO NOTHING;

-- ============================================
-- CONTRACTORS (35 records)
-- ============================================
INSERT INTO contractors (id, legal_name, trading_name, address, province, contact_person, phone, email, status, categories) VALUES
    ('c1002019-0000-0000-0000-000000000001', 'Global Construction Limited', 'Global Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000002', 'G-Man Construction Limited', 'G-Man Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000003', 'Classic Eng & Construction Limited', 'Classic Eng & Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000004', 'Regional Engineering Construction', 'Regional Engineering Construction', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000005', 'CCECC (PNG) Limited', 'CCECC (PNG) Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000006', 'Express Customs Limited', 'Express Customs Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000007', 'Subaru Limited', 'Subaru Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000008', 'Vessi Contractor', 'Vessi Contractor', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000009', 'Captured Procurement Solution Limited', 'Captured Procurement Solution Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-00000000000a', 'Target Trading Limited', 'Target Trading Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c1002019-0000-0000-0000-00000000000b', 'World Vision Australia', 'World Vision Australia', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-00000000000c', 'Clean Green Energy Limited', 'Clean Green Energy Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-00000000000d', 'MH Supplies Limited', 'MH Supplies Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c1002019-0000-0000-0000-00000000000e', 'Melanesian Publishing Haus', 'Melanesian Publishing Haus', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-00000000000f', 'Maho Media Limited', 'Maho Media Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000010', 'Mita Ellison (Consultant)', 'Mita Ellison (Consultant)', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting']),
    ('c1002019-0000-0000-0000-000000000011', 'Mobile Works Limited', 'Mobile Works Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000012', 'Tari Pori Development Corporation', 'Tari Pori Development Corporation', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000013', 'St. Maintenance & Cleaning Contractors Limited', 'St. Maintenance & Cleaning Contractors Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000014', 'Pacific Building Industries Ltd', 'Pacific Building Industries Ltd', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000015', 'Construct Oceanic Limited', 'Construct Oceanic Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000016', 'NBC Limited', 'NBC Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000017', 'China Shenyang International Economic & Technical Corporation Ltd', 'China Shenyang International Economic & Technical Corporation Ltd', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000018', 'Essar Projects', 'Essar Projects', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000019', 'Dekenai Construction Limited', 'Dekenai Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-00000000001a', 'AD Engineering Limited', 'AD Engineering Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-00000000001b', 'JBS Consulting Engineers', 'JBS Consulting Engineers', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting']),
    ('c1002019-0000-0000-0000-00000000001c', 'Torben Mikkelsen', 'Torben Mikkelsen', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-00000000001d', 'Sundar Suntharesan', 'Sundar Suntharesan', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-00000000001e', 'NBC Ltd (JV) TP Solution Limited', 'NBC Ltd (JV) TP Solution Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-00000000001f', 'Ipwenz Construction Limited', 'Ipwenz Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000020', 'China Railway International Group Co.Limited', 'China Railway International Group Co.Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000021', 'Covec (PNG) Limited', 'Covec (PNG) Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000022', 'China Shenyang International Corporation (PNG) Limited', 'China Shenyang International Corporation (PNG) Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002019-0000-0000-0000-000000000023', 'EJ Sisters Limited', 'EJ Sisters Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works'])
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- TENDERS (66 records)
-- ============================================

-- Tender: NPC2019-31
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000001',
    'NPC2019-31',
    'a1002019-0000-0000-0000-000000000001',
    '2020-03-04',
    '2020-03-04 10:00:00+10',
    'Open Tender',
    'Long Term Maintenance on the Magi Highway from Goilanai Bridge (Ch00+00) to Gidisu (Ch127+00)',
    'Long Term Maintenance on the Magi Highway from Goilanai Bridge (Ch00+00) to Gidisu (Ch127+00)',
    4,
    'f5002019-0000-0000-0000-000000000001',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-31
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000001',
    '10002019-0000-0000-0000-000000000001',
    'c1002019-0000-0000-0000-000000000001',
    '2020-03-04',
    38470850,
    'PGK',
    'CON-NPC2019-31',
    '2020-03-04',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-32
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000002',
    'NPC2019-32',
    'a1002019-0000-0000-0000-000000000001',
    '2020-03-04',
    '2020-03-04 10:00:00+10',
    'Open Tender',
    'Long Term Maintenance on the Boluminsky Highway from Kavieng (Ch00+00 to Poropop (Ch338+00)',
    'Long Term Maintenance on the Boluminsky Highway from Kavieng (Ch00+00 to Poropop (Ch338+00)',
    4,
    'f5002019-0000-0000-0000-000000000001',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-32
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000002',
    '10002019-0000-0000-0000-000000000002',
    'c1002019-0000-0000-0000-000000000002',
    '2020-03-04',
    50948912.08,
    'PGK',
    'CON-NPC2019-32',
    '2020-03-04',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-33
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000003',
    'NPC2019-33',
    'a1002019-0000-0000-0000-000000000001',
    '2019-01-01',
    NULL,
    'Open Tender',
    'Long Term Maintenance on the West Coast Road from Boluminsky Intersection (Ch00+00) to Fangalawa Junction (Ch198+00)',
    'Long Term Maintenance on the West Coast Road from Boluminsky Intersection (Ch00+00) to Fangalawa Junction (Ch198+00)',
    NULL,
    'f5002019-0000-0000-0000-000000000001',
    'Submitted for Approval',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-34
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000004',
    'NPC2019-34',
    'a1002019-0000-0000-0000-000000000001',
    '2019-01-01',
    NULL,
    'Open Tender',
    'Long Term Maintenance on the New Britain Highway from Works Junction (Ch00+00) to Pandi River (Ch240+00)',
    'Long Term Maintenance on the New Britain Highway from Works Junction (Ch00+00) to Pandi River (Ch240+00)',
    NULL,
    'f5002019-0000-0000-0000-000000000002',
    'Submitted for Approval',
    '0f002019-0000-0000-0000-000000000002',
    '0f002019-0000-0000-0000-000000000002',
    '0f002019-0000-0000-0000-000000000002'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-35
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000005',
    'NPC2019-35',
    'a1002019-0000-0000-0000-000000000002',
    '2019-01-01',
    NULL,
    'Open Tender',
    'Tourism Sector Development Project - World Bank - Project Manager Consultancy',
    'Tourism Sector Development Project - World Bank - Project Manager Consultancy',
    NULL,
    'f5002019-0000-0000-0000-000000000003',
    'Cancelled',
    '0f002019-0000-0000-0000-000000000002',
    '0f002019-0000-0000-0000-000000000002',
    '0f002019-0000-0000-0000-000000000002'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-36
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000006',
    'NPC2019-36',
    'a1002019-0000-0000-0000-000000000001',
    '2020-01-23',
    '2020-01-23 10:00:00+10',
    'Open Tender',
    'Resealing of the New Britain Highway from Kokopo Secondary School (Ch00+00) to Vudal University (Ch36+00)',
    'Resealing of the New Britain Highway from Kokopo Secondary School (Ch00+00) to Vudal University (Ch36+00)',
    9599790.85,
    'f5002019-0000-0000-0000-000000000001',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-36
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000003',
    '10002019-0000-0000-0000-000000000006',
    'c1002019-0000-0000-0000-000000000002',
    '2020-01-23',
    9365265.8,
    'PGK',
    'CON-NPC2019-36',
    '2020-01-23',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-37
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000007',
    'NPC2019-37',
    'a1002019-0000-0000-0000-000000000001',
    '2020-01-23',
    '2020-01-23 10:00:00+10',
    'Open Tender',
    'Long Term Maintenance on the Wau Highway from 9 Mile Junction to Pine Top Bridge (CH111.280km) in Morobe Province.',
    'Long Term Maintenance on the Wau Highway from 9 Mile Junction to Pine Top Bridge (CH111.280km) in Morobe Province.',
    60417237.1,
    'f5002019-0000-0000-0000-000000000001',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-37
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000004',
    '10002019-0000-0000-0000-000000000007',
    'c1002019-0000-0000-0000-000000000003',
    '2020-01-23',
    64996036.8,
    'PGK',
    'CON-NPC2019-37',
    '2020-01-23',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-38
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000008',
    'NPC2019-38',
    'a1002019-0000-0000-0000-000000000001',
    '2019-01-01',
    NULL,
    'Open Tender',
    'Design and Build for New Dining Hall',
    'Design and Build for New Dining Hall',
    4,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000003',
    '0f002019-0000-0000-0000-000000000003',
    '0f002019-0000-0000-0000-000000000003'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-38
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000005',
    '10002019-0000-0000-0000-000000000008',
    'c1002019-0000-0000-0000-000000000004',
    '2019-12-31',
    17382844.66,
    'PGK',
    'CON-NPC2019-38',
    '2019-12-31',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-39
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000009',
    'NPC2019-39',
    'a1002019-0000-0000-0000-000000000003',
    '2019-01-01',
    NULL,
    'Single Source',
    'Procurement of Sovereign Bond Issue',
    'Procurement of Sovereign Bond Issue',
    NULL,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000003',
    '0f002019-0000-0000-0000-000000000003',
    '0f002019-0000-0000-0000-000000000003'
) ON CONFLICT (tender_no) DO NOTHING;

-- Approval for NPC2019-39
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-000000000006',
    '10002019-0000-0000-0000-000000000009',
    'NPC Board',
    'BM-11/2019',
    '2019-08-29',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-40
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000000a',
    'NPC2019-40',
    'a1002019-0000-0000-0000-000000000001',
    '2019-09-20',
    '2019-09-20 10:00:00+10',
    'Open Tender',
    'Upgrade and Sealing and Associated Works from Halimbu to Koroba (28km)',
    'Upgrade and Sealing and Associated Works from Halimbu to Koroba (28km)',
    22,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-40
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000006',
    '10002019-0000-0000-0000-00000000000a',
    'c1002019-0000-0000-0000-000000000005',
    '2020-04-09',
    88894105.63,
    'PGK',
    'CON-NPC2019-40',
    '2020-04-09',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-40
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-000000000007',
    '10002019-0000-0000-0000-00000000000a',
    'NPC Board',
    'BM-03/2020',
    '2020-04-09',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-41
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000000b',
    'NPC2019-41',
    'a1002019-0000-0000-0000-000000000004',
    '2019-10-08',
    '2019-10-08 10:00:00+10',
    'Open Tender',
    'Delivery of Teaching & Learning Component materials procured under the TFF policy for Elementary, Primary and Secondary Schools in the Southern Region',
    'Delivery of Teaching & Learning Component materials procured under the TFF policy for Elementary, Primary and Secondary Schools in the Southern Region',
    4120000,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000004',
    '0f002019-0000-0000-0000-000000000004',
    '0f002019-0000-0000-0000-000000000004'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-41
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000007',
    '10002019-0000-0000-0000-00000000000b',
    'c1002019-0000-0000-0000-000000000006',
    '2019-11-12',
    4120000,
    'PGK',
    'CON-NPC2019-41',
    '2019-11-12',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-41
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-000000000008',
    '10002019-0000-0000-0000-00000000000b',
    'NPC Board',
    '12th Nov/2019 @ SM No: 02/2019',
    '2019-11-12',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-42
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000000c',
    'NPC2019-42',
    'a1002019-0000-0000-0000-000000000004',
    '2019-10-08',
    '2019-10-08 10:00:00+10',
    'Open Tender',
    'Delivery of Teaching & Learning Component Materials procured under the TFF Policy for Elementary, Primary and Secondary Schools in the Momase Region',
    'Delivery of Teaching & Learning Component Materials procured under the TFF Policy for Elementary, Primary and Secondary Schools in the Momase Region',
    4730000,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-42
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000008',
    '10002019-0000-0000-0000-00000000000c',
    'c1002019-0000-0000-0000-000000000007',
    '2019-11-12',
    4730000,
    'PGK',
    'CON-NPC2019-42',
    '2019-11-12',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-42
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-000000000009',
    '10002019-0000-0000-0000-00000000000c',
    'NPC Board',
    '12th Nov/2019 @ SM No: 02/2019',
    '2019-11-12',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-43
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000000d',
    'NPC2019-43',
    'a1002019-0000-0000-0000-000000000004',
    '2019-10-08',
    '2019-10-08 10:00:00+10',
    'Open Tender',
    'Delivery of Teaching & Learning Component Materials procured under the TFF Policy for Elementay, Primary and Secondary Schools in the New Guinea Islands Region',
    'Delivery of Teaching & Learning Component Materials procured under the TFF Policy for Elementay, Primary and Secondary Schools in the New Guinea Islands Region',
    3280500,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-43
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000009',
    '10002019-0000-0000-0000-00000000000d',
    'c1002019-0000-0000-0000-000000000008',
    '2019-11-12',
    3280500,
    'PGK',
    'CON-NPC2019-43',
    '2019-11-12',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-43
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-00000000000a',
    '10002019-0000-0000-0000-00000000000d',
    'NPC Board',
    '12th Nov/2019 @ SM No: 02/2019',
    '2019-11-12',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-44
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000000e',
    'NPC2019-44',
    'a1002019-0000-0000-0000-000000000004',
    '2019-10-08',
    '2019-10-08 10:00:00+10',
    'Open Tender',
    'Delivery of Teaching & Learning Component Materials procured under the TFF Policy for Elementary, Primary and Secondary Schools in the Highlands, Western end Region',
    'Delivery of Teaching & Learning Component Materials procured under the TFF Policy for Elementary, Primary and Secondary Schools in the Highlands, Western end Region',
    3172960,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-44
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-00000000000a',
    '10002019-0000-0000-0000-00000000000e',
    'c1002019-0000-0000-0000-000000000009',
    '2019-11-12',
    3172960,
    'PGK',
    'CON-NPC2019-44',
    '2019-11-12',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-44
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-00000000000b',
    '10002019-0000-0000-0000-00000000000e',
    'NPC Board',
    '12th Nov/2019 @ SM No: 02/2019',
    '2019-11-12',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-45
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000000f',
    'NPC2019-45',
    'a1002019-0000-0000-0000-000000000004',
    '2019-10-08',
    '2019-10-08 10:00:00+10',
    'Open Tender',
    'Delivery of Teaching & Learning Component Materials procured under the TFF Policy for Elementary, Primary and Secondary Schools in the Highlands, Eastern end Region',
    'Delivery of Teaching & Learning Component Materials procured under the TFF Policy for Elementary, Primary and Secondary Schools in the Highlands, Eastern end Region',
    2399200,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-45
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-00000000000b',
    '10002019-0000-0000-0000-00000000000f',
    'c1002019-0000-0000-0000-00000000000a',
    '2019-11-12',
    2399200,
    'PGK',
    'CON-NPC2019-45',
    '2019-11-12',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-45
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-00000000000c',
    '10002019-0000-0000-0000-00000000000f',
    'NPC Board',
    '12th Nov/2019 @ SM No: 02/2019',
    '2019-11-12',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-46
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000010',
    'NPC2019-46',
    'a1002019-0000-0000-0000-000000000005',
    '2020-06-30',
    '2020-06-30 10:00:00+10',
    'Open Tender',
    'Consultancy Services to LEAP Project',
    'Consultancy Services to LEAP Project',
    1.7,
    'f5002019-0000-0000-0000-000000000004',
    'Closed',
    '0f002019-0000-0000-0000-000000000006',
    '0f002019-0000-0000-0000-000000000006',
    '0f002019-0000-0000-0000-000000000006'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-47
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000011',
    'NPC2019-47',
    'a1002019-0000-0000-0000-000000000006',
    '2019-01-01',
    NULL,
    'Open Tender',
    'Emergency Tuberculosis Project',
    'Emergency Tuberculosis Project',
    NULL,
    'f5002019-0000-0000-0000-000000000003',
    'Awarded',
    '0f002019-0000-0000-0000-000000000003',
    '0f002019-0000-0000-0000-000000000003',
    '0f002019-0000-0000-0000-000000000003'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-47
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-00000000000c',
    '10002019-0000-0000-0000-000000000011',
    'c1002019-0000-0000-0000-00000000000b',
    '2019-12-31',
    9802000,
    'PGK',
    'CON-NPC2019-47',
    '2019-12-31',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-48
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000012',
    'NPC2019-48',
    'a1002019-0000-0000-0000-000000000007',
    '2019-11-28',
    '2019-11-28 10:00:00+10',
    'Open Tender',
    'Refurbishment of Sir Manasupe Haus',
    'Refurbishment of Sir Manasupe Haus',
    5,
    'f5002019-0000-0000-0000-000000000004',
    'On Hold',
    '0f002019-0000-0000-0000-000000000007',
    '0f002019-0000-0000-0000-000000000007',
    '0f002019-0000-0000-0000-000000000007'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-49
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000013',
    'NPC2019-49',
    'a1002019-0000-0000-0000-000000000008',
    '2019-12-05',
    '2019-12-05 10:00:00+10',
    'Open Tender',
    'New NFA HQ Office Fit-out, Corner of Douglas Street & Musgrave Street, Port Moresby',
    'New NFA HQ Office Fit-out, Corner of Douglas Street & Musgrave Street, Port Moresby',
    16,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000008',
    '0f002019-0000-0000-0000-000000000008',
    '0f002019-0000-0000-0000-000000000008'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-49
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-00000000000d',
    '10002019-0000-0000-0000-000000000013',
    'c1002019-0000-0000-0000-00000000000c',
    '2020-03-13',
    14359559.77,
    'PGK',
    'CON-NPC2019-49',
    '2020-03-13',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-49
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-00000000000d',
    '10002019-0000-0000-0000-000000000013',
    'NPC Board',
    'BM-02/2020',
    '2020-03-13',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-50
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000014',
    'NPC2019-50',
    'a1002019-0000-0000-0000-000000000004',
    '2019-11-14',
    '2019-11-14 10:00:00+10',
    'Open Tender',
    'Purchase and Supply of Elementary English and Mathematics Lesson and Activity books to Department of Education, Curriculum Development Division, Wardstrip, Waigani',
    'Purchase and Supply of Elementary English and Mathematics Lesson and Activity books to Department of Education, Curriculum Development Division, Wardstrip, Waigani',
    3536498.55,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-50
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-00000000000e',
    '10002019-0000-0000-0000-000000000014',
    'c1002019-0000-0000-0000-00000000000d',
    '2019-12-12',
    3536498.55,
    'PGK',
    'CON-NPC2019-50',
    '2019-12-12',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-50
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-00000000000e',
    '10002019-0000-0000-0000-000000000014',
    'NPC Board',
    'BM-15/2019',
    '2019-12-12',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-51
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000015',
    'NPC2019-51',
    'a1002019-0000-0000-0000-000000000004',
    '2019-11-14',
    '2019-11-14 10:00:00+10',
    'Open Tender',
    'Purchase and supply Primary Science Experiment Kit to Department of Education, Curriculum Development Division, Wardstrip, Waigani',
    'Purchase and supply Primary Science Experiment Kit to Department of Education, Curriculum Development Division, Wardstrip, Waigani',
    2449118.32,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-51
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-00000000000f',
    '10002019-0000-0000-0000-000000000015',
    'c1002019-0000-0000-0000-00000000000d',
    '2019-12-12',
    2449118.32,
    'PGK',
    'CON-NPC2019-51',
    '2019-12-12',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-51
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-00000000000f',
    '10002019-0000-0000-0000-000000000015',
    'NPC Board',
    'BM-15/2019',
    '2019-12-12',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-52
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000016',
    'NPC2019-52',
    'a1002019-0000-0000-0000-000000000004',
    '2019-11-14',
    '2019-11-14 10:00:00+10',
    'Open Tender',
    'Printing and Supply of Standards Based Curriculum Grades 9 to 12 Teachers Guides to Department of Education, Curriculum Development Division, wardstrip, Waigani',
    'Printing and Supply of Standards Based Curriculum Grades 9 to 12 Teachers Guides to Department of Education, Curriculum Development Division, wardstrip, Waigani',
    4246500,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-52
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000010',
    '10002019-0000-0000-0000-000000000016',
    'c1002019-0000-0000-0000-00000000000d',
    '2019-12-12',
    4240500,
    'PGK',
    'CON-NPC2019-52',
    '2019-12-12',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-52
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-000000000010',
    '10002019-0000-0000-0000-000000000016',
    'NPC Board',
    'BM-15/2019',
    '2019-12-12',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-53
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000017',
    'NPC2019-53',
    'a1002019-0000-0000-0000-000000000004',
    '2019-11-14',
    '2019-11-14 10:00:00+10',
    'Open Tender',
    'Printing and Supply of Standards Based Curriculum Grades 9 to 1 Syllabuses to Department of Education, Curriculum Develoment Division, Wardstrip, Waigani',
    'Printing and Supply of Standards Based Curriculum Grades 9 to 1 Syllabuses to Department of Education, Curriculum Develoment Division, Wardstrip, Waigani',
    1388200,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-53
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000011',
    '10002019-0000-0000-0000-000000000017',
    'c1002019-0000-0000-0000-00000000000e',
    '2019-12-12',
    1388200,
    'PGK',
    'CON-NPC2019-53',
    '2019-12-12',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-53
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-000000000011',
    '10002019-0000-0000-0000-000000000017',
    'NPC Board',
    'BM-15/2019',
    '2019-12-12',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-54
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000018',
    'NPC2019-54',
    'a1002019-0000-0000-0000-000000000004',
    '2019-11-14',
    '2019-11-14 10:00:00+10',
    'Open Tender',
    'Printing and Supply of Grades 4 to 6 Citizenship and Christian Values Education syllabuses and Teachers Guides to Department of Education, curriculum Developmen Division, Waigani',
    'Printing and Supply of Grades 4 to 6 Citizenship and Christian Values Education syllabuses and Teachers Guides to Department of Education, curriculum Developmen Division, Waigani',
    3346240,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-54
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000012',
    '10002019-0000-0000-0000-000000000018',
    'c1002019-0000-0000-0000-00000000000f',
    '2019-12-12',
    3346240,
    'PGK',
    'CON-NPC2019-54',
    '2019-12-12',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-54
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-000000000012',
    '10002019-0000-0000-0000-000000000018',
    'NPC Board',
    'BM-15/2019',
    '2019-12-12',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-55
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000019',
    'NPC2019-55',
    'a1002019-0000-0000-0000-000000000003',
    '2019-11-01',
    '2019-11-01 10:00:00+10',
    'Open Tender',
    'Engagement of Overseas Technical Experts for Commission of Inquiry Duties in PNG',
    'Engagement of Overseas Technical Experts for Commission of Inquiry Duties in PNG',
    18,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000003',
    '0f002019-0000-0000-0000-000000000003',
    '0f002019-0000-0000-0000-000000000003'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-55
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000013',
    '10002019-0000-0000-0000-000000000019',
    'c1002019-0000-0000-0000-000000000010',
    '2019-12-12',
    18000000,
    'PGK',
    'CON-NPC2019-55',
    '2019-12-12',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-55
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-000000000013',
    '10002019-0000-0000-0000-000000000019',
    'NPC Board',
    'BM-15/2019',
    '2019-12-12',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-56
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000001a',
    'NPC2019-56',
    'a1002019-0000-0000-0000-000000000009',
    '2020-02-21',
    '2020-02-21 10:00:00+10',
    'Open Tender',
    'PMIZ Business Case Analysis',
    'PMIZ Business Case Analysis',
    21,
    'f5002019-0000-0000-0000-000000000004',
    'Cancelled',
    '0f002019-0000-0000-0000-000000000007',
    '0f002019-0000-0000-0000-000000000007',
    '0f002019-0000-0000-0000-000000000007'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-57
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000001b',
    'NPC2019-57',
    'a1002019-0000-0000-0000-00000000000a',
    '2020-01-21',
    '2020-01-21 10:00:00+10',
    'Open Tender',
    'Civil Works for Government Printing Office Staff Home Ownership Project',
    'Civil Works for Government Printing Office Staff Home Ownership Project',
    2.7,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000007',
    '0f002019-0000-0000-0000-000000000007',
    '0f002019-0000-0000-0000-000000000007'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-57
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000014',
    '10002019-0000-0000-0000-00000000001b',
    'c1002019-0000-0000-0000-000000000011',
    '2020-01-21',
    2440000,
    'PGK',
    'CON-NPC2019-57',
    '2020-01-21',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-58
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000001c',
    'NPC2019-58',
    'a1002019-0000-0000-0000-00000000000b',
    '2019-12-19',
    '2019-12-19 10:00:00+10',
    'Open Tender',
    'Construction of the proposed Koroba Mobile Squad Police Barracks Development at Koroba Station in Hela Province.',
    'Construction of the proposed Koroba Mobile Squad Police Barracks Development at Koroba Station in Hela Province.',
    19,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-58
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000015',
    '10002019-0000-0000-0000-00000000001c',
    'c1002019-0000-0000-0000-000000000012',
    '2020-04-09',
    9957584.77,
    'PGK',
    'CON-NPC2019-58',
    '2020-04-09',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-58
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-000000000015',
    '10002019-0000-0000-0000-00000000001c',
    'NPC Board',
    'BM-03/2020',
    '2020-04-09',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-59
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000001d',
    'NPC2019-59',
    'a1002019-0000-0000-0000-00000000000b',
    '2019-12-19',
    '2019-12-19 10:00:00+10',
    'Open Tender',
    'Construction of the Proposed Hela Provincial Police Head Quarters at Tari, Hela Province',
    'Construction of the Proposed Hela Provincial Police Head Quarters at Tari, Hela Province',
    19,
    'f5002019-0000-0000-0000-000000000004',
    'Submitted for Approval',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-60
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000001e',
    'NPC2019-60',
    'a1002019-0000-0000-0000-00000000000c',
    '2020-03-10',
    '2020-03-10 10:00:00+10',
    'Open Tender',
    'Vulupindi Haus Cleaning Services',
    'Vulupindi Haus Cleaning Services',
    1,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000009',
    '0f002019-0000-0000-0000-000000000009',
    '0f002019-0000-0000-0000-000000000009'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-60
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000016',
    '10002019-0000-0000-0000-00000000001e',
    'c1002019-0000-0000-0000-000000000013',
    '2020-03-10',
    674800,
    'PGK',
    'CON-NPC2019-60',
    '2020-03-10',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-61
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000001f',
    'NPC2019-61',
    'a1002019-0000-0000-0000-00000000000b',
    '2019-12-19',
    '2019-12-19 10:00:00+10',
    'Open Tender',
    'Design and Construction of Sir Yuwi Memorial Secondary School in Tari, Hela Province',
    'Design and Construction of Sir Yuwi Memorial Secondary School in Tari, Hela Province',
    9981187.76,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-61
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000017',
    '10002019-0000-0000-0000-00000000001f',
    'c1002019-0000-0000-0000-000000000014',
    '2020-04-09',
    998187.76,
    'PGK',
    'CON-NPC2019-61',
    '2020-04-09',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-61
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-000000000017',
    '10002019-0000-0000-0000-00000000001f',
    'NPC Board',
    'BM-03/2020',
    '2020-04-09',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-62
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000020',
    'NPC2019-62',
    'a1002019-0000-0000-0000-00000000000d',
    '2019-01-01',
    NULL,
    'Open Tender',
    'Procurement of Biometric Voter Registration System',
    'Procurement of Biometric Voter Registration System',
    NULL,
    NULL,
    'Cancelled',
    '0f002019-0000-0000-0000-000000000007',
    '0f002019-0000-0000-0000-000000000007',
    '0f002019-0000-0000-0000-000000000007'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-63
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000021',
    'NPC2019-63',
    'a1002019-0000-0000-0000-000000000001',
    '2019-01-01',
    NULL,
    'Open Tender',
    'Consultancy for Preparation of Detailed Project Report for Construction of Roads in PNG from Kimbe to Hoskins, WNBP and Baiyer to Madang WHP to Madang Province',
    'Consultancy for Preparation of Detailed Project Report for Construction of Roads in PNG from Kimbe to Hoskins, WNBP and Baiyer to Madang WHP to Madang Province',
    NULL,
    NULL,
    'Closed',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-71
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000022',
    'NPC2019-71',
    'a1002019-0000-0000-0000-000000000001',
    '2020-05-15',
    '2020-05-15 10:00:00+10',
    'Open Tender',
    'Engineering Procurement & Construction and Financing of Kiburu Junction (Mendi) to Nipa Secondary in the SHP.',
    'Engineering Procurement & Construction and Financing of Kiburu Junction (Mendi) to Nipa Secondary in the SHP.',
    24,
    'f5002019-0000-0000-0000-000000000005',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-71
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000018',
    '10002019-0000-0000-0000-000000000022',
    'c1002019-0000-0000-0000-000000000015',
    '2020-05-15',
    221851364.25,
    'PGK',
    'CON-NPC2019-71',
    '2020-05-15',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-72
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000023',
    'NPC2019-72',
    'a1002019-0000-0000-0000-000000000009',
    '2020-03-05',
    '2020-03-05 10:00:00+10',
    'Open Tender',
    'Second baseline survey on the PNG SME access to Finance Project IDA',
    'Second baseline survey on the PNG SME access to Finance Project IDA',
    5,
    'f5002019-0000-0000-0000-000000000003',
    'Submitted for Approval',
    '0f002019-0000-0000-0000-00000000000a',
    '0f002019-0000-0000-0000-00000000000a',
    '0f002019-0000-0000-0000-00000000000a'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-73
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000024',
    'NPC2019-73',
    'a1002019-0000-0000-0000-00000000000e',
    '2020-05-07',
    '2020-05-07 10:00:00+10',
    'Open Tender',
    '3x Storey Seat of Good Governance Building in Mendi SHP.',
    '3x Storey Seat of Good Governance Building in Mendi SHP.',
    40,
    'f5002019-0000-0000-0000-000000000004',
    'Submitted for Approval',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-01
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000025',
    'NPC2019-01',
    'a1002019-0000-0000-0000-000000000009',
    '2019-02-21',
    '2019-02-21 10:00:00+10',
    'Open Tender',
    'Re-gravellimg and re-sealing works from Yekimbole - Aripmo CH.00 - CH.01 - East Sepik Province',
    'Re-gravellimg and re-sealing works from Yekimbole - Aripmo CH.00 - CH.01 - East Sepik Province',
    9176924.9,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-01
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000019',
    '10002019-0000-0000-0000-000000000025',
    'c1002019-0000-0000-0000-000000000017',
    '2019-05-17',
    9176924.9,
    'PGK',
    'CON-NPC2019-01',
    '2019-05-17',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-01
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-00000000001a',
    '10002019-0000-0000-0000-000000000025',
    'NPC Board',
    'BM-03/2019',
    '2019-05-17',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-02
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000026',
    'NPC2019-02',
    'a1002019-0000-0000-0000-000000000009',
    '2020-06-16',
    '2020-06-16 10:00:00+10',
    'Open Tender',
    'Design and Construction of a New 4 Storey Building and associated works in Jiwaka Province',
    'Design and Construction of a New 4 Storey Building and associated works in Jiwaka Province',
    294.24,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-02
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-00000000001a',
    '10002019-0000-0000-0000-000000000026',
    'c1002019-0000-0000-0000-000000000018',
    '2020-06-16',
    219394722,
    'PGK',
    'CON-NPC2019-02',
    '2020-06-16',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-03
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000027',
    'NPC2019-03',
    'a1002019-0000-0000-0000-00000000000f',
    '2019-01-01',
    NULL,
    'Open Tender',
    'ADB Loan 2978(SF) Maritime Waterways Safety Project - Navaids Replacement and Installation Work Package 4 (New Britain Province) Contract.',
    'ADB Loan 2978(SF) Maritime Waterways Safety Project - Navaids Replacement and Installation Work Package 4 (New Britain Province) Contract.',
    NULL,
    'f5002019-0000-0000-0000-000000000006',
    'Cancelled',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-04
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000028',
    'NPC2019-04',
    'a1002019-0000-0000-0000-00000000000f',
    '2019-01-01',
    NULL,
    'Open Tender',
    'ADB Loan 2978(SF) Maritime Waterways Safety Project - Navaids Replacement and Installation Work Package 4 (New Britain Province) Contract.',
    'ADB Loan 2978(SF) Maritime Waterways Safety Project - Navaids Replacement and Installation Work Package 4 (New Britain Province) Contract.',
    NULL,
    'f5002019-0000-0000-0000-000000000006',
    'Cancelled',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-05
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000029',
    'NPC2019-05',
    'a1002019-0000-0000-0000-000000000010',
    '2019-10-29',
    '2019-10-29 10:00:00+10',
    'Open Tender',
    'Shipping Franchise Contracts-Northwest Coast, Manus Province.',
    'Shipping Franchise Contracts-Northwest Coast, Manus Province.',
    2.25,
    'f5002019-0000-0000-0000-000000000004',
    'Closed',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-06
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000002a',
    'NPC2019-06',
    'a1002019-0000-0000-0000-000000000010',
    '2019-10-29',
    '2019-10-29 10:00:00+10',
    'Open Tender',
    'Shipping Franchise Contracts - Mainland Coastline at Manus Province.',
    'Shipping Franchise Contracts - Mainland Coastline at Manus Province.',
    2.25,
    'f5002019-0000-0000-0000-000000000004',
    'Closed',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-07
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000002b',
    'NPC2019-07',
    'a1002019-0000-0000-0000-000000000001',
    '2019-06-14',
    '2019-06-14 10:00:00+10',
    'Open Tender',
    'Long Term Performance Based Road Maintenance Services & Restoration Works from Togoba Junction to Wapenamanda Council Chamber (56.35 km) Section of Enga Highway between Western Highlands and Enga Prov',
    'Long Term Performance Based Road Maintenance Services & Restoration Works from Togoba Junction to Wapenamanda Council Chamber (56.35 km) Section of Enga Highway between Western Highlands and Enga Province.',
    14,
    'f5002019-0000-0000-0000-000000000004',
    'Submitted for Approval',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-08
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000002c',
    'NPC2019-08',
    'a1002019-0000-0000-0000-000000000001',
    '2019-06-14',
    '2019-06-14 10:00:00+10',
    'Open Tender',
    'Long Term Performance Based Road Maintenance and Restoration Works along the Highlands Highway between Togoba Junction to Kagul Bridge (29.0 km) in the Western Highlands Province.',
    'Long Term Performance Based Road Maintenance and Restoration Works along the Highlands Highway between Togoba Junction to Kagul Bridge (29.0 km) in the Western Highlands Province.',
    14,
    'f5002019-0000-0000-0000-000000000004',
    'Closed',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-09
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000002d',
    'NPC2019-09',
    'a1002019-0000-0000-0000-000000000001',
    '2019-06-14',
    '2019-06-14 10:00:00+10',
    'Open Tender',
    'Restoration, Resealing and Routine Maintenance Works from Mai Junction to Hoskins Airport (20.29km) along the Hoskins Road in West New Britain Province.',
    'Restoration, Resealing and Routine Maintenance Works from Mai Junction to Hoskins Airport (20.29km) along the Hoskins Road in West New Britain Province.',
    14,
    'f5002019-0000-0000-0000-000000000004',
    'Closed',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-10
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000002e',
    'NPC2019-10',
    'a1002019-0000-0000-0000-000000000001',
    '2019-06-14',
    '2019-06-14 10:00:00+10',
    'Open Tender',
    'Restoration, Resealing and Routine Maintenance Works from Kinakon (before PAU Turnoff) to Sogeri End of Seal (22.29 km) along Sogeri Road in Central Province.',
    'Restoration, Resealing and Routine Maintenance Works from Kinakon (before PAU Turnoff) to Sogeri End of Seal (22.29 km) along Sogeri Road in Central Province.',
    14,
    'f5002019-0000-0000-0000-000000000004',
    'Closed',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-11
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000002f',
    'NPC2019-11',
    'a1002019-0000-0000-0000-000000000001',
    '2019-06-14',
    '2019-06-14 10:00:00+10',
    'Open Tender',
    'Long Term Road Maintenance Services and Restoration Works from Bereina to Apanaipi Bridge (30km) along the Hiritano Highway in the Central Province.',
    'Long Term Road Maintenance Services and Restoration Works from Bereina to Apanaipi Bridge (30km) along the Hiritano Highway in the Central Province.',
    14,
    'f5002019-0000-0000-0000-000000000004',
    'Closed',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-12
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000030',
    'NPC2019-12',
    'a1002019-0000-0000-0000-000000000001',
    '2019-07-30',
    '2019-07-30 10:00:00+10',
    'Open Tender',
    'Upgrade to seal from Bogia to Awar on Coastal Highway in Madang Province, PNG',
    'Upgrade to seal from Bogia to Awar on Coastal Highway in Madang Province, PNG',
    30,
    'f5002019-0000-0000-0000-000000000003',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-12
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-00000000001b',
    '10002019-0000-0000-0000-000000000030',
    'c1002019-0000-0000-0000-000000000019',
    '2019-07-30',
    42057264.69,
    'PGK',
    'CON-NPC2019-12',
    '2019-07-30',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-13
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000031',
    'NPC2019-13',
    'a1002019-0000-0000-0000-000000000001',
    '2019-07-30',
    '2019-07-30 10:00:00+10',
    'Open Tender',
    'Upgrade to Seal from EPO to Kerema on Hiritano Highway in Gulf Province, PNG.',
    'Upgrade to Seal from EPO to Kerema on Hiritano Highway in Gulf Province, PNG.',
    30,
    'f5002019-0000-0000-0000-000000000003',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-13
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-00000000001c',
    '10002019-0000-0000-0000-000000000031',
    'c1002019-0000-0000-0000-000000000019',
    '2019-07-30',
    46629271.54,
    'PGK',
    'CON-NPC2019-13',
    '2019-07-30',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-14
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000032',
    'NPC2019-14',
    'a1002019-0000-0000-0000-00000000000f',
    '2019-01-01',
    NULL,
    'Open Tender',
    'MWSP/EA-01 Environmental Audit of the Installation of Navigation Aids (New Guinea Provinces).',
    'MWSP/EA-01 Environmental Audit of the Installation of Navigation Aids (New Guinea Provinces).',
    NULL,
    'f5002019-0000-0000-0000-000000000006',
    'Submitted for Approval',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-15
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000033',
    'NPC2019-15',
    'a1002019-0000-0000-0000-00000000000f',
    '2019-10-10',
    '2019-10-10 10:00:00+10',
    'Open Tender',
    'MWSP/TG-02 Tide Gauges Replacement',
    'MWSP/TG-02 Tide Gauges Replacement',
    10,
    'f5002019-0000-0000-0000-000000000006',
    'Cancelled',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-16
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000034',
    'NPC2019-16',
    'a1002019-0000-0000-0000-000000000001',
    '2019-09-26',
    '2019-09-26 10:00:00+10',
    'Open Tender',
    'Provision of Project Management and Supervision Consultancy Services for Road and Bridge Maintenance and Construction Works. (Contract No: 55-AT-24CT)',
    'Provision of Project Management and Supervision Consultancy Services for Road and Bridge Maintenance and Construction Works. (Contract No: 55-AT-24CT)',
    26,
    'f5002019-0000-0000-0000-000000000001',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-16
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-00000000001d',
    '10002019-0000-0000-0000-000000000034',
    'c1002019-0000-0000-0000-00000000001b',
    '2019-09-26',
    61275257.99,
    'PGK',
    'CON-NPC2019-16',
    '2019-09-26',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-17
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000035',
    'NPC2019-17',
    'a1002019-0000-0000-0000-000000000001',
    '2019-11-21',
    '2019-11-21 10:00:00+10',
    'Open Tender',
    'Resealing of the Coastal Highway from Sawmill Junction 9CH 237+00) to Borders Post end of seal (CH 284+00) in Sandaun Province',
    'Resealing of the Coastal Highway from Sawmill Junction 9CH 237+00) to Borders Post end of seal (CH 284+00) in Sandaun Province',
    21,
    'f5002019-0000-0000-0000-000000000001',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-17
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-00000000001e',
    '10002019-0000-0000-0000-000000000035',
    'c1002019-0000-0000-0000-000000000001',
    '2019-11-21',
    9984700,
    'PGK',
    'CON-NPC2019-17',
    '2019-11-21',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-18
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000036',
    'NPC2019-18',
    'a1002019-0000-0000-0000-000000000001',
    '2019-01-01',
    NULL,
    'Open Tender',
    'Preparation of the Resilient Transport Project - Tendering Output and Performance a Based Contract Specialist.',
    'Preparation of the Resilient Transport Project - Tendering Output and Performance a Based Contract Specialist.',
    20,
    'f5002019-0000-0000-0000-000000000003',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-18
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-00000000001f',
    '10002019-0000-0000-0000-000000000036',
    'c1002019-0000-0000-0000-00000000001c',
    '2019-12-31',
    451765,
    'PGK',
    'CON-NPC2019-18',
    '2019-12-31',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-19
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000037',
    'NPC2019-19',
    'a1002019-0000-0000-0000-000000000001',
    '2019-01-01',
    NULL,
    'Open Tender',
    'Preparation of the Resilient Transport Project - Tendering of Program Implementation Support Advisor.',
    'Preparation of the Resilient Transport Project - Tendering of Program Implementation Support Advisor.',
    20,
    'f5002019-0000-0000-0000-000000000003',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-19
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000020',
    '10002019-0000-0000-0000-000000000037',
    'c1002019-0000-0000-0000-00000000001d',
    '2019-12-31',
    487338.4,
    'PGK',
    'CON-NPC2019-19',
    '2019-12-31',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-20
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000038',
    'NPC2019-20',
    'a1002019-0000-0000-0000-000000000001',
    '2019-12-20',
    '2019-12-20 10:00:00+10',
    'Open Tender',
    'Preparation of the Resilient Transport Project - Tendering Survey and Mobile Mapping Services.',
    'Preparation of the Resilient Transport Project - Tendering Survey and Mobile Mapping Services.',
    20,
    'f5002019-0000-0000-0000-000000000003',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-21
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000039',
    'NPC2019-21',
    'a1002019-0000-0000-0000-000000000001',
    '2019-12-06',
    '2019-12-06 10:00:00+10',
    'Open Tender',
    'Preparation of the Resilient Transport Project - Tendering Undertaking Field Investigations, Surveys and Design of Ramu Highway Improvements.',
    'Preparation of the Resilient Transport Project - Tendering Undertaking Field Investigations, Surveys and Design of Ramu Highway Improvements.',
    6,
    'f5002019-0000-0000-0000-000000000003',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-22
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000003a',
    'NPC2019-22',
    'a1002019-0000-0000-0000-000000000004',
    '2018-12-14',
    '2018-12-14 10:00:00+10',
    'Open Tender',
    'Designing and Construction of Infrastructure at Simbu National Polytechnic Institute.',
    'Designing and Construction of Infrastructure at Simbu National Polytechnic Institute.',
    40000000,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-22
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000021',
    '10002019-0000-0000-0000-00000000003a',
    'c1002019-0000-0000-0000-00000000001e',
    '2019-10-22',
    37529800,
    'PGK',
    'CON-NPC2019-22',
    '2019-10-22',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-22
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-000000000025',
    '10002019-0000-0000-0000-00000000003a',
    'NPC Board',
    '22nd Oct 2019 ; M No:13/19',
    '2019-10-22',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-23
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000003b',
    'NPC2019-23',
    'a1002019-0000-0000-0000-000000000001',
    '2019-08-01',
    '2019-08-01 10:00:00+10',
    'Open Tender',
    'Pavement Construction Stabilization and Bituminous Sealing or Hiri Lai Road 26.4km in Southern Highlands Province.',
    'Pavement Construction Stabilization and Bituminous Sealing or Hiri Lai Road 26.4km in Southern Highlands Province.',
    65840000,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-23
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000022',
    '10002019-0000-0000-0000-00000000003b',
    'c1002019-0000-0000-0000-00000000001f',
    '2020-04-09',
    66639259.28,
    'PGK',
    'CON-NPC2019-23',
    '2020-04-09',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-23
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-000000000026',
    '10002019-0000-0000-0000-00000000003b',
    'NPC Board',
    '09th April 2020; B/M No: 03/2020',
    '2020-04-09',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-24
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000003c',
    'NPC2019-24',
    'a1002019-0000-0000-0000-000000000001',
    '2019-08-30',
    '2019-08-30 10:00:00+10',
    'Open Tender',
    'Proposal for the Detailed Designed and Construction of Finschaffen Highway form Bukawa Village to Pindi Station (K100KM) in Finschaffen District of Morobe Province.',
    'Proposal for the Detailed Designed and Construction of Finschaffen Highway form Bukawa Village to Pindi Station (K100KM) in Finschaffen District of Morobe Province.',
    289994637.32,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-24
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000023',
    '10002019-0000-0000-0000-00000000003c',
    'c1002019-0000-0000-0000-000000000020',
    '2019-12-12',
    289994637.32,
    'PGK',
    'CON-NPC2019-24',
    '2019-12-12',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-24
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-000000000027',
    '10002019-0000-0000-0000-00000000003c',
    'NPC Board',
    'BM-15/2019',
    '2019-12-12',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-25
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000003d',
    'NPC2019-25',
    'a1002019-0000-0000-0000-000000000001',
    '2019-09-30',
    '2019-09-30 10:00:00+10',
    'Open Tender',
    'Design and Construction of Hawain Bride on the Coastal Highway in the East Sepik, Contract No. SC 33-NH-19AB - Request for NPC Number.',
    'Design and Construction of Hawain Bride on the Coastal Highway in the East Sepik, Contract No. SC 33-NH-19AB - Request for NPC Number.',
    20,
    'f5002019-0000-0000-0000-000000000004',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-25
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000024',
    '10002019-0000-0000-0000-00000000003d',
    'c1002019-0000-0000-0000-000000000021',
    '2020-03-13',
    20000000,
    'PGK',
    'CON-NPC2019-25',
    '2020-03-13',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2019-25
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9002019-0000-0000-0000-000000000028',
    '10002019-0000-0000-0000-00000000003d',
    'NPC Board',
    'BM-02/2020',
    '2020-03-13',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2019-26
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000003e',
    'NPC2019-26',
    'a1002019-0000-0000-0000-000000000011',
    '2019-01-01',
    NULL,
    'Open Tender',
    'Construction of 2 new ablution Block; 2 Levels Ablution Block at Ward 2 and 3 and 3 Levels Ablution Block at ward 1 and 4',
    'Construction of 2 new ablution Block; 2 Levels Ablution Block at Ward 2 and 3 and 3 Levels Ablution Block at ward 1 and 4',
    1300000,
    'f5002019-0000-0000-0000-000000000004',
    'On Hold',
    '0f002019-0000-0000-0000-000000000007',
    '0f002019-0000-0000-0000-000000000007',
    '0f002019-0000-0000-0000-000000000007'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-27
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-00000000003f',
    'NPC2019-27',
    'a1002019-0000-0000-0000-000000000004',
    '2019-08-12',
    '2019-08-12 10:00:00+10',
    'Open Tender',
    'Construction of New 88-Man Dormitory for Port Moresby Technical College',
    'Construction of New 88-Man Dormitory for Port Moresby Technical College',
    2000000,
    'f5002019-0000-0000-0000-000000000004',
    'Cancelled',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005',
    '0f002019-0000-0000-0000-000000000005'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-28
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000040',
    'NPC2019-28',
    'a1002019-0000-0000-0000-000000000001',
    '2019-01-01',
    NULL,
    'Open Tender',
    'Long Term Maintenance on the Sepik Highway from Passam Junction (Ch00+00) to (Lumi) Karitami (Ch258+00), East & West Sepik Provinces',
    'Long Term Maintenance on the Sepik Highway from Passam Junction (Ch00+00) to (Lumi) Karitami (Ch258+00), East & West Sepik Provinces',
    NULL,
    'f5002019-0000-0000-0000-000000000001',
    'Awarded',
    '0f002019-0000-0000-0000-000000000002',
    '0f002019-0000-0000-0000-000000000002',
    '0f002019-0000-0000-0000-000000000002'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-28
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000025',
    '10002019-0000-0000-0000-000000000040',
    'c1002019-0000-0000-0000-000000000022',
    '2019-12-31',
    83491883.34,
    'PGK',
    'CON-NPC2019-28',
    '2019-12-31',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2019-29
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000041',
    'NPC2019-29',
    'a1002019-0000-0000-0000-000000000001',
    '2019-01-01',
    NULL,
    'Open Tender',
    'Long Term Maintenance on the Magi Highway from Bautama Border (Ch00+00) to Gonai (Ch277+00).',
    'Long Term Maintenance on the Magi Highway from Bautama Border (Ch00+00) to Gonai (Ch277+00).',
    NULL,
    'f5002019-0000-0000-0000-000000000001',
    'Closed',
    '0f002019-0000-0000-0000-000000000002',
    '0f002019-0000-0000-0000-000000000002',
    '0f002019-0000-0000-0000-000000000002'
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2019-30
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002019-0000-0000-0000-000000000042',
    'NPC2019-30',
    'a1002019-0000-0000-0000-000000000001',
    '2020-03-04',
    '2020-03-04 10:00:00+10',
    'Open Tender',
    'Long Term Maintenance on the Northern & Kokoda Roads from Babaru to Airport Junction to Kokoda in total 163km, in Oro Province',
    'Long Term Maintenance on the Northern & Kokoda Roads from Babaru to Airport Junction to Kokoda in total 163km, in Oro Province',
    4,
    'f5002019-0000-0000-0000-000000000001',
    'Awarded',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001',
    '0f002019-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2019-30
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002019-0000-0000-0000-000000000026',
    '10002019-0000-0000-0000-000000000042',
    'c1002019-0000-0000-0000-000000000023',
    '2020-03-04',
    51312887.01,
    'PGK',
    'CON-NPC2019-30',
    '2020-03-04',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- ============================================
-- END OF 2019 DATA MIGRATION
-- ============================================
