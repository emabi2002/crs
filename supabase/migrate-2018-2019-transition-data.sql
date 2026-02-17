-- ============================================
-- 2018-2019 TRANSITION CONTRACT REGISTRY DATA MIGRATION
-- Generated from 2018_2019_transition_crs.csv
-- ============================================

-- ============================================
-- AGENCIES (Additional agencies from transition data)
-- ============================================
INSERT INTO agencies (id, name, abbreviation, level, sector) VALUES
    ('a1001819-0000-0000-0000-000000000001', 'Department of Works & Highways', 'DoWH', 'National', 'Infrastructure'),
    ('a1001819-0000-0000-0000-000000000002', 'Coffee Industry Corporation', 'CIC', 'National', 'Agriculture'),
    ('a1001819-0000-0000-0000-000000000003', 'National Emergency Coordination', 'NEC', 'National', 'Emergency'),
    ('a1001819-0000-0000-0000-000000000004', 'Department of Health', 'DoH', 'National', 'Health'),
    ('a1001819-0000-0000-0000-000000000005', 'Department of Education', 'DoE', 'National', 'Education'),
    ('a1001819-0000-0000-0000-000000000006', 'Department of Prime Minister & NEC', 'PM&NEC', 'National', 'Governance'),
    ('a1001819-0000-0000-0000-000000000007', 'National Fisheries Authority', 'NFA', 'National', 'Maritime'),
    ('a1001819-0000-0000-0000-000000000008', 'National Maritime Safety Authority', 'NMSA', 'National', 'Maritime'),
    ('a1001819-0000-0000-0000-000000000009', 'Morobe Provincial Administration', 'MPA', 'Provincial', 'Provincial'),
    ('a1001819-0000-0000-0000-00000000000a', 'East New Britain Provincial Administration', 'ENBPA', 'Provincial', 'Provincial')
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- FUNDING SOURCES
-- ============================================
INSERT INTO funding_sources (id, name, donor_name) VALUES
    ('f5001819-0000-0000-0000-000000000001', 'GoPNG', NULL),
    ('f5001819-0000-0000-0000-000000000002', 'Exim Bank of China', 'China'),
    ('f5001819-0000-0000-0000-000000000003', 'World Bank', 'World Bank'),
    ('f5001819-0000-0000-0000-000000000004', 'Asian Development Bank', 'ADB')
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- OFFICERS (From transition data)
-- Use unique emails with year prefix to avoid conflicts
-- ============================================
INSERT INTO officers (id, full_name, email, agency_id, role) VALUES
    ('0f001819-0000-0000-0000-000000000001', 'Guria Verave', 'guria.verave.1819@npc.gov.pg', 'a1001819-0000-0000-0000-000000000001', 'Procurement Officer'),
    ('0f001819-0000-0000-0000-000000000002', 'Veari Hitolo', 'veari.hitolo.1819@npc.gov.pg', 'a1001819-0000-0000-0000-000000000004', 'Procurement Officer'),
    ('0f001819-0000-0000-0000-000000000003', 'Geoffrey Kinibo', 'geoffrey.kinibo.1819@npc.gov.pg', 'a1001819-0000-0000-0000-000000000005', 'Procurement Officer'),
    ('0f001819-0000-0000-0000-000000000004', 'Babaga Naime', 'babaga.naime.1819@npc.gov.pg', 'a1001819-0000-0000-0000-000000000001', 'Procurement Officer'),
    ('0f001819-0000-0000-0000-000000000005', 'Wanom Nothsman', 'wanom.nothsman.1819@npc.gov.pg', 'a1001819-0000-0000-0000-000000000007', 'Procurement Officer'),
    ('0f001819-0000-0000-0000-000000000006', 'Hudson Leka', 'hudson.leka.1819@npc.gov.pg', 'a1001819-0000-0000-0000-000000000001', 'Procurement Officer')
ON CONFLICT (id) DO UPDATE SET
    full_name = EXCLUDED.full_name,
    agency_id = EXCLUDED.agency_id;

-- ============================================
-- CONTRACTORS (From transition data)
-- ============================================
INSERT INTO contractors (id, legal_name, trading_name, address, province, contact_person, phone, email, status, categories) VALUES
    ('c1001819-0000-0000-0000-000000000001', 'Paul Schulz', 'Paul Schulz', 'Port Moresby', 'NCD', 'Paul Schulz', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting']),
    ('c1001819-0000-0000-0000-000000000002', 'Haom Builders', 'Haom Builders', 'Lae', 'Morobe', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-000000000003', 'PNG Constructions Limited', 'PNG Constructions Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-000000000004', 'Matrix Construction (PNG) Limited', 'Matrix Construction (PNG) Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-000000000005', 'Borneo Pacific', 'Borneo Pacific Pharmaceuticals', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c1001819-0000-0000-0000-000000000006', 'Modern Pharmaceutical', 'Modern Pharmaceutical', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c1001819-0000-0000-0000-000000000007', 'Summit Pharmaceuticals', 'Summit Pharmaceuticals', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c1001819-0000-0000-0000-000000000008', 'Boucher & Muir Ltd', 'Boucher & Muir Ltd', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c1001819-0000-0000-0000-000000000009', 'Greenhill Investment Limited', 'Greenhill Investment Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-00000000000a', 'United Pacific Bridging PTE Limited', 'United Pacific Bridging PTE Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-00000000000b', 'China Railway International Group Ltd', 'China Railway International Group Ltd', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-00000000000c', 'Renardet SA Consulting Engineers', 'Renardet SA Consulting Engineers', 'Switzerland', 'Overseas', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting']),
    ('c1001819-0000-0000-0000-00000000000d', 'JWL Contractors Limited', 'JWL Contractors Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-00000000000e', 'Dekenai Construction Limited', 'Dekenai Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-00000000000f', 'Tari Pori Development Corporation Ltd', 'Tari Pori Development Corporation Ltd', 'Hela', 'Hela', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-000000000010', 'Metallurgical Corporation of China Limited', 'Metallurgical Corporation of China Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-000000000011', 'China Wu Yi Co., Limited', 'China Wu Yi Co., Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-000000000012', 'China Harbour Engineering Co. Limited', 'China Harbour Engineering Co. Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-000000000013', 'NBC Limited (JV) TP Solutions Limited', 'NBC Limited (JV) TP Solutions Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-000000000014', 'Deloitte Touche Tohmatsu', 'Deloitte Touche Tohmatsu', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting']),
    ('c1001819-0000-0000-0000-000000000015', 'VISSIM AS of Norway', 'VISSIM AS of Norway', 'Norway', 'Overseas', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Services']),
    ('c1001819-0000-0000-0000-000000000016', 'Cemix Construction Limited', 'Cemix Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-000000000017', 'South Pacific Pharmaceuticals Limited', 'South Pacific Pharmaceuticals Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c1001819-0000-0000-0000-000000000018', 'LD Logistics Limited', 'LD Logistics Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Services']),
    ('c1001819-0000-0000-0000-000000000019', 'L & Z Enterprise Limited', 'L & Z Enterprise Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Services']),
    ('c1001819-0000-0000-0000-00000000001a', 'Telemu No. 16 Limited', 'Telemu No. 16 Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Services']),
    ('c1001819-0000-0000-0000-00000000001b', 'BGTEE Investment Limited', 'BGTEE Investment Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-00000000001c', 'Makara Construction Limited', 'Makara Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-00000000001d', 'Heduru Contractors Limited', 'Heduru Contractors Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-00000000001e', 'Bador Limited', 'Bador Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-00000000001f', 'Caveman Construction Limited', 'Caveman Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-000000000020', 'City Pharmacy', 'City Pharmacy', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c1001819-0000-0000-0000-000000000021', 'Multichem PNG', 'Multichem PNG', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c1001819-0000-0000-0000-000000000022', 'Tradelink International Limited', 'Tradelink International Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c1001819-0000-0000-0000-000000000023', 'HBS Contractors', 'HBS Contractors', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c1001819-0000-0000-0000-000000000024', 'Bonifica S.P.A. and Renardet S.A JV', 'Bonifica S.P.A. and Renardet S.A JV', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting'])
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- TENDERS (Transition Period 2018-2019)
-- ============================================

-- NPCTP77 - Senior Advisor Consultancy
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10001819-0000-0000-0000-000000000001',
    'NPCTP77',
    'a1001819-0000-0000-0000-000000000001',
    '2018-08-09',
    '2018-08-09 10:00:00+10',
    'Open Tender',
    'Provision of Senior Advisor consultancy services DoWH',
    'Provision of Senior Advisor consultancy services DoWH',
    1085870,
    'f5001819-0000-0000-0000-000000000001',
    'Awarded',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca001819-0000-0000-0000-000000000001',
    '10001819-0000-0000-0000-000000000001',
    'c1001819-0000-0000-0000-000000000001',
    '2019-08-22',
    1085870,
    'PGK',
    'CON-NPCTP77',
    '2019-08-22',
    '2022-08-22',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- CSTB3766 - Coffee Export Office
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10001819-0000-0000-0000-000000000002',
    'CSTB3766',
    'a1001819-0000-0000-0000-000000000002',
    '2018-03-20',
    '2018-03-20 10:00:00+10',
    'Open Tender',
    'Rehabilitation of Coffee Export Office in Lae Morobe Province',
    'Rehabilitation of Coffee Export Office in Lae Morobe Province',
    10661008.43,
    'f5001819-0000-0000-0000-000000000001',
    'Awarded',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca001819-0000-0000-0000-000000000002',
    '10001819-0000-0000-0000-000000000002',
    'c1001819-0000-0000-0000-000000000002',
    '2020-11-10',
    10661008.43,
    'PGK',
    'CON-CSTB3766',
    '2020-11-10',
    '2022-11-10',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- CSTB3173 - Kim Power Corner Road
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10001819-0000-0000-0000-000000000003',
    'CSTB3173',
    'a1001819-0000-0000-0000-000000000001',
    '2015-01-09',
    '2015-01-09 10:00:00+10',
    'Open Tender',
    'Upgrading and Sealing of Kim Power Corner to Reklamp Market 5.1km in WHP',
    'Upgrading and Sealing of Kim Power Corner to Reklamp Market 5.1km in WHP',
    9879892,
    'f5001819-0000-0000-0000-000000000001',
    'Awarded',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca001819-0000-0000-0000-000000000003',
    '10001819-0000-0000-0000-000000000003',
    'c1001819-0000-0000-0000-000000000003',
    '2022-07-22',
    9879892,
    'PGK',
    'CON-CSTB3173',
    '2022-07-22',
    '2024-07-22',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- COI83/2018 - Koroba Secondary School Emergency
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10001819-0000-0000-0000-000000000004',
    'COI83-2018',
    'a1001819-0000-0000-0000-000000000003',
    '2018-10-30',
    NULL,
    'Single Source',
    'Repairs of Houses & Construction of classrooms in Koroba Secondary School',
    'Repairs of Houses & Construction of classrooms in Koroba Secondary School in Hela Province - Emergency COI',
    4184200.64,
    'f5001819-0000-0000-0000-000000000001',
    'Awarded',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca001819-0000-0000-0000-000000000004',
    '10001819-0000-0000-0000-000000000004',
    'c1001819-0000-0000-0000-000000000004',
    '2019-05-17',
    4184200.64,
    'PGK',
    'CON-COI83-2018',
    '2019-05-17',
    '2020-05-17',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPCTP54 - Antipsychotic Drugs
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10001819-0000-0000-0000-000000000005',
    'NPCTP54',
    'a1001819-0000-0000-0000-000000000004',
    '2019-01-01',
    NULL,
    'Open Tender',
    'Supply of Antipsychotic & Parkinsonism Drugs',
    'Supply of Antipsychotic & Parkinsonism Drugs',
    2534255,
    'f5001819-0000-0000-0000-000000000001',
    'Awarded',
    '0f001819-0000-0000-0000-000000000002',
    '0f001819-0000-0000-0000-000000000002',
    '0f001819-0000-0000-0000-000000000002'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca001819-0000-0000-0000-000000000005',
    '10001819-0000-0000-0000-000000000005',
    'c1001819-0000-0000-0000-000000000005',
    '2019-05-16',
    2534255,
    'PGK',
    'CON-NPCTP54',
    '2019-05-16',
    '2020-05-16',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPCTP46 - Anti-Cancer Drugs
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10001819-0000-0000-0000-000000000006',
    'NPCTP46',
    'a1001819-0000-0000-0000-000000000004',
    '2019-01-31',
    NULL,
    'Open Tender',
    'Supply of Anti-Cancer Drugs',
    'Supply of Anti-Cancer Drugs',
    4403716,
    'f5001819-0000-0000-0000-000000000001',
    'Awarded',
    '0f001819-0000-0000-0000-000000000002',
    '0f001819-0000-0000-0000-000000000002',
    '0f001819-0000-0000-0000-000000000002'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca001819-0000-0000-0000-000000000006',
    '10001819-0000-0000-0000-000000000006',
    'c1001819-0000-0000-0000-000000000006',
    '2019-05-16',
    4403716,
    'PGK',
    'CON-NPCTP46',
    '2019-05-16',
    '2020-05-16',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- CSTB2427 - Emergency Bridges Supply
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10001819-0000-0000-0000-000000000007',
    'CSTB2427',
    'a1001819-0000-0000-0000-000000000001',
    '2019-03-14',
    NULL,
    'Open Tender',
    'Supply of 72 Emergency Bridges (69 Panel Bridges and 3 Truss Bridges)',
    'Supply of additional 72 Emergency Bridges as an Extension to the Existing Rural Roads and Bridges Rehabilitation Program',
    296594985,
    'f5001819-0000-0000-0000-000000000001',
    'Awarded',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca001819-0000-0000-0000-000000000007',
    '10001819-0000-0000-0000-000000000007',
    'c1001819-0000-0000-0000-00000000000a',
    '2023-04-13',
    296594985,
    'PGK',
    'CON-CSTB2427',
    '2019-03-14',
    '2024-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- CSTB2718 - Yalu Bridge to Nadzab Airport
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10001819-0000-0000-0000-000000000008',
    'CSTB2718',
    'a1001819-0000-0000-0000-000000000001',
    '2018-10-11',
    '2018-10-11 10:00:00+10',
    'Open Tender',
    'Reconstruction of Yalu Bridge to Nadzab Airport Turn-off',
    'Reconstruction of Yalu Bridge to Nadzab Airport Turn-off as Section 2 of the Lae to Nadzab Section of the Highlands Highway',
    379911484.04,
    'f5001819-0000-0000-0000-000000000002',
    'Awarded',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca001819-0000-0000-0000-000000000008',
    '10001819-0000-0000-0000-000000000008',
    'c1001819-0000-0000-0000-00000000000b',
    '2021-11-16',
    379911484.04,
    'PGK',
    'CON-CSTB2718',
    '2021-11-16',
    '2025-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- CSTB3314 - EPM2 Consultancy RMRP II
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10001819-0000-0000-0000-000000000009',
    'CSTB3314',
    'a1001819-0000-0000-0000-000000000001',
    '2018-05-10',
    '2018-05-10 10:00:00+10',
    'Open Tender',
    'Employers Project Manager 2 (EPM 2) Consultancy for RMRP II',
    'The Employers Project Manager 2 (EPM 2) Consultancy contract for the Management and Supervision of Road Maintenance and Rehabilitation Project II (RMRP II)',
    33632546.59,
    'f5001819-0000-0000-0000-000000000003',
    'Awarded',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca001819-0000-0000-0000-000000000009',
    '10001819-0000-0000-0000-000000000009',
    'c1001819-0000-0000-0000-00000000000c',
    '2019-10-03',
    33632546.59,
    'PGK',
    'CON-CSTB3314',
    '2019-10-03',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- CSTB3774 - Highlands Highway Lae to Henganofi
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10001819-0000-0000-0000-00000000000a',
    'CSTB3774',
    'a1001819-0000-0000-0000-000000000001',
    '2018-10-31',
    '2018-10-31 10:00:00+10',
    'Open Tender',
    'Repair, Rehabilitation and Maintenance of Highlands Highway Lae Nadzab to Henganofi',
    'Repair, Rehabilitation, Upgrading and Maintenance of the Highlands Highway between Lae Nadzab in Morobe Province and Henganofi Bridge in the Eastern Highlands Province (Civil Works Contract No.1)',
    324055404.01,
    'f5001819-0000-0000-0000-000000000001',
    'Awarded',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca001819-0000-0000-0000-00000000000a',
    '10001819-0000-0000-0000-00000000000a',
    'c1001819-0000-0000-0000-000000000010',
    '2020-01-01',
    324055404.01,
    'PGK',
    'CON-CSTB3774',
    '2020-01-01',
    '2025-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- CSTB3775 - Highlands Highway Henganofi to Kagamuga
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10001819-0000-0000-0000-00000000000b',
    'CSTB3775',
    'a1001819-0000-0000-0000-000000000001',
    '2018-11-01',
    '2018-11-01 10:00:00+10',
    'Open Tender',
    'Rehabilitation of Highlands Highway Henganofi Bridge to Mt Hagen',
    'Rehabilitation, upgrading and maintenance of the Highlands Highway between Henganofi Bridge and Mangiro Bridge and between Miunde Bridge and Kagamuga in Mt. Hagen WHP',
    273264973.76,
    'f5001819-0000-0000-0000-000000000001',
    'Awarded',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca001819-0000-0000-0000-00000000000b',
    '10001819-0000-0000-0000-00000000000b',
    'c1001819-0000-0000-0000-000000000011',
    '2020-01-01',
    273264973.76,
    'PGK',
    'CON-CSTB3775',
    '2020-01-01',
    '2025-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- CSTB3776 - Sumbu Section Highlands Highway
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10001819-0000-0000-0000-00000000000c',
    'CSTB3776',
    'a1001819-0000-0000-0000-000000000001',
    '2018-11-01',
    '2018-11-01 10:00:00+10',
    'Open Tender',
    'Rehabilitation of 57km Sumbu Section of Highlands Highway',
    'Supplement Agreement for variation for Rehabilitation of the 57km of the Sumbu Section of the Highlands Highway between Mangiro Bridge and Miunde Bridge - ADB Loans',
    341298182.01,
    'f5001819-0000-0000-0000-000000000004',
    'Awarded',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001',
    '0f001819-0000-0000-0000-000000000001'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca001819-0000-0000-0000-00000000000c',
    '10001819-0000-0000-0000-00000000000c',
    'c1001819-0000-0000-0000-000000000012',
    '2021-04-22',
    341298182.01,
    'PGK',
    'CON-CSTB3776',
    '2021-04-22',
    '2025-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- CSTB3822 - Simbu Polytechnic Institute
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10001819-0000-0000-0000-00000000000d',
    'CSTB3822',
    'a1001819-0000-0000-0000-000000000005',
    '2019-08-23',
    '2019-09-02 10:00:00+10',
    'Open Tender',
    'Design and Construction of Simbu Polytechnic Institute',
    'Design and Construction of Simbu Polytechnic Institute',
    37529800,
    'f5001819-0000-0000-0000-000000000001',
    'Awarded',
    '0f001819-0000-0000-0000-000000000003',
    '0f001819-0000-0000-0000-000000000003',
    '0f001819-0000-0000-0000-000000000003'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca001819-0000-0000-0000-00000000000d',
    '10001819-0000-0000-0000-00000000000d',
    'c1001819-0000-0000-0000-000000000013',
    '2020-12-17',
    37529800,
    'PGK',
    'CON-CSTB3822',
    '2020-12-17',
    '2024-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPCTP8 - Cancer Centre Renovation
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10001819-0000-0000-0000-00000000000e',
    'NPCTP8',
    'a1001819-0000-0000-0000-000000000004',
    '2019-01-29',
    '2019-01-29 10:00:00+10',
    'Open Tender',
    'Renovation of Main Store Building for Cancer Centre POMGEN',
    'Renovation of existing Main Store Building for Cancer Centre for Port Moresby General Hospital',
    6886220.03,
    'f5001819-0000-0000-0000-000000000001',
    'Awarded',
    '0f001819-0000-0000-0000-000000000002',
    '0f001819-0000-0000-0000-000000000002',
    '0f001819-0000-0000-0000-000000000002'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca001819-0000-0000-0000-00000000000e',
    '10001819-0000-0000-0000-00000000000e',
    'c1001819-0000-0000-0000-000000000016',
    '2019-03-07',
    6886220.03,
    'PGK',
    'CON-NPCTP8',
    '2019-03-07',
    '2020-03-07',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- CSTB3847 - 100% Health Centre Kits
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10001819-0000-0000-0000-00000000000f',
    'CSTB3847',
    'a1001819-0000-0000-0000-000000000004',
    '2018-11-19',
    '2018-11-19 10:00:00+10',
    'Open Tender',
    'Supply of 100% Health Centre and Aid Post Kits throughout PNG',
    'Provision for the Supply of 100% Health Centre and Aid Post Kits throughout PNG',
    65271338.94,
    'f5001819-0000-0000-0000-000000000001',
    'Awarded',
    '0f001819-0000-0000-0000-000000000002',
    '0f001819-0000-0000-0000-000000000002',
    '0f001819-0000-0000-0000-000000000002'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca001819-0000-0000-0000-00000000000f',
    '10001819-0000-0000-0000-00000000000f',
    'c1001819-0000-0000-0000-000000000005',
    '2019-08-14',
    65271338.94,
    'PGK',
    'CON-CSTB3847',
    '2019-08-14',
    '2020-08-14',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- NPCTP6 - AIS Coastal Network NMSA
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '10001819-0000-0000-0000-000000000010',
    'NPCTP6',
    'a1001819-0000-0000-0000-000000000008',
    '2019-01-31',
    '2019-01-31 10:00:00+10',
    'Open Tender',
    'AIS Coastal Network Extension for Maritime Waterways Safety Project',
    'Automatic Identification System (AIS) Coastal Network Extension and Base Station Installation for PNG Maritime and Waterways Safety Project (MWSP)',
    7524448,
    'f5001819-0000-0000-0000-000000000004',
    'Awarded',
    '0f001819-0000-0000-0000-000000000003',
    '0f001819-0000-0000-0000-000000000003',
    '0f001819-0000-0000-0000-000000000003'
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca001819-0000-0000-0000-000000000010',
    '10001819-0000-0000-0000-000000000010',
    'c1001819-0000-0000-0000-000000000015',
    '2019-05-17',
    7524448,
    'PGK',
    'CON-NPCTP6',
    '2019-05-17',
    '2021-05-17',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- ============================================
-- END OF 2018-2019 TRANSITION DATA MIGRATION
-- ============================================
