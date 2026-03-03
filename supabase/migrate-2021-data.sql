-- ============================================
-- 2021 CONTRACT REGISTRY DATA MIGRATION
-- Generated from 2021_crs.csv
-- ============================================

-- ============================================
-- AGENCIES (Additional agencies from 2021 data)
-- ============================================
INSERT INTO agencies (id, name, abbreviation, level, sector) VALUES
    ('a1002021-0000-0000-0000-000000000001', 'Southern Highlands Provincial Administration', 'SHPA', 'Provincial', 'Provincial'),
    ('a1002021-0000-0000-0000-000000000002', 'Department of Health - Port Moresby General Hospital', 'POMGEN', 'National', 'Health'),
    ('a1002021-0000-0000-0000-000000000003', 'Department of Education', 'DoE', 'National', 'Education'),
    ('a1002021-0000-0000-0000-000000000004', 'Department of Finance', 'DoF', 'National', 'Finance'),
    ('a1002021-0000-0000-0000-000000000005', 'Department of Agriculture & Livestock', 'DAL', 'National', 'Agriculture'),
    ('a1002021-0000-0000-0000-000000000006', 'Department of National Planning & Monitoring', 'DNPM', 'National', 'Planning'),
    ('a1002021-0000-0000-0000-000000000007', 'Department of Transport', 'DoT', 'National', 'Transport'),
    ('a1002021-0000-0000-0000-000000000008', 'National Information & Communication Technology Authority', 'NICTA', 'National', 'ICT'),
    ('a1002021-0000-0000-0000-000000000009', 'Department of Lands & Physical Planning', 'DLPP', 'National', 'Lands'),
    ('a1002021-0000-0000-0000-00000000000a', 'National Fisheries Authority', 'NFA', 'National', 'Maritime'),
    ('a1002021-0000-0000-0000-00000000000b', 'Department of Works & Highways', 'DoWH', 'National', 'Infrastructure'),
    ('a1002021-0000-0000-0000-00000000000c', 'Climate Change & Development Authority', 'CCDA', 'National', 'Environment'),
    ('a1002021-0000-0000-0000-00000000000d', 'PNG Customs Service', 'PNGCS', 'National', 'Customs'),
    ('a1002021-0000-0000-0000-00000000000e', 'PNG Sports Foundation', 'PNGSF', 'National', 'Sports'),
    ('a1002021-0000-0000-0000-00000000000f', 'National Parliamentary Service', 'NPS', 'National', 'Governance'),
    ('a1002021-0000-0000-0000-000000000010', 'Government House', 'GH', 'National', 'Governance'),
    ('a1002021-0000-0000-0000-000000000011', 'Komo Margarima District Development Authority', 'KMDDA', 'District', 'District'),
    ('a1002021-0000-0000-0000-000000000012', 'National Maritime Safety Authority', 'NMSA', 'National', 'Maritime'),
    ('a1002021-0000-0000-0000-000000000013', 'Department of Health', 'DoH', 'National', 'Health'),
    ('a1002021-0000-0000-0000-000000000014', 'National Procurement Commission', 'NPC', 'National', 'Governance'),
    ('a1002021-0000-0000-0000-000000000015', 'South Bougainville District Development Authority', 'SBDDA', 'District', 'District'),
    ('a1002021-0000-0000-0000-000000000016', 'University of Goroka', 'UoG', 'National', 'Education')
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- FUNDING SOURCES
-- ============================================
INSERT INTO funding_sources (id, name, donor_name) VALUES
    ('f5002021-0000-0000-0000-000000000001', 'GoPNG', NULL),
    ('f5002021-0000-0000-0000-000000000002', 'Own Source Revenue', NULL),
    ('f5002021-0000-0000-0000-000000000003', 'World Bank', 'World Bank'),
    ('f5002021-0000-0000-0000-000000000004', 'Asian Development Bank', 'ADB'),
    ('f5002021-0000-0000-0000-000000000005', 'GoPNG Connect PNG Program', NULL),
    ('f5002021-0000-0000-0000-000000000006', 'South Bougainville District Treasury', NULL)
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- OFFICERS (From 2021 data)
-- ============================================
-- Use unique emails with year prefix to avoid conflicts
INSERT INTO officers (id, full_name, email, agency_id, role) VALUES
    ('0f002021-0000-0000-0000-000000000001', 'Frank Hare', 'frank.hare.2021@npc.gov.pg', 'a1002021-0000-0000-0000-00000000000b', 'Procurement Officer'),
    ('0f002021-0000-0000-0000-000000000002', 'Geoffrey Kinibo', 'geoffrey.kinibo.2021@npc.gov.pg', 'a1002021-0000-0000-0000-000000000003', 'Procurement Officer'),
    ('0f002021-0000-0000-0000-000000000003', 'Veari Hitolo', 'veari.hitolo.2021@npc.gov.pg', 'a1002021-0000-0000-0000-000000000013', 'Procurement Officer'),
    ('0f002021-0000-0000-0000-000000000004', 'Wanom Nothsman', 'wanom.nothsman.2021@npc.gov.pg', 'a1002021-0000-0000-0000-000000000005', 'Procurement Officer'),
    ('0f002021-0000-0000-0000-000000000005', 'Hane Hekwa', 'hane.hekwa.2021@npc.gov.pg', 'a1002021-0000-0000-0000-000000000005', 'Procurement Officer'),
    ('0f002021-0000-0000-0000-000000000006', 'Steven Peter', 'steven.peter.2021@npc.gov.pg', 'a1002021-0000-0000-0000-000000000006', 'Procurement Officer'),
    ('0f002021-0000-0000-0000-000000000007', 'Erue Jack', 'erue.jack.2021@npc.gov.pg', 'a1002021-0000-0000-0000-000000000007', 'Procurement Officer'),
    ('0f002021-0000-0000-0000-000000000008', 'Guria Verave', 'guria.verave.2021@npc.gov.pg', 'a1002021-0000-0000-0000-00000000000b', 'Procurement Officer'),
    ('0f002021-0000-0000-0000-000000000009', 'Agaru Agarobe', 'agaru.agarobe.2021@npc.gov.pg', 'a1002021-0000-0000-0000-00000000000a', 'Procurement Officer')
ON CONFLICT (id) DO UPDATE SET
    full_name = EXCLUDED.full_name,
    agency_id = EXCLUDED.agency_id;

-- ============================================
-- CONTRACTORS (From 2021 data)
-- ============================================
INSERT INTO contractors (id, legal_name, trading_name, address, province, contact_person, phone, email, status, categories) VALUES
    ('c1002021-0000-0000-0000-000000000001', 'Ranger Protection Limited', 'Ranger Protection Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Services']),
    ('c1002021-0000-0000-0000-000000000002', 'MH Supplies Limited', 'MH Supplies Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c1002021-0000-0000-0000-000000000003', 'Apinas Jethro', 'Apinas Jethro', 'Port Moresby', 'NCD', 'Apinas Jethro', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting']),
    ('c1002021-0000-0000-0000-000000000004', 'JLW Contractors', 'JLW Contractors', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002021-0000-0000-0000-000000000005', 'Ajit Muttu', 'Ajit Muttu', 'Port Moresby', 'NCD', 'Ajit Muttu', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting']),
    ('c1002021-0000-0000-0000-000000000006', 'Roland Kevina', 'Roland Kevina', 'Port Moresby', 'NCD', 'Roland Kevina', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting']),
    ('c1002021-0000-0000-0000-000000000007', 'Martin Powel', 'Martin Powel', 'Port Moresby', 'NCD', 'Martin Powel', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting']),
    ('c1002021-0000-0000-0000-000000000008', 'Potaisa Hombunaka', 'Potaisa Hombunaka', 'Port Moresby', 'NCD', 'Potaisa Hombunaka', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting']),
    ('c1002021-0000-0000-0000-000000000009', 'Alphy Semy', 'Alphy Semy', 'Port Moresby', 'NCD', 'Alphy Semy', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting']),
    ('c1002021-0000-0000-0000-00000000000a', 'JJ Ship Equipment Agencies Limited', 'JJ Ship Equipment Agencies Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002021-0000-0000-0000-00000000000b', 'Wopa Construction Limited', 'Wopa Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002021-0000-0000-0000-00000000000c', 'Olympus Project PNG Limited', 'Olympus Project PNG Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002021-0000-0000-0000-00000000000d', 'Civil Pacific Contractors Limited', 'CIVIPAC', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002021-0000-0000-0000-00000000000e', 'KPT Engineering Limited', 'KPT Engineering Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002021-0000-0000-0000-00000000000f', 'Nisag Engineering Limited', 'Nisag Engineering Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002021-0000-0000-0000-000000000010', 'Bena Construction Limited', 'Bena Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002021-0000-0000-0000-000000000011', 'Eda Civil Works', 'Eda Civil Works', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002021-0000-0000-0000-000000000012', 'Clean Green Energy Ltd', 'Clean Green Energy Ltd', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002021-0000-0000-0000-000000000013', 'Pele Civil Contractors Limited', 'Pele Civil Contractors Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002021-0000-0000-0000-000000000014', 'Adept Civil Contractors Ltd', 'Adept Civil Contractors Ltd', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002021-0000-0000-0000-000000000015', 'Jephthah Construction Limited', 'Jephthah Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002021-0000-0000-0000-000000000016', 'China Civil Engineering Construction Corporation (CCECC) PNG Limited', 'CCECC PNG', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002021-0000-0000-0000-000000000017', 'Treaty PNG Limited', 'Treaty PNG Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002021-0000-0000-0000-000000000018', 'VISSIM AS', 'VISSIM AS', 'Norway', 'Overseas', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Services']),
    ('c1002021-0000-0000-0000-000000000019', 'LD Logistics Limited', 'LD Logistics Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Services']),
    ('c1002021-0000-0000-0000-00000000001a', 'South Pacific Pharmaceutical Limited', 'South Pacific Pharmaceutical Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c1002021-0000-0000-0000-00000000001b', 'Express Customs Limited', 'Express Customs Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Services']),
    ('c1002021-0000-0000-0000-00000000001c', 'Transhire Limited', 'Transhire Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Services']),
    ('c1002021-0000-0000-0000-00000000001d', 'AEAC Limited', 'AEAC Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1002021-0000-0000-0000-00000000001e', 'EMTV', 'EMTV', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Services']),
    ('c1002021-0000-0000-0000-00000000001f', 'Borneo Pacific Pharmaceuticals Limited', 'Borneo Pacific Pharmaceuticals', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c1002021-0000-0000-0000-000000000020', 'China Railway Construction Engineering Group', 'CRCEG', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works'])
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- TENDERS (2021)
-- ============================================

-- NPC2021-29 - POMGEN Security Services
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002021-0000-0000-0000-000000000001',
    'NPC2021-29',
    'a1002021-0000-0000-0000-000000000002',
    '2021-08-03',
    '2021-08-03 10:00:00+10',
    'Open Tender',
    'Security Services for Port Moresby General Hospital',
    'Provision of Security Services for the Port Moresby General Hospital',
    4500000,
    'f5002021-0000-0000-0000-000000000001',
    'Awarded',
    '0f002021-0000-0000-0000-000000000001',
    '0f002021-0000-0000-0000-000000000001',
    '0f002021-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002021-0000-0000-0000-000000000001',
    '10002021-0000-0000-0000-000000000001',
    'c1002021-0000-0000-0000-000000000001',
    '2022-05-30',
    1901592,
    'PGK',
    'CON-NPC2021-29',
    '2022-05-30',
    '2025-05-30',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPC2021-30 - Maths & Science Materials Southern Region
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002021-0000-0000-0000-000000000002',
    'NPC2021-30',
    'a1002021-0000-0000-0000-000000000003',
    '2021-08-10',
    '2021-08-10 10:00:00+10',
    'Open Tender',
    'Mathematics and Science Educational Materials - Southern Region',
    'Purchase and Supply of Mathematics and Science Educational Materials Kits for selected Provincial High, Secondary and National High Schools in the Southern Region',
    6814417.77,
    'f5002021-0000-0000-0000-000000000002',
    'Awarded',
    '0f002021-0000-0000-0000-000000000002',
    '0f002021-0000-0000-0000-000000000002',
    '0f002021-0000-0000-0000-000000000002'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002021-0000-0000-0000-000000000002',
    '10002021-0000-0000-0000-000000000002',
    'c1002021-0000-0000-0000-000000000002',
    '2021-10-21',
    6578480.18,
    'PGK',
    'CON-NPC2021-30',
    '2021-10-21',
    '2022-10-21',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPC2021-31 - Maths & Science Materials Highlands Region
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002021-0000-0000-0000-000000000003',
    'NPC2021-31',
    'a1002021-0000-0000-0000-000000000003',
    '2021-08-10',
    '2021-08-10 10:00:00+10',
    'Open Tender',
    'Mathematics and Science Educational Materials - Highlands Region',
    'Purchase and Supply of Mathematics and Science Educational Materials Kits for selected Provincial High, Secondary and National High Schools in the Highlands Region',
    6482287.34,
    'f5002021-0000-0000-0000-000000000002',
    'Awarded',
    '0f002021-0000-0000-0000-000000000002',
    '0f002021-0000-0000-0000-000000000002',
    '0f002021-0000-0000-0000-000000000002'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002021-0000-0000-0000-000000000003',
    '10002021-0000-0000-0000-000000000003',
    'c1002021-0000-0000-0000-000000000002',
    '2021-10-21',
    6256100.80,
    'PGK',
    'CON-NPC2021-31',
    '2021-10-21',
    '2022-10-21',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPC2021-35 - DAL Project Coordinator
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002021-0000-0000-0000-000000000004',
    'NPC2021-35',
    'a1002021-0000-0000-0000-000000000005',
    '2022-03-25',
    '2022-03-25 10:00:00+10',
    'Open Tender',
    'Recruitment of Project Coordinator - DAL',
    'Recruitment of Project Coordinator - Project Coordination Unit - DAL',
    905697,
    'f5002021-0000-0000-0000-000000000003',
    'Awarded',
    '0f002021-0000-0000-0000-000000000004',
    '0f002021-0000-0000-0000-000000000004',
    '0f002021-0000-0000-0000-000000000004'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002021-0000-0000-0000-000000000004',
    '10002021-0000-0000-0000-000000000004',
    'c1002021-0000-0000-0000-000000000003',
    '2023-03-08',
    905697,
    'PGK',
    'CON-NPC2021-35',
    '2023-03-08',
    '2025-03-08',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPC2021-37 - Lakeside Housing Estate Road
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002021-0000-0000-0000-000000000005',
    'NPC2021-37',
    'a1002021-0000-0000-0000-000000000006',
    '2021-11-11',
    '2021-11-11 10:00:00+10',
    'Open Tender',
    'Area One Road Sealing - Lakeside Housing Estate',
    'Area One (1) Road Sealing Tender for Lakeside Housing Estate Pilot Project',
    3143662.53,
    'f5002021-0000-0000-0000-000000000001',
    'Awarded',
    '0f002021-0000-0000-0000-000000000006',
    '0f002021-0000-0000-0000-000000000006',
    '0f002021-0000-0000-0000-000000000006'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002021-0000-0000-0000-000000000005',
    '10002021-0000-0000-0000-000000000005',
    'c1002021-0000-0000-0000-000000000004',
    '2022-12-07',
    8800483.12,
    'PGK',
    'CON-NPC2021-37',
    '2022-12-07',
    '2024-12-07',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPC2021-58 - Highlands Highway Togoba to Kagul Bridge
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002021-0000-0000-0000-000000000006',
    'NPC2021-58',
    'a1002021-0000-0000-0000-00000000000b',
    '2022-04-25',
    '2022-04-25 10:00:00+10',
    'Open Tender',
    'Road Maintenance Togoba Junction to Kagul Bridge WHP',
    'Long Term Performance Based Road Maintenance Services along Highlands Highway from Togoba Junction to Kagul Bridge in WHP',
    9343459.13,
    'f5002021-0000-0000-0000-000000000001',
    'Awarded',
    '0f002021-0000-0000-0000-000000000008',
    '0f002021-0000-0000-0000-000000000008',
    '0f002021-0000-0000-0000-000000000008'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002021-0000-0000-0000-000000000006',
    '10002021-0000-0000-0000-000000000006',
    'c1002021-0000-0000-0000-00000000000b',
    '2023-10-27',
    9305802.66,
    'PGK',
    'CON-NPC2021-58',
    '2023-10-27',
    '2027-10-27',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPC2021-66 - Magarima Court Complex
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002021-0000-0000-0000-000000000007',
    'NPC2021-66',
    'a1002021-0000-0000-0000-000000000011',
    '2022-01-06',
    '2022-01-06 10:00:00+10',
    'Open Tender',
    'Construction of Magarima Court Complex Building',
    'Construction of Magarima Court Complex Building',
    8000000,
    'f5002021-0000-0000-0000-000000000001',
    'Awarded',
    '0f002021-0000-0000-0000-000000000001',
    '0f002021-0000-0000-0000-000000000001',
    '0f002021-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002021-0000-0000-0000-000000000007',
    '10002021-0000-0000-0000-000000000007',
    'c1002021-0000-0000-0000-00000000000c',
    '2023-08-31',
    11997791.28,
    'PGK',
    'CON-NPC2021-66',
    '2023-08-31',
    '2025-08-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPC2021-67 - Magarima Plaza Building
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002021-0000-0000-0000-000000000008',
    'NPC2021-67',
    'a1002021-0000-0000-0000-000000000011',
    '2022-01-06',
    '2022-01-06 10:00:00+10',
    'Open Tender',
    'Construction of Magarima Plaza Building',
    'Construction of Magarima Plaza Building',
    22000000,
    'f5002021-0000-0000-0000-000000000001',
    'Awarded',
    '0f002021-0000-0000-0000-000000000001',
    '0f002021-0000-0000-0000-000000000001',
    '0f002021-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002021-0000-0000-0000-000000000008',
    '10002021-0000-0000-0000-000000000008',
    'c1002021-0000-0000-0000-00000000000c',
    '2023-08-31',
    27233211.94,
    'PGK',
    'CON-NPC2021-67',
    '2023-08-31',
    '2026-08-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPC2021-69 - Mukiri Erave Road
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002021-0000-0000-0000-000000000009',
    'NPC2021-69',
    'a1002021-0000-0000-0000-00000000000b',
    '2022-04-25',
    '2022-04-25 11:00:00+10',
    'Open Tender',
    'Design and Construction of Mukiri Erave Road',
    'Design and Construction of Mukiri Erave Road from Mukiri to Erave Station in Kagua Erave District',
    66513672.23,
    'f5002021-0000-0000-0000-000000000005',
    'Awarded',
    '0f002021-0000-0000-0000-000000000008',
    '0f002021-0000-0000-0000-000000000008',
    '0f002021-0000-0000-0000-000000000008'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002021-0000-0000-0000-000000000009',
    '10002021-0000-0000-0000-000000000009',
    'c1002021-0000-0000-0000-00000000000d',
    '2023-08-17',
    108735760.40,
    'PGK',
    'CON-NPC2021-69',
    '2023-08-17',
    '2027-08-17',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPC2021-76 - Buin Market Development
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002021-0000-0000-0000-00000000000a',
    'NPC2021-76',
    'a1002021-0000-0000-0000-000000000015',
    '2024-07-26',
    '2024-07-26 10:00:00+10',
    'Open Tender',
    'Construction of Buin Market Development',
    'Construction of the proposed Buin Market Development in Buin, South Bougainville, Autonomous Region of Bougainville',
    12803911.39,
    'f5002021-0000-0000-0000-000000000006',
    'Awarded',
    '0f002021-0000-0000-0000-000000000001',
    '0f002021-0000-0000-0000-000000000001',
    '0f002021-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002021-0000-0000-0000-00000000000a',
    '10002021-0000-0000-0000-00000000000a',
    'c1002021-0000-0000-0000-00000000000e',
    '2025-06-10',
    12803911.99,
    'PGK',
    'CON-NPC2021-76',
    '2025-06-10',
    '2027-06-10',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPC2021-03 - Magi Highway Missing Link Moreguina to Gadoguina
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002021-0000-0000-0000-00000000000b',
    'NPC2021-03',
    'a1002021-0000-0000-0000-00000000000b',
    '2021-04-09',
    '2021-04-09 10:00:00+10',
    'Open Tender',
    'Magi Highway Missing Link - Moreguina to Gadoguina',
    'Proposal for Construction of Magi Highway Missing Link from Moreguina To Gadoguina Bridge- 20.48km Length Central Province',
    7512930,
    'f5002021-0000-0000-0000-000000000005',
    'Awarded',
    '0f002021-0000-0000-0000-000000000008',
    '0f002021-0000-0000-0000-000000000008',
    '0f002021-0000-0000-0000-000000000008'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002021-0000-0000-0000-00000000000b',
    '10002021-0000-0000-0000-00000000000b',
    'c1002021-0000-0000-0000-00000000000f',
    '2022-04-04',
    7657148.95,
    'PGK',
    'CON-NPC2021-03',
    '2022-04-04',
    '2024-04-04',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPC2021-10 - Yaware to Kotol Junction Road
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002021-0000-0000-0000-00000000000c',
    'NPC2021-10',
    'a1002021-0000-0000-0000-00000000000b',
    '2021-09-09',
    '2021-09-09 10:00:00+10',
    'Open Tender',
    'Upgrading and Sealing Yaware Junction to Kotol Junction',
    'Upgrading and Sealing of 44.0km Road Section from Yaware Junction to Kotol Junction along Tambul - Kotol Road in SHP',
    17999300,
    'f5002021-0000-0000-0000-000000000005',
    'Awarded',
    '0f002021-0000-0000-0000-000000000008',
    '0f002021-0000-0000-0000-000000000008',
    '0f002021-0000-0000-0000-000000000008'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002021-0000-0000-0000-00000000000c',
    '10002021-0000-0000-0000-00000000000c',
    'c1002021-0000-0000-0000-000000000016',
    '2022-06-30',
    17707078.29,
    'PGK',
    'CON-NPC2021-10',
    '2022-06-30',
    '2025-06-30',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPC2021-14 to 17 - Medical Supplies Distribution
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002021-0000-0000-0000-00000000000d',
    'NPC2021-14',
    'a1002021-0000-0000-0000-000000000013',
    '2022-02-22',
    '2022-02-22 10:00:00+10',
    'Open Tender',
    '100% Medical Supplies Distribution - Momase Region',
    'Provision of 100% Medical Supplies Kits Distribution in the Momase Region of PNG',
    8718708,
    'f5002021-0000-0000-0000-000000000001',
    'Awarded',
    '0f002021-0000-0000-0000-000000000003',
    '0f002021-0000-0000-0000-000000000003',
    '0f002021-0000-0000-0000-000000000003'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002021-0000-0000-0000-00000000000d',
    '10002021-0000-0000-0000-00000000000d',
    'c1002021-0000-0000-0000-000000000019',
    '2022-07-22',
    9181266.50,
    'PGK',
    'CON-NPC2021-14',
    '2022-07-22',
    '2023-07-22',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPC2021-26 - District Vessel West New Britain
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002021-0000-0000-0000-00000000000e',
    'NPC2021-26',
    'a1002021-0000-0000-0000-000000000007',
    '2021-09-24',
    '2021-09-24 10:00:00+10',
    'Open Tender',
    'District Vessel for West New Britain Province',
    'Design Documentation, Construction and Delivery of one District Vessel for West New Britain Province under National Shipping Service Program (NSSP)',
    7290000,
    'f5002021-0000-0000-0000-000000000001',
    'Awarded',
    '0f002021-0000-0000-0000-000000000007',
    '0f002021-0000-0000-0000-000000000007',
    '0f002021-0000-0000-0000-000000000007'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002021-0000-0000-0000-00000000000e',
    '10002021-0000-0000-0000-00000000000e',
    'c1002021-0000-0000-0000-00000000000a',
    '2023-02-02',
    7290000,
    'PGK',
    'CON-NPC2021-26',
    '2023-02-02',
    '2025-02-02',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPC2021-27 - University of Goroka Admin Building
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10002021-0000-0000-0000-00000000000f',
    'NPC2021-27',
    'a1002021-0000-0000-0000-000000000016',
    '2021-09-07',
    '2021-09-07 10:00:00+10',
    'Open Tender',
    'University of Goroka Central Administration Building',
    'Construction of the University of Goroka Central Administration Building Project',
    77000000,
    'f5002021-0000-0000-0000-000000000001',
    'Awarded',
    '0f002021-0000-0000-0000-000000000002',
    '0f002021-0000-0000-0000-000000000002',
    '0f002021-0000-0000-0000-000000000002'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca002021-0000-0000-0000-00000000000f',
    '10002021-0000-0000-0000-00000000000f',
    'c1002021-0000-0000-0000-000000000020',
    '2022-05-19',
    75900826,
    'PGK',
    'CON-NPC2021-27',
    '2022-05-19',
    '2025-05-19',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- ============================================
-- END OF 2021 DATA MIGRATION
-- ============================================
