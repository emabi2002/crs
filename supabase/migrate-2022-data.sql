-- ============================================
-- 2022 CONTRACT REGISTRY DATA MIGRATION
-- Generated from 2022_crs.csv
-- ============================================


-- AGENCIES (7 records)
INSERT INTO agencies (id, name, abbreviation, level, sector) VALUES
    ('a10007e6-0000-0000-0000-000000000001', 'Department of Education', 'DoE', 'National', 'Education'),
    ('a10007e6-0000-0000-0000-000000000002', 'Department of Works & Highways', 'DoWH', 'National', 'Infrastructure'),
    ('a10007e6-0000-0000-0000-000000000003', 'Department of Lands & Physical Planning', 'DL&PP', 'National', 'Other'),
    ('a10007e6-0000-0000-0000-000000000004', 'K3', '', 'National', 'Other'),
    ('a10007e6-0000-0000-0000-000000000005', 'Department of Health', 'DoH', 'National', 'Health'),
    ('a10007e6-0000-0000-0000-000000000006', 'Department of Information & Communication Technology (DICT).', 'DICT', 'National', 'Other'),
    ('a10007e6-0000-0000-0000-000000000007', 'National Maritime Safety Authority', 'NMSA', 'National', 'Maritime')
ON CONFLICT (id) DO NOTHING;

-- FUNDING SOURCES (4 records)
INSERT INTO funding_sources (id, name, donor_name) VALUES
    ('f50007e6-0000-0000-0000-000000000001', 'GoPNG', NULL),
    ('f50007e6-0000-0000-0000-000000000002', '468', NULL),
    ('f50007e6-0000-0000-0000-000000000003', 'GoPNG', NULL),
    ('f50007e6-0000-0000-0000-000000000004', 'Own Source Revenue', NULL)
ON CONFLICT (id) DO NOTHING;

-- OFFICERS (9 records)
INSERT INTO officers (id, full_name, email, agency_id, role) VALUES
    ('0f0007e6-0000-0000-0000-000000000001', 'Geoffrey Kinibo', 'geoffrey.kinibo@npc.gov.pg', 'a10007e6-0000-0000-0000-000000000001', 'Procurement Officer'),
    ('0f0007e6-0000-0000-0000-000000000002', 'Guria Verave', 'guria.verave@npc.gov.pg', 'a10007e6-0000-0000-0000-000000000002', 'Procurement Officer'),
    ('0f0007e6-0000-0000-0000-000000000003', 'Frank Hare', 'frank.hare@npc.gov.pg', 'a10007e6-0000-0000-0000-000000000003', 'Procurement Officer'),
    ('0f0007e6-0000-0000-0000-000000000004', 'Hane Hekwa', 'hane.hekwa@npc.gov.pg', 'a10007e6-0000-0000-0000-000000000002', 'Procurement Officer'),
    ('0f0007e6-0000-0000-0000-000000000005', 'Angeline Oki  Hane Hekwa', 'angeline.oki.hane.hekwa@npc.gov.pg', 'a10007e6-0000-0000-0000-000000000001', 'Procurement Officer'),
    ('0f0007e6-0000-0000-0000-000000000006', '.Completed MeetingN Jacoom Buidling LimitedK', '.completed.meetingn.jacoom.buidling.limitedk@npc.gov.pg', 'a10007e6-0000-0000-0000-000000000004', 'Procurement Officer'),
    ('0f0007e6-0000-0000-0000-000000000007', 'Veari Hitolo', 'veari.hitolo@npc.gov.pg', 'a10007e6-0000-0000-0000-000000000005', 'Procurement Officer'),
    ('0f0007e6-0000-0000-0000-000000000008', 'Agaru Agarobe', 'agaru.agarobe@npc.gov.pg', 'a10007e6-0000-0000-0000-000000000001', 'Procurement Officer'),
    ('0f0007e6-0000-0000-0000-000000000009', 'Vincent Dangiaba', 'vincent.dangiaba@npc.gov.pg', 'a10007e6-0000-0000-0000-000000000007', 'Procurement Officer')
ON CONFLICT (email) DO NOTHING;

-- CONTRACTORS (6 records)
INSERT INTO contractors (id, legal_name, trading_name, address, province, contact_person, phone, email, status, categories) VALUES
    ('c10007e6-0000-0000-0000-000000000001', 'Wopa Construction (PNG) Limited', 'Wopa Construction (PNG) Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e6-0000-0000-0000-000000000002', 'MH Supplies Limited', 'MH Supplies Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c10007e6-0000-0000-0000-000000000003', 'COVEC (PNG) Limited', 'COVEC (PNG) Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e6-0000-0000-0000-000000000004', 'Civil Pacific Contractors Limited (CIVIPAC)', 'Civil Pacific Contractors Limited (CIVIPAC)', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e6-0000-0000-0000-000000000005', 'Ocean Works Limited', 'Ocean Works Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e6-0000-0000-0000-000000000006', 'Surveillance Systems Limited', 'Surveillance Systems Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works'])
ON CONFLICT (id) DO NOTHING;

-- TENDERS (22 records)

-- Tender: NPC2022-01
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-000000000001',
    'NPC2022-01',
    'a10007e6-0000-0000-0000-000000000001',
    '2022-01-01',
    NULL,
    'Open Tender',
    'EOI for Delivery of Education Haus',
    'EOI for Delivery of Education Haus',
    NULL,
    'f50007e6-0000-0000-0000-000000000001',
    'Active',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2022-02
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-000000000002',
    'NPC2022-02',
    'a10007e6-0000-0000-0000-000000000002',
    '2022-11-11',
    '2022-11-11 10:00:00+10',
    'Open Tender',
    'Long Term Performance Based Road Maintenance Services along Highlands Highway from Togoba Junction in WHP to Tomba Check-Point (Boarder WHP & Enga - 28.2km) in WHP',
    'Long Term Performance Based Road Maintenance Services along Highlands Highway from Togoba Junction in WHP to Tomba Check-Point (Boarder WHP & Enga - 28.2km) in WHP',
    9994201.81,
    'f50007e6-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e6-0000-0000-0000-000000000001',
    '100007e6-0000-0000-0000-000000000002',
    'c10007e6-0000-0000-0000-000000000001',
    '2022-11-11',
    9947452.68,
    'PGK',
    'CON-NPC2022-02',
    '2022-11-11',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2022-03
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-000000000003',
    'NPC2022-03',
    'a10007e6-0000-0000-0000-000000000003',
    '2022-01-01',
    NULL,
    'Open Tender',
    'Provision of Security Services',
    'Provision of Security Services',
    2100000,
    'f50007e6-0000-0000-0000-000000000001',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2022-04
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-000000000004',
    'NPC2022-04',
    'a10007e6-0000-0000-0000-000000000002',
    '2022-01-01',
    NULL,
    'Open Tender',
    'Construction of Foundation Works for Simbu National Polytechnic Institute',
    'Construction of Foundation Works for Simbu National Polytechnic Institute',
    5243188,
    'f50007e6-0000-0000-0000-000000000001',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2022-05
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-000000000005',
    'NPC2022-05',
    'a10007e6-0000-0000-0000-000000000001',
    '2022-01-01',
    NULL,
    'Open Tender',
    'Project Management for Simbu National Polytechnic Institute',
    'Project Management for Simbu National Polytechnic Institute',
    2800000,
    'f50007e6-0000-0000-0000-000000000001',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2022-06
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-000000000006',
    'NPC2022-06',
    'a10007e6-0000-0000-0000-000000000001',
    '2022-03-08',
    '2022-03-08 10:00:00+10',
    'Open Tender',
    'Rehabilitation of two Double Classrooms for Kerevat National high School, ENBP.',
    'Rehabilitation of two Double Classrooms for Kerevat National high School, ENBP.',
    NULL,
    'f50007e6-0000-0000-0000-000000000001',
    'Active',
    (SELECT id FROM officers WHERE email = 'angeline.oki.hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki.hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki.hane.hekwa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: 427
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-000000000007',
    '427',
    'a10007e6-0000-0000-0000-000000000004',
    '2023-02-02',
    '2023-02-02 10:00:00+10',
    'Open Tender',
    '110',
    '110',
    NULL,
    'f50007e6-0000-0000-0000-000000000002',
    'Active',
    (SELECT id FROM officers WHERE email = '.completed.meetingn.jacoom.buidling.limitedk@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = '.completed.meetingn.jacoom.buidling.limitedk@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = '.completed.meetingn.jacoom.buidling.limitedk@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2022-07
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-000000000008',
    'NPC2022-07',
    'a10007e6-0000-0000-0000-000000000002',
    '2022-11-11',
    '2022-11-11 10:00:00+10',
    'Open Tender',
    'Long Term Performance based road maintenance services from Walume Junction to Angula Bridge in the Imbonggu area of Southern Highlands Province.',
    'Long Term Performance based road maintenance services from Walume Junction to Angula Bridge in the Imbonggu area of Southern Highlands Province.',
    NULL,
    'f50007e6-0000-0000-0000-000000000001',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2022-08
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-000000000009',
    'NPC2022-08',
    'a10007e6-0000-0000-0000-000000000005',
    '2022-10-25',
    '2022-10-25 10:00:00+10',
    'Open Tender',
    'Provision of Customs Clearance & Handling Services.',
    'Provision of Customs Clearance & Handling Services.',
    5000000,
    'f50007e6-0000-0000-0000-000000000001',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2022-09
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-00000000000a',
    'NPC2022-09',
    'a10007e6-0000-0000-0000-000000000001',
    '2022-07-19',
    '2022-07-19 10:00:00+10',
    'Open Tender',
    'Purchase and Supply of Mathemtics and Science equipment kits to selected primary provincial high and secondary schools in the Southern Region',
    'Purchase and Supply of Mathemtics and Science equipment kits to selected primary provincial high and secondary schools in the Southern Region',
    249188,
    'f50007e6-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e6-0000-0000-0000-000000000002',
    '100007e6-0000-0000-0000-00000000000a',
    'c10007e6-0000-0000-0000-000000000002',
    '2022-08-08',
    7124751.66,
    'PGK',
    'CON-NPC2022-09',
    '2022-08-08',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e6-0000-0000-0000-000000000002',
    '100007e6-0000-0000-0000-00000000000a',
    'NPC Board',
    'M-11/22 on 08/08/22',
    '2022-08-08',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2022-10
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-00000000000b',
    'NPC2022-10',
    'a10007e6-0000-0000-0000-000000000001',
    '2022-07-19',
    '2022-07-19 10:00:00+10',
    'Open Tender',
    'Purchase and Supply of Mathemtics and Science equipment kits to selected primary provincial high and secondary schools in the Highlands Region',
    'Purchase and Supply of Mathemtics and Science equipment kits to selected primary provincial high and secondary schools in the Highlands Region',
    249189,
    'f50007e6-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e6-0000-0000-0000-000000000003',
    '100007e6-0000-0000-0000-00000000000b',
    'c10007e6-0000-0000-0000-000000000002',
    '2022-08-08',
    9604199.6,
    'PGK',
    'CON-NPC2022-10',
    '2022-08-08',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e6-0000-0000-0000-000000000003',
    '100007e6-0000-0000-0000-00000000000b',
    'NPC Board',
    'M-11/22 on 08/08/22',
    '2022-08-08',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2022-11
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-00000000000c',
    'NPC2022-11',
    'a10007e6-0000-0000-0000-000000000001',
    '2022-07-19',
    '2022-07-19 10:00:00+10',
    'Open Tender',
    'Purchase and Supply of Mathemtics and Science equipment kits to selected primary provincial high and secondary schools in the Momase Region',
    'Purchase and Supply of Mathemtics and Science equipment kits to selected primary provincial high and secondary schools in the Momase Region',
    249190,
    'f50007e6-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e6-0000-0000-0000-000000000004',
    '100007e6-0000-0000-0000-00000000000c',
    'c10007e6-0000-0000-0000-000000000002',
    '2022-08-08',
    9580535.4,
    'PGK',
    'CON-NPC2022-11',
    '2022-08-08',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e6-0000-0000-0000-000000000004',
    '100007e6-0000-0000-0000-00000000000c',
    'NPC Board',
    'M-11/22 on 08/08/22',
    '2022-08-08',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2022-12
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-00000000000d',
    'NPC2022-12',
    'a10007e6-0000-0000-0000-000000000001',
    '2022-07-19',
    '2022-07-19 10:00:00+10',
    'Open Tender',
    'Purchase and Supply of Mathemtics and Science equipment kits to selected primary provincial high and secondary schools in the NGI Region',
    'Purchase and Supply of Mathemtics and Science equipment kits to selected primary provincial high and secondary schools in the NGI Region',
    249191,
    'f50007e6-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e6-0000-0000-0000-000000000005',
    '100007e6-0000-0000-0000-00000000000d',
    'c10007e6-0000-0000-0000-000000000002',
    '2022-08-08',
    5040616.75,
    'PGK',
    'CON-NPC2022-12',
    '2022-08-08',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e6-0000-0000-0000-000000000005',
    '100007e6-0000-0000-0000-00000000000d',
    'NPC Board',
    'M-11/22 on 08/08/22',
    '2022-08-08',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2022-14
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-00000000000e',
    'NPC2022-14',
    'a10007e6-0000-0000-0000-000000000006',
    '2022-01-01',
    NULL,
    'Open Tender',
    'Kumul-1 Satellite Review Project    - Consultancy',
    'Kumul-1 Satellite Review Project    - Consultancy',
    222580823,
    'f50007e6-0000-0000-0000-000000000001',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2022-15
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-00000000000f',
    'NPC2022-15',
    'a10007e6-0000-0000-0000-000000000002',
    '2022-10-21',
    '2022-10-21 10:00:00+10',
    'Open Tender',
    '(Contract No.10-CRNG-RFT-KTKSR-47/22) Detailed Design & Construction of a 11.97km 4-lane Road between UMW Roundabout in Kokopo and Tokua Airport Carpark and pavement Restoration of Williams Road from',
    '(Contract No.10-CRNG-RFT-KTKSR-47/22) Detailed Design & Construction of a 11.97km 4-lane Road between UMW Roundabout in Kokopo and Tokua Airport Carpark and pavement Restoration of Williams Road from Kokopo Secondary Roundabout to UMW Roundabout in Kokopo ENBP.',
    NULL,
    'f50007e6-0000-0000-0000-000000000003',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e6-0000-0000-0000-000000000006',
    '100007e6-0000-0000-0000-00000000000f',
    'c10007e6-0000-0000-0000-000000000003',
    '2023-10-26',
    221762205.08,
    'PGK',
    'CON-NPC2022-15',
    '2023-10-26',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e6-0000-0000-0000-000000000006',
    '100007e6-0000-0000-0000-00000000000f',
    'NEC',
    'NEC Decision No:299/2023, Special Meeting No.30/20',
    '2023-10-26',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2022-16
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-000000000010',
    'NPC2022-16',
    'a10007e6-0000-0000-0000-000000000002',
    '2022-11-17',
    '2022-11-17 10:00:00+10',
    'Open Tender',
    '(Contract No.16-CPNG-REF-MH-49/2022)                                              Design and Construion of Rindita-Kware Road from Rindidita Junction to Kware Station of 19.2km in SHP',
    '(Contract No.16-CPNG-REF-MH-49/2022)                                              Design and Construion of Rindita-Kware Road from Rindidita Junction to Kware Station of 19.2km in SHP',
    NULL,
    'f50007e6-0000-0000-0000-000000000003',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e6-0000-0000-0000-000000000007',
    '100007e6-0000-0000-0000-000000000010',
    'c10007e6-0000-0000-0000-000000000004',
    '2023-10-26',
    93874213.55,
    'PGK',
    'CON-NPC2022-16',
    '2023-10-26',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e6-0000-0000-0000-000000000007',
    '100007e6-0000-0000-0000-000000000010',
    'NEC',
    'NEC Decision No:300/2023, Special Meeting No:30/20',
    '2023-10-26',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2022-17
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-000000000011',
    'NPC2022-17',
    'a10007e6-0000-0000-0000-000000000002',
    '2022-10-21',
    '2022-10-21 10:00:00+10',
    'Open Tender',
    'Detailed Design & Construction of 40.622km 2-Lane roads and a 2.213km 4-Lane Road within Mt. Hagen Town area in WHP.',
    'Detailed Design & Construction of 40.622km 2-Lane roads and a 2.213km 4-Lane Road within Mt. Hagen Town area in WHP.',
    252651450.17,
    'f50007e6-0000-0000-0000-000000000003',
    'Active',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2022-18
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-000000000012',
    'NPC2022-18',
    'a10007e6-0000-0000-0000-000000000002',
    '2023-02-09',
    '2023-02-09 10:00:00+10',
    'Open Tender',
    'Financing, Detailed Design and Construction of 21.0km Section of Hiritano Highway between Laloki River Bridge to Brown River Bridge under Connect PNG in Central Province (Connect PNG Project)',
    'Financing, Detailed Design and Construction of 21.0km Section of Hiritano Highway between Laloki River Bridge to Brown River Bridge under Connect PNG in Central Province (Connect PNG Project)',
    120000000,
    'f50007e6-0000-0000-0000-000000000003',
    'Active',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2022-19
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-000000000013',
    'NPC2022-19',
    'a10007e6-0000-0000-0000-000000000007',
    '2022-12-21',
    '2022-12-21 10:00:00+10',
    'Open Tender',
    'Supply and Installation of two (2) New Navtex Stations',
    'Supply and Installation of two (2) New Navtex Stations',
    1800000,
    'f50007e6-0000-0000-0000-000000000004',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'vincent.dangiaba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'vincent.dangiaba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'vincent.dangiaba@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2022-20
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-000000000014',
    'NPC2022-20',
    'a10007e6-0000-0000-0000-000000000007',
    '2022-12-21',
    '2022-12-21 10:00:00+10',
    'Open Tender',
    'Replacement of Aids to  Navigation (AtoN) Pile Structure',
    'Replacement of Aids to  Navigation (AtoN) Pile Structure',
    1800000,
    'f50007e6-0000-0000-0000-000000000004',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'vincent.dangiaba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'vincent.dangiaba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'vincent.dangiaba@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e6-0000-0000-0000-000000000008',
    '100007e6-0000-0000-0000-000000000014',
    'c10007e6-0000-0000-0000-000000000005',
    '2022-12-21',
    6896500,
    'PGK',
    'CON-NPC2022-20',
    '2022-12-21',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2022-21
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-000000000015',
    'NPC2022-21',
    'a10007e6-0000-0000-0000-000000000007',
    '2022-12-21',
    '2022-12-21 10:00:00+10',
    'Open Tender',
    'Maintenance of the PNG National Maritime Safety Authority automatic Identification System (AIS) and Coastal Monitoring stations (CMS) Coastal Network',
    'Maintenance of the PNG National Maritime Safety Authority automatic Identification System (AIS) and Coastal Monitoring stations (CMS) Coastal Network',
    1200000,
    'f50007e6-0000-0000-0000-000000000004',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'vincent.dangiaba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'vincent.dangiaba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'vincent.dangiaba@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e6-0000-0000-0000-000000000009',
    '100007e6-0000-0000-0000-000000000015',
    'c10007e6-0000-0000-0000-000000000006',
    '2022-12-21',
    7395890,
    'PGK',
    'CON-NPC2022-21',
    '2022-12-21',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2022-22
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e6-0000-0000-0000-000000000016',
    'NPC2022-22',
    'a10007e6-0000-0000-0000-000000000002',
    '2022-12-20',
    '2022-12-20 10:00:00+10',
    'Open Tender',
    'Long Term Performance based Maintenance Service (3 years from Tomba/tambul Road Junction (Ch0+000km) to Mendi/Kandep Junction (Ch53+500km) Section in WH & SH Provinces',
    'Long Term Performance based Maintenance Service (3 years from Tomba/tambul Road Junction (Ch0+000km) to Mendi/Kandep Junction (Ch53+500km) Section in WH & SH Provinces',
    NULL,
    'f50007e6-0000-0000-0000-000000000001',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- END OF 2022 DATA MIGRATION
