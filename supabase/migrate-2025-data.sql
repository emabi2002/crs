-- ============================================
-- 2025 CONTRACT REGISTRY DATA MIGRATION
-- Generated from 2025_crs.csv
-- ============================================


-- AGENCIES (26 records)
INSERT INTO agencies (id, name, abbreviation, level, sector) VALUES
    ('a10007e9-0000-0000-0000-000000000001', 'Eastern Highlands Provincial Administration', 'EHPA', 'Provincial', 'Provincial'),
    ('a10007e9-0000-0000-0000-000000000002', 'PNG Extractive Industries Transparency Initiative', 'PNGEITI', 'National', 'Other'),
    ('a10007e9-0000-0000-0000-000000000003', 'Independent Commission Against Corruption (ICAC) PNG', 'ICAC', 'National', 'Other'),
    ('a10007e9-0000-0000-0000-000000000004', 'Department of Prime Minister & National Executive Council', 'PM&NEC', 'National', 'Other'),
    ('a10007e9-0000-0000-0000-000000000005', 'Department of Finance', 'DoF', 'National', 'Finance'),
    ('a10007e9-0000-0000-0000-000000000006', 'Port Moresby General Hospital', '', 'National', 'Other'),
    ('a10007e9-0000-0000-0000-000000000007', 'Department of Works and Highways', 'DoWH', 'National', 'Infrastructure'),
    ('a10007e9-0000-0000-0000-000000000008', 'Department of Treasury', '', 'National', 'Finance'),
    ('a10007e9-0000-0000-0000-000000000009', 'National Energy Authority', 'NEA', 'National', 'Other'),
    ('a10007e9-0000-0000-0000-00000000000a', 'National Department of Health', 'NDoH', 'National', 'Health'),
    ('a10007e9-0000-0000-0000-00000000000b', 'Ministry of Education-Office of Libraries and Archives', 'OL&A', 'National', 'Education'),
    ('a10007e9-0000-0000-0000-00000000000c', 'Civil Aviation & Safety Authority (CASA).', 'CASA', 'National', 'Other'),
    ('a10007e9-0000-0000-0000-00000000000d', 'Department of Works & Highways', 'DoWH', 'National', 'Infrastructure'),
    ('a10007e9-0000-0000-0000-00000000000e', 'Ombudsman Commission (OC) of PNG', 'OC', 'National', 'Other'),
    ('a10007e9-0000-0000-0000-00000000000f', 'Department of Lands and Physical Planning (DLPP).', 'DLPP', 'National', 'Other'),
    ('a10007e9-0000-0000-0000-000000000010', 'Department of Health', '', 'National', 'Health'),
    ('a10007e9-0000-0000-0000-000000000011', 'Port Moresby General Hospital', 'POMGEN', 'National', 'Other'),
    ('a10007e9-0000-0000-0000-000000000012', 'Department of Health', 'DoH', 'National', 'Health'),
    ('a10007e9-0000-0000-0000-000000000013', 'University of Technology', 'UoT', 'National', 'Other'),
    ('a10007e9-0000-0000-0000-000000000014', 'Southern Highlands Provincial Government', 'SHPG', 'Provincial', 'Provincial'),
    ('a10007e9-0000-0000-0000-000000000015', 'National Fisheries Authority', 'NFA', 'National', 'Maritime'),
    ('a10007e9-0000-0000-0000-000000000016', 'Southern Highlands Provincial Government', '', 'Provincial', 'Provincial'),
    ('a10007e9-0000-0000-0000-000000000017', 'Goroka District Development Authority', '', 'Provincial', 'Provincial'),
    ('a10007e9-0000-0000-0000-000000000018', 'University Of Goroka', '', 'National', 'Other'),
    ('a10007e9-0000-0000-0000-000000000019', 'Finschhafen District Authority', 'FDDA', 'Provincial', 'Provincial'),
    ('a10007e9-0000-0000-0000-00000000001a', 'Department of Provincial & Local Level Government Affairs', 'DPLLGA', 'Provincial', 'Provincial')
ON CONFLICT (id) DO NOTHING;

-- FUNDING SOURCES (19 records)
INSERT INTO funding_sources (id, name, donor_name) VALUES
    ('f50007e9-0000-0000-0000-000000000001', 'Eastern Highlands Provincial Government (EHPG)', NULL),
    ('f50007e9-0000-0000-0000-000000000002', 'GoPNG', NULL),
    ('f50007e9-0000-0000-0000-000000000003', 'National Executive Council (NEC)', NULL),
    ('f50007e9-0000-0000-0000-000000000004', 'GoPNG', NULL),
    ('f50007e9-0000-0000-0000-000000000005', 'Asian Development Bank', 'Asian Development Bank'),
    ('f50007e9-0000-0000-0000-000000000006', 'Asian Development Bank', 'Asian Development Bank'),
    ('f50007e9-0000-0000-0000-000000000007', 'GoPNG', NULL),
    ('f50007e9-0000-0000-0000-000000000008', 'World Bank', 'World Bank'),
    ('f50007e9-0000-0000-0000-000000000009', 'World Bank', 'World Bank'),
    ('f50007e9-0000-0000-0000-00000000000a', 'National Department of Health', NULL),
    ('f50007e9-0000-0000-0000-00000000000b', 'Asian Development Bank', 'Asian Development Bank'),
    ('f50007e9-0000-0000-0000-00000000000c', 'ABD Loan Financing', NULL),
    ('f50007e9-0000-0000-0000-00000000000d', 'GoPNG', NULL),
    ('f50007e9-0000-0000-0000-00000000000e', 'GoPNG', NULL),
    ('f50007e9-0000-0000-0000-00000000000f', 'National Fisheries Authority', NULL),
    ('f50007e9-0000-0000-0000-000000000010', 'GoPNG', NULL),
    ('f50007e9-0000-0000-0000-000000000011', 'Own Source Revenue', NULL),
    ('f50007e9-0000-0000-0000-000000000012', 'National Fisheries Authority (NFA)', NULL),
    ('f50007e9-0000-0000-0000-000000000013', 'Go-PNG', NULL)
ON CONFLICT (id) DO NOTHING;

-- OFFICERS (15 records)
INSERT INTO officers (id, full_name, email, agency_id, role) VALUES
    ('0f0007e9-0000-0000-0000-000000000001', 'Cathy Moinana', 'cathy.moinana@npc.gov.pg', 'a10007e9-0000-0000-0000-000000000001', 'Procurement Officer'),
    ('0f0007e9-0000-0000-0000-000000000002', 'Josephine Makiba', 'josephine.makiba@npc.gov.pg', 'a10007e9-0000-0000-0000-000000000002', 'Procurement Officer'),
    ('0f0007e9-0000-0000-0000-000000000003', 'Hane Hekwa', 'hane.hekwa@npc.gov.pg', 'a10007e9-0000-0000-0000-000000000003', 'Procurement Officer'),
    ('0f0007e9-0000-0000-0000-000000000004', 'Macnamana Hitolo', 'macnamana.hitolo@npc.gov.pg', 'a10007e9-0000-0000-0000-000000000004', 'Procurement Officer'),
    ('0f0007e9-0000-0000-0000-000000000005', 'Angeline.oki', 'angeline.oki@npc.gov.pg', 'a10007e9-0000-0000-0000-000000000007', 'Procurement Officer'),
    ('0f0007e9-0000-0000-0000-000000000006', 'Wanom Nothsman', 'wanom.nothsman@npc.gov.pg', 'a10007e9-0000-0000-0000-000000000008', 'Procurement Officer'),
    ('0f0007e9-0000-0000-0000-000000000007', 'Vincant D', 'vincant.d@npc.gov.pg', 'a10007e9-0000-0000-0000-000000000009', 'Procurement Officer'),
    ('0f0007e9-0000-0000-0000-000000000008', 'Elton Eka', 'elton.eka@npc.gov.pg', 'a10007e9-0000-0000-0000-00000000000b', 'Procurement Officer'),
    ('0f0007e9-0000-0000-0000-000000000009', 'Guria Verave', 'guria.verave@npc.gov.pg', 'a10007e9-0000-0000-0000-00000000000d', 'Procurement Officer'),
    ('0f0007e9-0000-0000-0000-00000000000a', 'Christopher. A', 'christopher.a@npc.gov.pg', 'a10007e9-0000-0000-0000-00000000000e', 'Procurement Officer'),
    ('0f0007e9-0000-0000-0000-00000000000b', 'Veari Hitolo', 'veari.hitolo@npc.gov.pg', 'a10007e9-0000-0000-0000-00000000000a', 'Procurement Officer'),
    ('0f0007e9-0000-0000-0000-00000000000c', 'Agaru Agarobe', 'agaru.agarobe@npc.gov.pg', 'a10007e9-0000-0000-0000-000000000014', 'Procurement Officer'),
    ('0f0007e9-0000-0000-0000-00000000000d', 'Pora Kewa', 'pora.kewa@npc.gov.pg', 'a10007e9-0000-0000-0000-000000000015', 'Procurement Officer'),
    ('0f0007e9-0000-0000-0000-00000000000e', 'Agarobe Agaru', 'agarobe.agaru@npc.gov.pg', 'a10007e9-0000-0000-0000-000000000017', 'Procurement Officer'),
    ('0f0007e9-0000-0000-0000-00000000000f', 'Macnamara Hitolo', 'macnamara.hitolo@npc.gov.pg', 'a10007e9-0000-0000-0000-000000000006', 'Procurement Officer')
ON CONFLICT (email) DO NOTHING;

-- CONTRACTORS (15 records)
INSERT INTO contractors (id, legal_name, trading_name, address, province, contact_person, phone, email, status, categories) VALUES
    ('c10007e9-0000-0000-0000-000000000001', 'Concierge Limited', 'Concierge Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e9-0000-0000-0000-000000000002', 'Book2eBook Company in Australia', 'Book2eBook Company in Australia', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e9-0000-0000-0000-000000000003', 'Company Technology One in Australia', 'Company Technology One in Australia', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e9-0000-0000-0000-000000000004', 'Pacific Network Limited', 'Pacific Network Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e9-0000-0000-0000-000000000005', 'United Nations Children''s Fund (UNICEF)', 'United Nations Children''s Fund (UNICEF)', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e9-0000-0000-0000-000000000006', 'Mt. Lawes Housing Estate Limited', 'Mt. Lawes Housing Estate Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e9-0000-0000-0000-000000000007', 'Pacific Network Limited.', 'Pacific Network Limited.', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e9-0000-0000-0000-000000000008', 'National Department of Health (NDOH) and United Nations Office for Project Services (UNOPS).', 'National Department of Health (NDOH) and United Nations Office for Project Services (UNOPS).', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e9-0000-0000-0000-000000000009', 'Pacific Architects Consortium Limited', 'Pacific Architects Consortium Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting']),
    ('c10007e9-0000-0000-0000-00000000000a', 'Minpac Construction Limited', 'Minpac Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e9-0000-0000-0000-00000000000b', 'Minpac Contraction Limited', 'Minpac Contraction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e9-0000-0000-0000-00000000000c', 'Flowtint Pty Limited', 'Flowtint Pty Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e9-0000-0000-0000-00000000000d', 'Cemix & Construction Limited', 'Cemix & Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e9-0000-0000-0000-00000000000e', 'China Railway Construction and Engineering Group Company Limited (CREG)', 'China Railway Construction and Engineering Group Company Limited (CREG)', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e9-0000-0000-0000-00000000000f', 'ERNEST & YOUNG OF 8 EXHIBITION STREET, MELBOURNE, VICTORIA 3000 AUSTRAKIA (EY)', 'ERNEST & YOUNG OF 8 EXHIBITION STREET, MELBOURNE, VICTORIA 3000 AUSTRAKIA (EY)', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works'])
ON CONFLICT (id) DO NOTHING;

-- TENDERS (45 records)

-- Tender: NPC2025-01
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000001',
    'NPC2025-01',
    'a10007e9-0000-0000-0000-000000000001',
    '2025-03-07',
    '2025-03-07 10:00:00+10',
    'Open Tender',
    'The Construction of Yanepa Srage One (New Building)3-Storey Office Complex',
    'The Construction of Yanepa Srage One (New Building)3-Storey Office Complex',
    NULL,
    'f50007e9-0000-0000-0000-000000000001',
    'Approved',
    (SELECT id FROM officers WHERE email = 'cathy.moinana@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'cathy.moinana@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'cathy.moinana@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-02
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000002',
    'NPC2025-02',
    'a10007e9-0000-0000-0000-000000000002',
    '2025-02-04',
    '2025-02-04 10:00:00+10',
    'Open Tender',
    'Muti-Year Contract For the Preparation of PNGEITI Fiscal Year. (EOI)',
    'Muti-Year Contract For the Preparation of PNGEITI Fiscal Year. (EOI)',
    NULL,
    'f50007e9-0000-0000-0000-000000000002',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-03
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000003',
    'NPC2025-03',
    'a10007e9-0000-0000-0000-000000000003',
    '2025-02-12',
    '2025-02-12 10:00:00+10',
    'Open Tender',
    'Office Fitout Project,Moki Business Park Waigani',
    'Office Fitout Project,Moki Business Park Waigani',
    6185408,
    'f50007e9-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e9-0000-0000-0000-000000000001',
    '100007e9-0000-0000-0000-000000000003',
    'c10007e9-0000-0000-0000-000000000001',
    '2025-12-31',
    9592979.18,
    'PGK',
    'CON-NPC2025-03',
    '2025-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2025-04
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000004',
    'NPC2025-04',
    'a10007e9-0000-0000-0000-000000000004',
    '2025-03-06',
    '2025-03-06 10:00:00+10',
    'Single Source',
    'Single Source Procurement Method for the Procurement of Robotic Scanner for the office of the National Executive Council.',
    'Single Source Procurement Method for the Procurement of Robotic Scanner for the office of the National Executive Council.',
    1335667,
    'f50007e9-0000-0000-0000-000000000003',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e9-0000-0000-0000-000000000002',
    '100007e9-0000-0000-0000-000000000004',
    'c10007e9-0000-0000-0000-000000000002',
    '2025-12-31',
    1335667,
    'PGK',
    'CON-NPC2025-04',
    '2025-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2025-05
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000005',
    'NPC2025-05',
    'a10007e9-0000-0000-0000-000000000005',
    '2025-03-24',
    '2025-03-24 10:00:00+10',
    'Single Source',
    'Single Source Procurement Method for the Procurement to Procure Integrated Financial Management Information System (IFMS) from Technology one by the Department of Finance',
    'Single Source Procurement Method for the Procurement to Procure Integrated Financial Management Information System (IFMS) from Technology one by the Department of Finance',
    NULL,
    'f50007e9-0000-0000-0000-000000000004',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e9-0000-0000-0000-000000000003',
    '100007e9-0000-0000-0000-000000000005',
    'c10007e9-0000-0000-0000-000000000003',
    '2025-12-31',
    6759597.5,
    'PGK',
    'CON-NPC2025-05',
    '2025-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2025-06
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000006',
    'NPC2025-06',
    'a10007e9-0000-0000-0000-000000000006',
    '2025-05-28',
    '2025-05-28 10:00:00+10',
    'Open Tender',
    'Single Source Procurement Method for the installation of main Electric Switchboard (MSB), ATS & AMP; Paralleling Switchboard of the Cancer Centre at Port Moresby General Hospital',
    'Single Source Procurement Method for the installation of main Electric Switchboard (MSB), ATS & AMP; Paralleling Switchboard of the Cancer Centre at Port Moresby General Hospital',
    NULL,
    'f50007e9-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e9-0000-0000-0000-000000000004',
    '100007e9-0000-0000-0000-000000000006',
    'c10007e9-0000-0000-0000-000000000004',
    '2025-12-31',
    4133209.49,
    'PGK',
    'CON-NPC2025-06',
    '2025-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2025-07
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000007',
    'NPC2025-07',
    'a10007e9-0000-0000-0000-000000000006',
    '2025-05-28',
    '2025-05-28 10:00:00+10',
    'Open Tender',
    'Single Source Procurement Method for the Network Infrastructure Upgrade of the New Cancer Centre at the Port Moresby General Hospital',
    'Single Source Procurement Method for the Network Infrastructure Upgrade of the New Cancer Centre at the Port Moresby General Hospital',
    NULL,
    'f50007e9-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e9-0000-0000-0000-000000000005',
    '100007e9-0000-0000-0000-000000000007',
    'c10007e9-0000-0000-0000-000000000004',
    '2025-12-31',
    4422761.24,
    'PGK',
    'CON-NPC2025-07',
    '2025-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2025-24
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000008',
    'NPC2025-24',
    'a10007e9-0000-0000-0000-000000000007',
    '2025-08-12',
    '2025-08-12 10:00:00+10',
    'Open Tender',
    'Preparation of Feasibility Studies ,Including Option Analysis, Environment and Social Safeguard Studies, Gender Analysis ,Detained Engineering Designs ,Bidding Documents & Advanced Procurement Actions',
    'Preparation of Feasibility Studies ,Including Option Analysis, Environment and Social Safeguard Studies, Gender Analysis ,Detained Engineering Designs ,Bidding Documents & Advanced Procurement Actions for Subnational Roads for Project 1 in: Southern Region.',
    NULL,
    'f50007e9-0000-0000-0000-000000000005',
    'Active',
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-25
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000009',
    'NPC2025-25',
    'a10007e9-0000-0000-0000-000000000007',
    '2025-08-12',
    '2025-08-12 10:00:00+10',
    'Open Tender',
    'Preparation of Feasibility Studies ,Including Option Analysis,Environment and Social Safeguard Studies,Gender Analysis ,Detained Engineering Designs ,Bidding Documents & Advanced Procurement Actions f',
    'Preparation of Feasibility Studies ,Including Option Analysis,Environment and Social Safeguard Studies,Gender Analysis ,Detained Engineering Designs ,Bidding Documents & Advanced Procurement Actions for Subnational Roads for Project 1 in: Highlands Region',
    NULL,
    'f50007e9-0000-0000-0000-000000000006',
    'Active',
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-29
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-00000000000a',
    'NPC2025-29',
    'a10007e9-0000-0000-0000-000000000008',
    '2025-10-14',
    '2025-10-14 10:00:00+10',
    'Open Tender',
    'Upgrade of ICT infrastructure for Department of Treasury.',
    'Upgrade of ICT infrastructure for Department of Treasury.',
    NULL,
    'f50007e9-0000-0000-0000-000000000007',
    'Evaluation',
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-37
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-00000000000b',
    'NPC2025-37',
    'a10007e9-0000-0000-0000-000000000009',
    '2025-11-21',
    '2025-11-21 10:00:00+10',
    'Open Tender',
    'Procurement and Installation of Power Supply Monitoring System.',
    'Procurement and Installation of Power Supply Monitoring System.',
    NULL,
    'f50007e9-0000-0000-0000-000000000002',
    'Active',
    (SELECT id FROM officers WHERE email = 'vincant.d@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'vincant.d@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'vincant.d@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-41
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-00000000000c',
    'NPC2025-41',
    'a10007e9-0000-0000-0000-00000000000a',
    '2025-11-20',
    '2025-11-20 10:00:00+10',
    'Open Tender',
    'Single Source Procurement for Technical Assistance for upskilling Health Care Workers, Supporting Community-Based Interventions, and Rollout of mSupply System for Supply of Chain Management under the',
    'Single Source Procurement for Technical Assistance for upskilling Health Care Workers, Supporting Community-Based Interventions, and Rollout of mSupply System for Supply of Chain Management under the World Bank Financed Improving Access to and Value from Health Services in PNG, Financing the Frontlines (IMPACT Health) (P167184).',
    NULL,
    'f50007e9-0000-0000-0000-000000000008',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e9-0000-0000-0000-000000000006',
    '100007e9-0000-0000-0000-00000000000c',
    'c10007e9-0000-0000-0000-000000000005',
    '2025-12-31',
    9738767,
    'PGK',
    'CON-NPC2025-41',
    '2025-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2025-32
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-00000000000d',
    'NPC2025-32',
    'a10007e9-0000-0000-0000-00000000000b',
    '2025-09-23',
    '2025-09-23 10:00:00+10',
    'Open Tender',
    'Construction of Kerema Provincial Library and Archives in Kerema, Gulf Province. (Re-tender NPC2024-02).',
    'Construction of Kerema Provincial Library and Archives in Kerema, Gulf Province. (Re-tender NPC2024-02).',
    NULL,
    'f50007e9-0000-0000-0000-000000000002',
    'Active',
    (SELECT id FROM officers WHERE email = 'elton.eka@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'elton.eka@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'elton.eka@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-45
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-00000000000e',
    'NPC2025-45',
    'a10007e9-0000-0000-0000-00000000000c',
    '2025-12-19',
    '2025-12-19 10:00:00+10',
    'Open Tender',
    'Design Consultant for Aviation House Project.',
    'Design Consultant for Aviation House Project.',
    NULL,
    'f50007e9-0000-0000-0000-000000000002',
    'Active',
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-08
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-00000000000f',
    'NPC2025-08',
    'a10007e9-0000-0000-0000-00000000000d',
    '2025-05-30',
    '2025-05-30 10:00:00+10',
    'Open Tender',
    'Output and Performance Based Road Contract for Ramu Highway between Watarais and Yanema Bridge in Morobe and Madang Provinces.',
    'Output and Performance Based Road Contract for Ramu Highway between Watarais and Yanema Bridge in Morobe and Madang Provinces.',
    NULL,
    'f50007e9-0000-0000-0000-000000000008',
    'Active',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-15
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000010',
    'NPC2025-15',
    'a10007e9-0000-0000-0000-000000000007',
    '2025-06-30',
    '2025-06-30 10:00:00+10',
    'Open Tender',
    'Expression of interest for field investigation and Design of Ramu Highway Ranges-Madang Province.',
    'Expression of interest for field investigation and Design of Ramu Highway Ranges-Madang Province.',
    NULL,
    'f50007e9-0000-0000-0000-000000000009',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-16
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000011',
    'NPC2025-16',
    'a10007e9-0000-0000-0000-00000000000e',
    '2025-09-11',
    '2025-09-11 10:00:00+10',
    'Open Tender',
    'Construction of three (3) bedroom quadruplex house for Ombudsman Commission in Lae, Morobe Province.',
    'Construction of three (3) bedroom quadruplex house for Ombudsman Commission in Lae, Morobe Province.',
    NULL,
    'f50007e9-0000-0000-0000-000000000002',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'christopher.a@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'christopher.a@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'christopher.a@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-26
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000012',
    'NPC2025-26',
    'a10007e9-0000-0000-0000-000000000007',
    '2025-08-12',
    '2025-08-12 10:00:00+10',
    'Open Tender',
    'Preparation of Feasibility Studies ,Including Option Analysis, Environment and Social Safeguard Studies, Gender Analysis ,Detained Engineering Designs ,Bidding Documents & Advanced Procurement Actions',
    'Preparation of Feasibility Studies ,Including Option Analysis, Environment and Social Safeguard Studies, Gender Analysis ,Detained Engineering Designs ,Bidding Documents & Advanced Procurement Actions for Subnational Roads for Project 1 in: Northern Region',
    NULL,
    'f50007e9-0000-0000-0000-000000000006',
    'Active',
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-27
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000013',
    'NPC2025-27',
    'a10007e9-0000-0000-0000-000000000007',
    '2025-08-12',
    '2025-08-12 10:00:00+10',
    'Open Tender',
    'Preparation of Feasibility Studies, Including Option Analysis, Environment and Social Safeguard Studies, Gender Analysis, Detained Engineering Designs, Bidding Documents & Advanced Procurement Actions',
    'Preparation of Feasibility Studies, Including Option Analysis, Environment and Social Safeguard Studies, Gender Analysis, Detained Engineering Designs, Bidding Documents & Advanced Procurement Actions for Subnational Roads for Project 1 in: New Guinea Islands Region',
    NULL,
    'f50007e9-0000-0000-0000-000000000006',
    'Active',
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-28
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000014',
    'NPC2025-28',
    'a10007e9-0000-0000-0000-00000000000a',
    '2025-08-13',
    '2025-08-13 10:00:00+10',
    'Open Tender',
    'Re-Development of the Lae Area Medical Store,lae,Morobe Province.',
    'Re-Development of the Lae Area Medical Store,lae,Morobe Province.',
    NULL,
    'f50007e9-0000-0000-0000-00000000000a',
    'Active',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-38
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000015',
    'NPC2025-38',
    'a10007e9-0000-0000-0000-00000000000f',
    '2025-11-07',
    '2025-11-07 10:00:00+10',
    'Open Tender',
    'Single Source Procurement for Construction of Trunk Infrastructure on acquired land at Laloki in Central Province under the Land Partnership for DL&PP.',
    'Single Source Procurement for Construction of Trunk Infrastructure on acquired land at Laloki in Central Province under the Land Partnership for DL&PP.',
    58000000,
    'f50007e9-0000-0000-0000-000000000002',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-42
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000016',
    'NPC2025-42',
    'a10007e9-0000-0000-0000-000000000010',
    '2025-01-01',
    NULL,
    'Open Tender',
    'Major rehabilitation of Air Conditioning System for the Operating Theatre at Buka Hospital, Autonomous Region of Bougainville',
    'Major rehabilitation of Air Conditioning System for the Operating Theatre at Buka Hospital, Autonomous Region of Bougainville',
    NULL,
    'f50007e9-0000-0000-0000-000000000002',
    'Active',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-09
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000017',
    'NPC2025-09',
    'a10007e9-0000-0000-0000-00000000000d',
    '2025-05-30',
    '2025-05-30 10:00:00+10',
    'Open Tender',
    'Output and Performance Based Road Contract for Ramu Highway Between Tapo Ford and Madang Airport Junction in Madang Province.',
    'Output and Performance Based Road Contract for Ramu Highway Between Tapo Ford and Madang Airport Junction in Madang Province.',
    NULL,
    'f50007e9-0000-0000-0000-000000000008',
    'Active',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-17
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000018',
    'NPC2025-17',
    'a10007e9-0000-0000-0000-00000000000d',
    '2025-07-25',
    '2025-07-25 10:00:00+10',
    'Open Tender',
    'Consultancy Package No. CS-16: Livelihoods Diversification and Strengthening of Community Awareness for project impact roads in WHP-Jiwaka-Simbu-EHP.',
    'Consultancy Package No. CS-16: Livelihoods Diversification and Strengthening of Community Awareness for project impact roads in WHP-Jiwaka-Simbu-EHP.',
    NULL,
    'f50007e9-0000-0000-0000-00000000000b',
    'Active',
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-18
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000019',
    'NPC2025-18',
    'a10007e9-0000-0000-0000-00000000000d',
    '2025-07-25',
    '2025-07-25 10:00:00+10',
    'Open Tender',
    'Consultancy Package No. CS-17: GBV Prevention and Response- Western Highlands Province',
    'Consultancy Package No. CS-17: GBV Prevention and Response- Western Highlands Province',
    NULL,
    'f50007e9-0000-0000-0000-00000000000c',
    'Active',
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-19
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-00000000001a',
    'NPC2025-19',
    'a10007e9-0000-0000-0000-00000000000d',
    '2025-07-25',
    '2025-07-25 10:00:00+10',
    'Open Tender',
    'Consultancy Package No. CS-18: GBV Prevention and Response-Simbu and Eastern Highlands Province.',
    'Consultancy Package No. CS-18: GBV Prevention and Response-Simbu and Eastern Highlands Province.',
    NULL,
    'f50007e9-0000-0000-0000-00000000000b',
    'Active',
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-33
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-00000000001b',
    'NPC2025-33',
    'a10007e9-0000-0000-0000-000000000011',
    '2025-09-23',
    '2025-09-23 10:00:00+10',
    'Open Tender',
    'Single Source Procurement for the Power Source and Main Electrical Cables for Cancer Center at Port Moresby General Hospital.',
    'Single Source Procurement for the Power Source and Main Electrical Cables for Cancer Center at Port Moresby General Hospital.',
    8681066.48,
    'f50007e9-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e9-0000-0000-0000-000000000007',
    '100007e9-0000-0000-0000-00000000001b',
    'c10007e9-0000-0000-0000-000000000007',
    '2025-09-04',
    8681066.48,
    'PGK',
    'CON-NPC2025-33',
    '2025-09-04',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e9-0000-0000-0000-000000000006',
    '100007e9-0000-0000-0000-00000000001b',
    'NPC Board',
    'M-No.08 of 2025 held on 04/09/2025.',
    '2025-09-04',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2025-34
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-00000000001c',
    'NPC2025-34',
    'a10007e9-0000-0000-0000-000000000012',
    '2025-09-24',
    '2025-09-24 10:00:00+10',
    'Single Source',
    'Single Source Procurement for the Agreement for Delivery of Outputs between National Department of Health (NDOH) and United Nations Office for Project Services (UNOPS) for: 1. Conducting Health Facili',
    'Single Source Procurement for the Agreement for Delivery of Outputs between National Department of Health (NDOH) and United Nations Office for Project Services (UNOPS) for: 1. Conducting Health Facility Audits, 2. Development of a Costed and Prioritized Investment Plan, 3. Procurement, Delivery and Installation of Essential Equipment, 4. Detailed Design and Rehabilitation Works of priority Health Facilities, 5. Project Management and Capacity Building. In Central, Chimbu and East Sepik and East New Britain Provinces.',
    48723764.18,
    'f50007e9-0000-0000-0000-00000000000d',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e9-0000-0000-0000-000000000008',
    '100007e9-0000-0000-0000-00000000001c',
    'c10007e9-0000-0000-0000-000000000008',
    '2025-09-04',
    48723764.18,
    'PGK',
    'CON-NPC2025-34',
    '2025-09-04',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e9-0000-0000-0000-000000000007',
    '100007e9-0000-0000-0000-00000000001c',
    'NPC Board',
    'B-Meeting No.08 of 2025, held on 04/09/2025.',
    '2025-09-04',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2025-35
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-00000000001d',
    'NPC2025-35',
    'a10007e9-0000-0000-0000-000000000013',
    '2025-09-24',
    '2025-09-24 10:00:00+10',
    'Single Source',
    'Single Source Procurement Full Design and Documentation of the Multi-purpose Hall at the PNG University of Technology.',
    'Single Source Procurement Full Design and Documentation of the Multi-purpose Hall at the PNG University of Technology.',
    4976746,
    'f50007e9-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e9-0000-0000-0000-000000000009',
    '100007e9-0000-0000-0000-00000000001d',
    'c10007e9-0000-0000-0000-000000000009',
    '2025-12-31',
    4976746,
    'PGK',
    'CON-NPC2025-35',
    '2025-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2025-40
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-00000000001e',
    'NPC2025-40',
    'a10007e9-0000-0000-0000-000000000014',
    '2025-11-17',
    '2025-11-17 10:00:00+10',
    'Open Tender',
    'Design and Construction of 3 Storey Seat of Good Governance Building, Mendi, Southern Highlands Province.',
    'Design and Construction of 3 Storey Seat of Good Governance Building, Mendi, Southern Highlands Province.',
    NULL,
    'f50007e9-0000-0000-0000-00000000000e',
    'Active',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-21
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-00000000001f',
    'NPC2025-21',
    'a10007e9-0000-0000-0000-000000000015',
    '2025-10-16',
    '2025-10-16 10:00:00+10',
    'Open Tender',
    'Phase No.2 of the Karavia Jetty and Onshore Facilities in Karavia, Gazelle District, East New Britain Province',
    'Phase No.2 of the Karavia Jetty and Onshore Facilities in Karavia, Gazelle District, East New Britain Province',
    NULL,
    'f50007e9-0000-0000-0000-00000000000f',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-22
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000020',
    'NPC2025-22',
    'a10007e9-0000-0000-0000-000000000015',
    '2025-10-16',
    '2025-10-16 10:00:00+10',
    'Open Tender',
    'Construction of the NFA Office Complex in Voco Point, Lae, Morobe Province. (Re-Tender of NPC2024-04).',
    'Construction of the NFA Office Complex in Voco Point, Lae, Morobe Province. (Re-Tender of NPC2024-04).',
    NULL,
    'f50007e9-0000-0000-0000-00000000000f',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-23
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000021',
    'NPC2025-23',
    'a10007e9-0000-0000-0000-000000000016',
    '2025-08-12',
    '2025-08-12 10:00:00+10',
    'Open Tender',
    'Design, Financing & Construction of Commerical and Business Center,Mendi,Southern Highlands Province',
    'Design, Financing & Construction of Commerical and Business Center,Mendi,Southern Highlands Province',
    NULL,
    'f50007e9-0000-0000-0000-000000000002',
    'Active',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-43
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000022',
    'NPC2025-43',
    'a10007e9-0000-0000-0000-000000000016',
    '2025-12-23',
    '2025-12-23 10:00:00+10',
    'Open Tender',
    'Re-Tendering for the design documentation and construction of the Banking Facility and Business Center at Walume ,Imbongu District in Southern Highlands Province',
    'Re-Tendering for the design documentation and construction of the Banking Facility and Business Center at Walume ,Imbongu District in Southern Highlands Province',
    NULL,
    'f50007e9-0000-0000-0000-000000000010',
    'Active',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-44
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000023',
    'NPC2025-44',
    'a10007e9-0000-0000-0000-000000000017',
    '2025-12-23',
    '2025-12-23 10:00:00+10',
    'Open Tender',
    'Construction of Goroka District Administration Building in Goroka District, Eastern Highlands Province.',
    'Construction of Goroka District Administration Building in Goroka District, Eastern Highlands Province.',
    2558112111,
    'f50007e9-0000-0000-0000-000000000011',
    'Active',
    (SELECT id FROM officers WHERE email = 'agarobe.agaru@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agarobe.agaru@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agarobe.agaru@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-10
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000024',
    'NPC2025-10',
    'a10007e9-0000-0000-0000-000000000006',
    '2025-06-24',
    '2025-06-24 10:00:00+10',
    'Open Tender',
    'Single Source Procurement Method for the Demolition,Mobilizationand Earthworks for the Comprehensive Cancer Center at Port Moresby General Hospital.',
    'Single Source Procurement Method for the Demolition,Mobilizationand Earthworks for the Comprehensive Cancer Center at Port Moresby General Hospital.',
    14,
    'f50007e9-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'macnamara.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamara.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamara.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e9-0000-0000-0000-00000000000a',
    '100007e9-0000-0000-0000-000000000024',
    'c10007e9-0000-0000-0000-00000000000a',
    '2025-12-31',
    4781923.15,
    'PGK',
    'CON-NPC2025-10',
    '2025-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2025-11
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000025',
    'NPC2025-11',
    'a10007e9-0000-0000-0000-000000000006',
    '2025-06-24',
    '2025-06-24 10:00:00+10',
    'Open Tender',
    'Single Source Procurement Method for the L-3 Roof Structural/Apron Walls for the New Cancer Center at Port Moresby General Hospital.',
    'Single Source Procurement Method for the L-3 Roof Structural/Apron Walls for the New Cancer Center at Port Moresby General Hospital.',
    NULL,
    'f50007e9-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'macnamara.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamara.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamara.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e9-0000-0000-0000-00000000000b',
    '100007e9-0000-0000-0000-000000000025',
    'c10007e9-0000-0000-0000-00000000000b',
    '2025-12-31',
    1520130.35,
    'PGK',
    'CON-NPC2025-11',
    '2025-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2025-12
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000026',
    'NPC2025-12',
    'a10007e9-0000-0000-0000-000000000006',
    '2025-06-24',
    '2025-06-24 10:00:00+10',
    'Open Tender',
    'Single Source Procurement Method for the Procurement of Siemens Somatom Pro CT Simulator for the New Cancer Center at Port Moresby General Hospital',
    'Single Source Procurement Method for the Procurement of Siemens Somatom Pro CT Simulator for the New Cancer Center at Port Moresby General Hospital',
    NULL,
    'f50007e9-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e9-0000-0000-0000-00000000000c',
    '100007e9-0000-0000-0000-000000000026',
    'c10007e9-0000-0000-0000-00000000000c',
    '2025-12-31',
    3173517.39,
    'PGK',
    'CON-NPC2025-12',
    '2025-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2025-13
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000027',
    'NPC2025-13',
    'a10007e9-0000-0000-0000-000000000011',
    '2025-06-24',
    '2025-06-24 10:00:00+10',
    'Open Tender',
    'Single Source Procurement Method for the Procurement Method for Brachytherapy Suite Facility and Ground Floor Service Upgrade for Cancer Center at Port Moresby General Hospital.',
    'Single Source Procurement Method for the Procurement Method for Brachytherapy Suite Facility and Ground Floor Service Upgrade for Cancer Center at Port Moresby General Hospital.',
    NULL,
    'f50007e9-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e9-0000-0000-0000-00000000000d',
    '100007e9-0000-0000-0000-000000000027',
    'c10007e9-0000-0000-0000-00000000000d',
    '2025-12-31',
    13429244.86,
    'PGK',
    'CON-NPC2025-13',
    '2025-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2025-14
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000028',
    'NPC2025-14',
    'a10007e9-0000-0000-0000-000000000018',
    '2025-06-25',
    '2025-06-25 10:00:00+10',
    'Single Source',
    'Single Source Procurement Method for the Procurement Method of the Construction of Two (2) New University of Goroka (UOG) Student Dormitories.',
    'Single Source Procurement Method for the Procurement Method of the Construction of Two (2) New University of Goroka (UOG) Student Dormitories.',
    2551304201,
    'f50007e9-0000-0000-0000-000000000002',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-20
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-000000000029',
    'NPC2025-20',
    'a10007e9-0000-0000-0000-000000000015',
    '2025-10-16',
    '2025-10-16 10:00:00+10',
    'Open Tender',
    'Demolition, Earthworks and Construction of the new Madang Provincial Fisheries Office in Binen Point, Madang Town, Madang Province.',
    'Demolition, Earthworks and Construction of the new Madang Provincial Fisheries Office in Binen Point, Madang Town, Madang Province.',
    NULL,
    'f50007e9-0000-0000-0000-000000000012',
    'Active',
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-30
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-00000000002a',
    'NPC2025-30',
    'a10007e9-0000-0000-0000-000000000009',
    '2025-09-05',
    '2025-09-05 10:00:00+10',
    'Open Tender',
    'Engineering Procurement and Construction (EPC) of Hawa 1MW BESS Solor System in Tari Hela Province',
    'Engineering Procurement and Construction (EPC) of Hawa 1MW BESS Solor System in Tari Hela Province',
    NULL,
    'f50007e9-0000-0000-0000-000000000013',
    'Active',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-31
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-00000000002b',
    'NPC2025-31',
    'a10007e9-0000-0000-0000-000000000019',
    '2025-09-08',
    '2025-09-08 10:00:00+10',
    'Open Tender',
    'Single Source Procurement for Consultancy Services for Finschhafen Integrated Special Economic Zone (FISEZ) licensing Project.',
    'Single Source Procurement for Consultancy Services for Finschhafen Integrated Special Economic Zone (FISEZ) licensing Project.',
    5000000,
    'f50007e9-0000-0000-0000-000000000013',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e9-0000-0000-0000-00000000000e',
    '100007e9-0000-0000-0000-00000000002b',
    'c10007e9-0000-0000-0000-00000000000f',
    '2025-12-31',
    9800000,
    'PGK',
    'CON-NPC2025-31',
    '2025-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2025-39
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-00000000002c',
    'NPC2025-39',
    'a10007e9-0000-0000-0000-000000000014',
    '2025-11-17',
    '2025-11-17 10:00:00+10',
    'Open Tender',
    'Design & Construction of Two Storey Commercial and Business Centre, Mendi, Southern Highlands Province.',
    'Design & Construction of Two Storey Commercial and Business Centre, Mendi, Southern Highlands Province.',
    NULL,
    'f50007e9-0000-0000-0000-00000000000e',
    'Active',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2025-36
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e9-0000-0000-0000-00000000002d',
    'NPC2025-36',
    'a10007e9-0000-0000-0000-00000000001a',
    '2025-10-24',
    '2025-10-24 10:00:00+10',
    'Open Tender',
    'Development of Phase No.2, The National Ward Record System (NWRS) for Department of Provincial & Local Level Government Affairs (DPLLGA)',
    'Development of Phase No.2, The National Ward Record System (NWRS) for Department of Provincial & Local Level Government Affairs (DPLLGA)',
    3000000,
    'f50007e9-0000-0000-0000-000000000002',
    'Active',
    (SELECT id FROM officers WHERE email = 'elton.eka@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'elton.eka@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'elton.eka@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- END OF 2025 DATA MIGRATION
