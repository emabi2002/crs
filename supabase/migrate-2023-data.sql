-- ============================================
-- 2023 CONTRACT REGISTRY DATA MIGRATION
-- Generated from 2023_crs.csv
-- ============================================


-- AGENCIES (13 records)
INSERT INTO agencies (id, name, abbreviation, level, sector) VALUES
    ('a10007e7-0000-0000-0000-000000000001', 'National Information & Communications Technology Authority', 'NICTA', 'National', 'Other'),
    ('a10007e7-0000-0000-0000-000000000002', 'Budget Value: K2', '', 'National', 'Other'),
    ('a10007e7-0000-0000-0000-000000000003', 'Department of Works & Highways', 'DoWH', 'National', 'Infrastructure'),
    ('a10007e7-0000-0000-0000-000000000004', 'Department of Education', 'DoE', 'National', 'Education'),
    ('a10007e7-0000-0000-0000-000000000005', 'APC Value: K9', '', 'National', 'Other'),
    ('a10007e7-0000-0000-0000-000000000006', 'Internal Revenue Commission', 'IRC', 'National', 'Finance'),
    ('a10007e7-0000-0000-0000-000000000007', 'Royal Papua New Guinea Constabulary', 'RPNGC', 'National', 'Security'),
    ('a10007e7-0000-0000-0000-000000000008', 'Menyamya District Development Authority', 'MDDA', 'Provincial', 'Provincial'),
    ('a10007e7-0000-0000-0000-000000000009', 'Ministry of Education - Office of National Library & Archives', '', 'National', 'Education'),
    ('a10007e7-0000-0000-0000-00000000000a', 'National Maritime Safety Authority', 'NMSA', 'National', 'Maritime'),
    ('a10007e7-0000-0000-0000-00000000000b', 'NEC in its Meeting No.02/2025.,China Overseas Engineering Company (COVEC) PNG Ltd.,K1', 'COVEC', 'National', 'Other'),
    ('a10007e7-0000-0000-0000-00000000000c', 'Department of Prime Minister (PM) & National Executive Council', 'PM', 'National', 'Other'),
    ('a10007e7-0000-0000-0000-00000000000d', 'PNG Department of Defense', 'PNGDF', 'National', 'Security')
ON CONFLICT (id) DO NOTHING;

-- FUNDING SOURCES (8 records)
INSERT INTO funding_sources (id, name, donor_name) VALUES
    ('f50007e7-0000-0000-0000-000000000001', 'GoPNG', NULL),
    ('f50007e7-0000-0000-0000-000000000002', 'GoPNG', NULL),
    ('f50007e7-0000-0000-0000-000000000003', 'Own Source Revenue', NULL),
    ('f50007e7-0000-0000-0000-000000000004', 'MDDA', NULL),
    ('f50007e7-0000-0000-0000-000000000005', 'Asian Development Bank', 'Asian Development Bank'),
    ('f50007e7-0000-0000-0000-000000000006', 'Australian Aid (TSSP)', 'Australian Government (DFAT)'),
    ('f50007e7-0000-0000-0000-000000000007', 'Its Decision No.11/2025', NULL),
    ('f50007e7-0000-0000-0000-000000000008', 'GoPNG', NULL)
ON CONFLICT (id) DO NOTHING;

-- OFFICERS (11 records)
INSERT INTO officers (id, full_name, email, agency_id, role) VALUES
    ('0f0007e7-0000-0000-0000-000000000001', 'Frank Hare', 'frank.hare@npc.gov.pg', 'a10007e7-0000-0000-0000-000000000001', 'Procurement Officer'),
    ('0f0007e7-0000-0000-0000-000000000002', 'Guria Verave', 'guria.verave@npc.gov.pg', 'a10007e7-0000-0000-0000-000000000003', 'Procurement Officer'),
    ('0f0007e7-0000-0000-0000-000000000003', 'Pora Kewa', 'pora.kewa@npc.gov.pg', 'a10007e7-0000-0000-0000-000000000003', 'Procurement Officer'),
    ('0f0007e7-0000-0000-0000-000000000004', 'Hane Hekwa', 'hane.hekwa@npc.gov.pg', 'a10007e7-0000-0000-0000-000000000001', 'Procurement Officer'),
    ('0f0007e7-0000-0000-0000-000000000005', 'Angeline Oki', 'angeline.oki@npc.gov.pg', 'a10007e7-0000-0000-0000-000000000004', 'Procurement Officer'),
    ('0f0007e7-0000-0000-0000-000000000006', 'Josephine Makiba', 'josephine.makiba@npc.gov.pg', 'a10007e7-0000-0000-0000-000000000006', 'Procurement Officer'),
    ('0f0007e7-0000-0000-0000-000000000007', 'Veari Hitolo', 'veari.hitolo@npc.gov.pg', 'a10007e7-0000-0000-0000-000000000007', 'Procurement Officer'),
    ('0f0007e7-0000-0000-0000-000000000008', 'Vincent Dangiaba', 'vincent.dangiaba@npc.gov.pg', 'a10007e7-0000-0000-0000-00000000000a', 'Procurement Officer'),
    ('0f0007e7-0000-0000-0000-000000000009', 'Steven Peter', 'steven.peter@npc.gov.pg', 'a10007e7-0000-0000-0000-000000000003', 'Procurement Officer'),
    ('0f0007e7-0000-0000-0000-00000000000a', '.Endorse to NEC for approval  awaiting contract signing. NEC in its Meeting No.', '.endorse.to.nec.for.approval.awaiting.contract.signing.nec.in.its.meeting.no.@npc.gov.pg', 'a10007e7-0000-0000-0000-00000000000b', 'Procurement Officer'),
    ('0f0007e7-0000-0000-0000-00000000000b', 'Agaru Agarobe', 'agaru.agarobe@npc.gov.pg', 'a10007e7-0000-0000-0000-000000000003', 'Procurement Officer')
ON CONFLICT (email) DO NOTHING;

-- CONTRACTORS (13 records)
INSERT INTO contractors (id, legal_name, trading_name, address, province, contact_person, phone, email, status, categories) VALUES
    ('c10007e7-0000-0000-0000-000000000001', 'Digicel (PNG) Limited', 'Digicel (PNG) Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e7-0000-0000-0000-000000000002', 'Diwani Plant Hire', 'Diwani Plant Hire', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e7-0000-0000-0000-000000000003', 'Too Good Limited', 'Too Good Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e7-0000-0000-0000-000000000004', 'Captured Procurement Solutions', 'Captured Procurement Solutions', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e7-0000-0000-0000-000000000005', 'Virtual Flex Solutions Limited', 'Virtual Flex Solutions Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e7-0000-0000-0000-000000000006', 'Ela Motors', 'Ela Motors', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e7-0000-0000-0000-000000000007', 'Pioneer Construction & Engineering Limited', 'Pioneer Construction & Engineering Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e7-0000-0000-0000-000000000008', 'Wopa Construction (PNG) Limited', 'Wopa Construction (PNG) Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e7-0000-0000-0000-000000000009', 'Dekenai Construction Limited', 'Dekenai Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e7-0000-0000-0000-00000000000a', 'China Wu Yi Co.(PNG) Limited', 'China Wu Yi Co.(PNG) Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e7-0000-0000-0000-00000000000b', 'Orbitz Elevators Pty Limited', 'Orbitz Elevators Pty Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e7-0000-0000-0000-00000000000c', 'China Railway Engineering Construction Company Limited', 'China Railway Engineering Construction Company Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e7-0000-0000-0000-00000000000d', 'Wantok Distributors Limited', 'Wantok Distributors Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works'])
ON CONFLICT (id) DO NOTHING;

-- TENDERS (55 records)

-- Tender: NPC2023-19
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000001',
    'NPC2023-19',
    'a10007e7-0000-0000-0000-000000000001',
    '2023-09-14',
    '2023-09-14 10:00:00+10',
    'Open Tender',
    '4G Mobile Broadband Services-Greenfield (2023-UAS-MBG1)',
    '4G Mobile Broadband Services-Greenfield (2023-UAS-MBG1)',
    23500000,
    'f50007e7-0000-0000-0000-000000000001',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-20
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000002',
    'NPC2023-20',
    'a10007e7-0000-0000-0000-000000000001',
    '2023-09-14',
    '2023-09-14 10:00:00+10',
    'Open Tender',
    'Radio Broadcasting Services                               (2023-UAS-BR1)',
    'Radio Broadcasting Services                               (2023-UAS-BR1)',
    16,
    'f50007e7-0000-0000-0000-000000000001',
    'Active',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: 600
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000003',
    '600',
    'a10007e7-0000-0000-0000-000000000002',
    '2024-04-26',
    '2024-04-26 10:00:00+10',
    'Open Tender',
    '000.00,Contract executed on 30th October 2024',
    '000.00,Contract executed on 30th October 2024',
    NULL,
    NULL,
    'Active',
    NULL,
    NULL,
    NULL
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-21
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000004',
    'NPC2023-21',
    'a10007e7-0000-0000-0000-000000000001',
    '2023-09-14',
    '2023-09-14 10:00:00+10',
    'Open Tender',
    'Fixed Broadband Services (2023-UAS-BRX1)',
    'Fixed Broadband Services (2023-UAS-BRX1)',
    4950000,
    'f50007e7-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e7-0000-0000-0000-000000000001',
    '100007e7-0000-0000-0000-000000000004',
    'c10007e7-0000-0000-0000-000000000001',
    '2024-04-26',
    1400000,
    'PGK',
    'CON-NPC2023-21',
    '2024-04-26',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e7-0000-0000-0000-000000000001',
    '100007e7-0000-0000-0000-000000000004',
    'NPC Board',
    'B/Meeting No.1 26/04/24',
    '2024-04-26',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2023-22
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000005',
    'NPC2023-22',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-06-20',
    '2023-06-20 10:00:00+10',
    'Open Tender',
    'Long-Term Performance-Based Maintenance Service (3years from DOW Junction (CH448+00) to Kapiura (CH398.00km) 48km Section on the New Britain Highway in West New Britain Province.',
    'Long-Term Performance-Based Maintenance Service (3years from DOW Junction (CH448+00) to Kapiura (CH398.00km) 48km Section on the New Britain Highway in West New Britain Province.',
    NULL,
    'f50007e7-0000-0000-0000-000000000001',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-23
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000006',
    'NPC2023-23',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-06-22',
    '2023-06-22 10:00:00+10',
    'Open Tender',
    'Long-Term Performance-Based Maintenance Service (3years from Kai Bridge (CH347+76) to Tiaru No.02 Bridge (CH300.20km) 47.56km Section on the New Britain Highway in West New Britain Province.',
    'Long-Term Performance-Based Maintenance Service (3years from Kai Bridge (CH347+76) to Tiaru No.02 Bridge (CH300.20km) 47.56km Section on the New Britain Highway in West New Britain Province.',
    NULL,
    'f50007e7-0000-0000-0000-000000000001',
    'Active',
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-24
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000007',
    'NPC2023-24',
    'a10007e7-0000-0000-0000-000000000001',
    '2023-07-26',
    '2023-07-26 10:00:00+10',
    'Open Tender',
    'Procurement of Fixed Mobile and Remote -Controlled Radio Monitoring Equipment - Spectrum Monitoring System Project for Papua New Guinea.',
    'Procurement of Fixed Mobile and Remote -Controlled Radio Monitoring Equipment - Spectrum Monitoring System Project for Papua New Guinea.',
    12000000,
    'f50007e7-0000-0000-0000-000000000001',
    'Active',
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-25
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000008',
    'NPC2023-25',
    'a10007e7-0000-0000-0000-000000000004',
    '2024-03-29',
    '2024-03-29 10:00:00+10',
    'Open Tender',
    'Construction of STEM Laboratory for Sogeri National School of Excellence and Secondary Schools in PNG, Central Province.',
    'Construction of STEM Laboratory for Sogeri National School of Excellence and Secondary Schools in PNG, Central Province.',
    3250203,
    'f50007e7-0000-0000-0000-000000000001',
    'Active',
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-26
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000009',
    'NPC2023-26',
    'a10007e7-0000-0000-0000-000000000004',
    '2024-03-29',
    '2024-03-29 10:00:00+10',
    'Open Tender',
    'Construction of STEM Laboratory for Port Moresby National School of Excellence National Capital District.',
    'Construction of STEM Laboratory for Port Moresby National School of Excellence National Capital District.',
    3250203,
    'f50007e7-0000-0000-0000-000000000001',
    'Active',
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-27
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000000a',
    'NPC2023-27',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-11-02',
    '2023-11-02 10:00:00+10',
    'Open Tender',
    'Constract No.41-SRC-CPNG-69/236- The Upgrading, Stabilizing and (RE)Sealing of 67km of Kainantu- Aiyura- Obura Wonenara Road Under Connect PNG Program: Phase1- Pavement recycling,stabilization and sea',
    'Constract No.41-SRC-CPNG-69/236- The Upgrading, Stabilizing and (RE)Sealing of 67km of Kainantu- Aiyura- Obura Wonenara Road Under Connect PNG Program: Phase1- Pavement recycling,stabilization and sealing of 11.6km between Kainantu/kinston Bridge (CH0+00Km) and Aiyura National High School Gate (CH11+600) including Access to SIL Gate in Kainatu/Obura wonenara Districts of Eastern Highlands Province.',
    NULL,
    'f50007e7-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e7-0000-0000-0000-000000000002',
    '100007e7-0000-0000-0000-00000000000a',
    'c10007e7-0000-0000-0000-000000000002',
    '2023-11-02',
    9531279.13,
    'PGK',
    'CON-NPC2023-27',
    '2023-11-02',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2023-28
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000000b',
    'NPC2023-28',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-11-02',
    '2023-11-02 10:00:00+10',
    'Open Tender',
    'Constract No.41-SRC-CPNG-70/23- The Upgrading, Stabilizing and (RE)Sealing of 67km of Kainantu- Aiyura- Obura Wonenara Road Under Connect PNG Program: Phase 2- Pavement recycling,stabilization and sea',
    'Constract No.41-SRC-CPNG-70/23- The Upgrading, Stabilizing and (RE)Sealing of 67km of Kainantu- Aiyura- Obura Wonenara Road Under Connect PNG Program: Phase 2- Pavement recycling,stabilization and sealing of 54km between Aiyura National High School Gate (CH13+00km) and Obura-Habina junction (CH 67+00Km) in Obura wonenara District of EHP.',
    NULL,
    'f50007e7-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-29
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000000c',
    'NPC2023-29',
    'a10007e7-0000-0000-0000-000000000004',
    '2023-10-12',
    '2023-10-12 10:00:00+10',
    'Open Tender',
    'Purchase and Supply of grade 11 and 12 Mathematics and Science Textbooks for National Schools of  Excellence and Secondary Schools in Papua New Guinea.',
    'Purchase and Supply of grade 11 and 12 Mathematics and Science Textbooks for National Schools of  Excellence and Secondary Schools in Papua New Guinea.',
    NULL,
    'f50007e7-0000-0000-0000-000000000001',
    'Active',
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: 695
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000000d',
    '695',
    'a10007e7-0000-0000-0000-000000000005',
    '2023-01-01',
    NULL,
    'Open Tender',
    '304.21,Contract Executed',
    '304.21,Contract Executed',
    NULL,
    NULL,
    'Active',
    NULL,
    NULL,
    NULL
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-30
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000000e',
    'NPC2023-30',
    'a10007e7-0000-0000-0000-000000000004',
    '2023-10-12',
    '2023-10-12 10:00:00+10',
    'Open Tender',
    'Purchase and Supply of grade 11 and 12 English and Social Science Textbooks for National Schools of  Excellence and Secondary Schools in Papua New Guinea.',
    'Purchase and Supply of grade 11 and 12 English and Social Science Textbooks for National Schools of  Excellence and Secondary Schools in Papua New Guinea.',
    5961292,
    'f50007e7-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e7-0000-0000-0000-000000000003',
    '100007e7-0000-0000-0000-00000000000e',
    'c10007e7-0000-0000-0000-000000000004',
    '2023-10-12',
    5811105.05,
    'PGK',
    'CON-NPC2023-30',
    '2023-10-12',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2023-31
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000000f',
    'NPC2023-31',
    'a10007e7-0000-0000-0000-000000000003',
    '2024-04-18',
    '2024-04-18 10:00:00+10',
    'Open Tender',
    'Contract No: 533-CPNG-SRC-PJA/60-2023 Design & Construction of Wewak-Angoram Coastal Highway from Passam Junction (CH00+00) to Angoram (Ch100+00) of 100km road Section under Connect PNG in East Sepik',
    'Contract No: 533-CPNG-SRC-PJA/60-2023 Design & Construction of Wewak-Angoram Coastal Highway from Passam Junction (CH00+00) to Angoram (Ch100+00) of 100km road Section under Connect PNG in East Sepik Province.',
    12000000,
    'f50007e7-0000-0000-0000-000000000002',
    'Active',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-32
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000010',
    'NPC2023-32',
    'a10007e7-0000-0000-0000-000000000006',
    '2023-10-31',
    '2023-10-31 10:00:00+10',
    'Open Tender',
    'Requirement Specification for the Fiscalization Managment System (FMS) Project.',
    'Requirement Specification for the Fiscalization Managment System (FMS) Project.',
    NULL,
    'f50007e7-0000-0000-0000-000000000003',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e7-0000-0000-0000-000000000004',
    '100007e7-0000-0000-0000-000000000010',
    'c10007e7-0000-0000-0000-000000000005',
    '2024-07-01',
    11895600,
    'PGK',
    'CON-NPC2023-32',
    '2024-07-01',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e7-0000-0000-0000-000000000002',
    '100007e7-0000-0000-0000-000000000010',
    'NPC Board',
    'B/Meeting No.05 1st July,2024',
    '2024-07-01',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2023-33
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000011',
    'NPC2023-33',
    'a10007e7-0000-0000-0000-000000000007',
    '2023-09-08',
    '2023-09-08 10:00:00+10',
    'Open Tender',
    'Direct Procurement of Purchase 130 Police Vehicles Toyota Land-Cruiser from Ela Motors(Single Source Procurement)',
    'Direct Procurement of Purchase 130 Police Vehicles Toyota Land-Cruiser from Ela Motors(Single Source Procurement)',
    26000000,
    'f50007e7-0000-0000-0000-000000000003',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e7-0000-0000-0000-000000000005',
    '100007e7-0000-0000-0000-000000000011',
    'c10007e7-0000-0000-0000-000000000006',
    '2023-11-01',
    26000000,
    'PGK',
    'CON-NPC2023-33',
    '2023-11-01',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e7-0000-0000-0000-000000000003',
    '100007e7-0000-0000-0000-000000000011',
    'NEC',
    'NEC Decision No:308/2023, Meeting No:12/2023, date',
    '2023-11-01',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2023-34
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000012',
    'NPC2023-34',
    'a10007e7-0000-0000-0000-000000000008',
    '2023-09-20',
    '2023-09-20 10:00:00+10',
    'Open Tender',
    'Menyamaya District Office Building project',
    'Menyamaya District Office Building project',
    NULL,
    'f50007e7-0000-0000-0000-000000000004',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e7-0000-0000-0000-000000000006',
    '100007e7-0000-0000-0000-000000000012',
    'c10007e7-0000-0000-0000-000000000007',
    '2023-12-31',
    14723622.49,
    'PGK',
    'CON-NPC2023-34',
    '2023-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2023-35
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000013',
    'NPC2023-35',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-11-28',
    '2023-11-28 10:00:00+10',
    'Open Tender',
    'Performance Based Road Maintenance Contract from Nadzab Airport Turnoff to Leron Bridge (56.5KM)',
    'Performance Based Road Maintenance Contract from Nadzab Airport Turnoff to Leron Bridge (56.5KM)',
    NULL,
    'f50007e7-0000-0000-0000-000000000005',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-36
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000014',
    'NPC2023-36',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-11-28',
    '2023-11-28 10:00:00+10',
    'Open Tender',
    'Performance Based Road Maintenance Contract from Leron Bridge  to Yung Bridge  (53.8KM)',
    'Performance Based Road Maintenance Contract from Leron Bridge  to Yung Bridge  (53.8KM)',
    NULL,
    'f50007e7-0000-0000-0000-000000000005',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-37
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000015',
    'NPC2023-37',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-11-28',
    '2023-11-28 10:00:00+10',
    'Open Tender',
    'Performance Based Road Maintenance Contract fromYung Bridge  to Honerangka Bridge(46.3KM)',
    'Performance Based Road Maintenance Contract fromYung Bridge  to Honerangka Bridge(46.3KM)',
    NULL,
    'f50007e7-0000-0000-0000-000000000005',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-38
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000016',
    'NPC2023-38',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-11-28',
    '2023-11-28 10:00:00+10',
    'Open Tender',
    'Performance Based Road Maintenance Contract from Umbaka Bridge to Taraboro Bridge  (50.1KM)',
    'Performance Based Road Maintenance Contract from Umbaka Bridge to Taraboro Bridge  (50.1KM)',
    NULL,
    'f50007e7-0000-0000-0000-000000000005',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-39
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000017',
    'NPC2023-39',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-11-28',
    '2023-11-28 10:00:00+10',
    'Open Tender',
    'Performance Based Road Maintenance Contract from Taraboro Bridge to Mangiro Bridge   (52.4KM)',
    'Performance Based Road Maintenance Contract from Taraboro Bridge to Mangiro Bridge   (52.4KM)',
    NULL,
    'f50007e7-0000-0000-0000-000000000005',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-40
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000018',
    'NPC2023-40',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-11-28',
    '2023-11-28 10:00:00+10',
    'Open Tender',
    'Performance Based Road Maintenance Contract from Mangiro Bridge to Miunde Bridge   (52.3KM)',
    'Performance Based Road Maintenance Contract from Mangiro Bridge to Miunde Bridge   (52.3KM)',
    NULL,
    'f50007e7-0000-0000-0000-000000000005',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-41
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000019',
    'NPC2023-41',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-11-28',
    '2023-11-28 10:00:00+10',
    'Open Tender',
    'Performance Based Road Maintenance Contract from Miunde Bridge to Kagamuga Airport Turnoff   (49.5KM)',
    'Performance Based Road Maintenance Contract from Miunde Bridge to Kagamuga Airport Turnoff   (49.5KM)',
    NULL,
    'f50007e7-0000-0000-0000-000000000005',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-42
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000001a',
    'NPC2023-42',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-10-04',
    '2023-10-04 10:00:00+10',
    'Open Tender',
    'Bridge Design and Construction at Iomare creek (CH19+30KM) along Hiritano Highway in Central Province',
    'Bridge Design and Construction at Iomare creek (CH19+30KM) along Hiritano Highway in Central Province',
    NULL,
    'f50007e7-0000-0000-0000-000000000006',
    'Active',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-43
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000001b',
    'NPC2023-43',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-10-04',
    '2023-10-04 10:00:00+10',
    'Open Tender',
    'Pavement Maintenance and Sealing of the Hiritano Highway from Laloki Bridge (CH000+000KM) to Brown River Bridge (CH022+100KM) in Central Province',
    'Pavement Maintenance and Sealing of the Hiritano Highway from Laloki Bridge (CH000+000KM) to Brown River Bridge (CH022+100KM) in Central Province',
    NULL,
    'f50007e7-0000-0000-0000-000000000006',
    'Active',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-44
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000001c',
    'NPC2023-44',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-10-04',
    '2023-10-04 10:00:00+10',
    'Open Tender',
    'Design and Construction of 31M Lubugoro East Bridge (CH17.2KM) along Hiritano Highway in Central Province',
    'Design and Construction of 31M Lubugoro East Bridge (CH17.2KM) along Hiritano Highway in Central Province',
    NULL,
    'f50007e7-0000-0000-0000-000000000006',
    'Active',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-45
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000001d',
    'NPC2023-45',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-10-04',
    '2023-10-04 10:00:00+10',
    'Open Tender',
    'Design and Construction of 25.2M of a Creek Bridge (East -Bridge Design ) at Dasiama Market (CH 10.1Km) along Hiritano Highway in Central Province',
    'Design and Construction of 25.2M of a Creek Bridge (East -Bridge Design ) at Dasiama Market (CH 10.1Km) along Hiritano Highway in Central Province',
    NULL,
    'f50007e7-0000-0000-0000-000000000006',
    'Active',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-46
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000001e',
    'NPC2023-46',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-10-04',
    '2023-10-04 10:00:00+10',
    'Open Tender',
    'Long Term Maintenance on the Hiritano Highway from Laloki Bridge (Ch.00+000KM) to Bereina Station Junction (CH.142+900Km)',
    'Long Term Maintenance on the Hiritano Highway from Laloki Bridge (Ch.00+000KM) to Bereina Station Junction (CH.142+900Km)',
    NULL,
    'f50007e7-0000-0000-0000-000000000006',
    'Active',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-47
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000001f',
    'NPC2023-47',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-10-04',
    '2023-10-04 10:00:00+10',
    'Open Tender',
    'Long Term Maintenance Contract along Hiritano Highway from Malalaua Station (CH199+00Km) to Kerema Town (CH275+400Km)in Gulf Province',
    'Long Term Maintenance Contract along Hiritano Highway from Malalaua Station (CH199+00Km) to Kerema Town (CH275+400Km)in Gulf Province',
    NULL,
    'f50007e7-0000-0000-0000-000000000006',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-48
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000020',
    'NPC2023-48',
    'a10007e7-0000-0000-0000-000000000003',
    '2025-06-30',
    '2025-06-30 10:00:00+10',
    'Open Tender',
    'Major Road Maintenance, Upgrading & Sealing Works along Hiritano Highway from Malalaua Station (CH199+00Km) to Epo Junction (CH266+00Km) in Gulf Province.',
    'Major Road Maintenance, Upgrading & Sealing Works along Hiritano Highway from Malalaua Station (CH199+00Km) to Epo Junction (CH266+00Km) in Gulf Province.',
    NULL,
    'f50007e7-0000-0000-0000-000000000006',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-49
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000021',
    'NPC2023-49',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-10-04',
    '2023-10-04 10:00:00+10',
    'Open Tender',
    'Major Works on the Replacement of Uriri Bridge along Hiritano Highway at CH 105+300 from Apanaipi Bridge in Gulf Province.',
    'Major Works on the Replacement of Uriri Bridge along Hiritano Highway at CH 105+300 from Apanaipi Bridge in Gulf Province.',
    NULL,
    'f50007e7-0000-0000-0000-000000000006',
    'Active',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-01
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000022',
    'NPC2023-01',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-04-25',
    '2023-04-25 10:00:00+10',
    'Open Tender',
    'Design & Construction of Kindeng to Nunga (CH 0+00-16+900) of 16.9km Road under the connect PNG program in western Highlands Province.',
    'Design & Construction of Kindeng to Nunga (CH 0+00-16+900) of 16.9km Road under the connect PNG program in western Highlands Province.',
    NULL,
    'f50007e7-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e7-0000-0000-0000-000000000007',
    '100007e7-0000-0000-0000-000000000022',
    'c10007e7-0000-0000-0000-000000000008',
    '2024-12-23',
    72994738.5,
    'PGK',
    'CON-NPC2023-01',
    '2024-12-23',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e7-0000-0000-0000-000000000004',
    '100007e7-0000-0000-0000-000000000022',
    'NPC Board',
    '23/12/2024',
    '2024-12-23',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2023-02
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000023',
    'NPC2023-02',
    'a10007e7-0000-0000-0000-000000000009',
    '2023-10-03',
    '2023-10-03 10:00:00+10',
    'Open Tender',
    'Construction of Kerema Public Library and Archives at Kerema, Gulf Province.',
    'Construction of Kerema Public Library and Archives at Kerema, Gulf Province.',
    NULL,
    'f50007e7-0000-0000-0000-000000000001',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-03
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000024',
    'NPC2023-03',
    'a10007e7-0000-0000-0000-00000000000a',
    '2023-04-14',
    '2023-04-14 10:00:00+10',
    'Open Tender',
    'Supply of Oil Spill Response Equipment to National Maritime Safety Authority (NMSA).',
    'Supply of Oil Spill Response Equipment to National Maritime Safety Authority (NMSA).',
    6000000,
    'f50007e7-0000-0000-0000-000000000003',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'vincent.dangiaba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'vincent.dangiaba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'vincent.dangiaba@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-04
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000025',
    'NPC2023-04',
    'a10007e7-0000-0000-0000-00000000000a',
    '2024-10-18',
    '2024-10-18 10:00:00+10',
    'Open Tender',
    'Supply of Oil Spill Equipment to Rabaul and Alotau, for the National Maritime Safety Authority (NMSA).',
    'Supply of Oil Spill Equipment to Rabaul and Alotau, for the National Maritime Safety Authority (NMSA).',
    6000000,
    'f50007e7-0000-0000-0000-000000000003',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'vincent.dangiaba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'vincent.dangiaba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'vincent.dangiaba@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-05
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000026',
    'NPC2023-05',
    'a10007e7-0000-0000-0000-000000000003',
    '2024-03-14',
    '2024-03-14 10:00:00+10',
    'Open Tender',
    'Upgrading and Sealing of Vanimo-Green Road from Imbio junction to Green River Station under Connect PNG in West Sepik Province.',
    'Upgrading and Sealing of Vanimo-Green Road from Imbio junction to Green River Station under Connect PNG in West Sepik Province.',
    2023,
    'f50007e7-0000-0000-0000-000000000002',
    'Active',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-06
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000027',
    'NPC2023-06',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-10-12',
    '2023-10-12 10:00:00+10',
    'Open Tender',
    'Re-construction of Sepik Coastal Highway (182km) from Aitape End of Seal to Vanimo DPI Junction under the Connect PNG in West Sepik Province.',
    'Re-construction of Sepik Coastal Highway (182km) from Aitape End of Seal to Vanimo DPI Junction under the Connect PNG in West Sepik Province.',
    2023,
    'f50007e7-0000-0000-0000-000000000001',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-07
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000028',
    'NPC2023-07',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-06-08',
    '2023-06-08 10:00:00+10',
    'Open Tender',
    'Contract No.33-GPNG-SRC-BJAB-54/2022                                                Pavement Rehabilitation, Stabilization and Sealing of Beraina Junction (CH 0+00) to Apanaipe Bridge (CH 32+600) alon',
    'Contract No.33-GPNG-SRC-BJAB-54/2022                                                Pavement Rehabilitation, Stabilization and Sealing of Beraina Junction (CH 0+00) to Apanaipe Bridge (CH 32+600) along Hiritano Highway in Central Province.',
    NULL,
    'f50007e7-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'steven.peter@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'steven.peter@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'steven.peter@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e7-0000-0000-0000-000000000008',
    '100007e7-0000-0000-0000-000000000028',
    'c10007e7-0000-0000-0000-000000000009',
    '2024-08-07',
    7870600.77,
    'PGK',
    'CON-NPC2023-07',
    '2024-08-07',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e7-0000-0000-0000-000000000005',
    '100007e7-0000-0000-0000-000000000028',
    'NEC',
    'NEC Decision: 230/2023 Meeting No.18/2024 held 07/',
    '2024-08-07',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2023-08
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000029',
    'NPC2023-08',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-06-08',
    '2023-06-08 10:00:00+10',
    'Open Tender',
    '(Contract No.33-GPNG-SRC-ABM-55/22)                                                        Long-Term Performance-Based Upgrade, Restoration & Periodic Maintenance of Apanaipi to Malalau Road in (47.56',
    '(Contract No.33-GPNG-SRC-ABM-55/22)                                                        Long-Term Performance-Based Upgrade, Restoration & Periodic Maintenance of Apanaipi to Malalau Road in (47.56km) along Hiritano Higway in Gulf Province',
    NULL,
    'f50007e7-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'steven.peter@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'steven.peter@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'steven.peter@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e7-0000-0000-0000-000000000009',
    '100007e7-0000-0000-0000-000000000029',
    'c10007e7-0000-0000-0000-00000000000a',
    '2023-06-08',
    11230999429,
    'PGK',
    'CON-NPC2023-08',
    '2023-06-08',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2023-09
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000002a',
    'NPC2023-09',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-04-05',
    '2023-04-05 10:00:00+10',
    'Open Tender',
    'Contract No.42-LTMC-GOPNG-66/2023                                                     Long Term Road Maintenance & Restoration Works from Watarise Junction to Pumpoquato Bridge (32km) Section of Morob',
    'Contract No.42-LTMC-GOPNG-66/2023                                                     Long Term Road Maintenance & Restoration Works from Watarise Junction to Pumpoquato Bridge (32km) Section of Morobe along Ramu Highway in Morobe Province.',
    2023,
    'f50007e7-0000-0000-0000-000000000001',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-10
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000002b',
    'NPC2023-10',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-04-05',
    '2023-04-05 10:00:00+10',
    'Open Tender',
    'Contract No.42-LTMC-GOPNG-67/2023                                                 Long Term Road Maintenance & Restoration Works from  Lae Main Wharf (CH0.0km) to 14Mile End of Seal (CH19.5KM) Section',
    'Contract No.42-LTMC-GOPNG-67/2023                                                 Long Term Road Maintenance & Restoration Works from  Lae Main Wharf (CH0.0km) to 14Mile End of Seal (CH19.5KM) Section of Morobe along the Highlands Highway in Morobe Province.',
    NULL,
    'f50007e7-0000-0000-0000-000000000001',
    'Active',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-11
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000002c',
    'NPC2023-11',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-04-05',
    '2023-04-05 10:00:00+10',
    'Open Tender',
    'Contract No.36-DC-CPNG-67/2023                                      Upgrade to Seal of Road Section from Waseta Bridge (CH0+000) to Fala Bridge (CH43+000) along Kokoda Highway, OroProvince.',
    'Contract No.36-DC-CPNG-67/2023                                      Upgrade to Seal of Road Section from Waseta Bridge (CH0+000) to Fala Bridge (CH43+000) along Kokoda Highway, OroProvince.',
    NULL,
    'f50007e7-0000-0000-0000-000000000001',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-12
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000002d',
    'NPC2023-12',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-04-16',
    '2023-04-16 10:00:00+10',
    'Open Tender',
    '(Contract No.33-DC-CPNG-68/2023)                          Design & Construction of 242.0km Section of Magi Highway from Moreguina Junction (CH0.00) in Central Province to Gadaisu (CH242.0) in Milne Ba',
    '(Contract No.33-DC-CPNG-68/2023)                          Design & Construction of 242.0km Section of Magi Highway from Moreguina Junction (CH0.00) in Central Province to Gadaisu (CH242.0) in Milne Bay Province Under Connect PNG Program.',
    NULL,
    'f50007e7-0000-0000-0000-000000000002',
    'Approved',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: 586
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000002e',
    '586',
    'a10007e7-0000-0000-0000-00000000000b',
    '2023-01-01',
    NULL,
    'Open Tender',
    'held on 12th February 2025',
    'held on 12th February 2025',
    NULL,
    'f50007e7-0000-0000-0000-000000000007',
    'Active',
    (SELECT id FROM officers WHERE email = '.endorse.to.nec.for.approval.awaiting.contract.signing.nec.in.its.meeting.no.@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = '.endorse.to.nec.for.approval.awaiting.contract.signing.nec.in.its.meeting.no.@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = '.endorse.to.nec.for.approval.awaiting.contract.signing.nec.in.its.meeting.no.@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-13
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-00000000002f',
    'NPC2023-13',
    'a10007e7-0000-0000-0000-00000000000c',
    '2023-06-06',
    '2023-06-06 10:00:00+10',
    'Open Tender',
    'Installation of three (3x) New Lifts at Sir Manasupe Haus, Waigani, National Capital District.',
    'Installation of three (3x) New Lifts at Sir Manasupe Haus, Waigani, National Capital District.',
    5342806.7,
    'f50007e7-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'steven.peter@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'steven.peter@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'steven.peter@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e7-0000-0000-0000-00000000000a',
    '100007e7-0000-0000-0000-00000000002f',
    'c10007e7-0000-0000-0000-00000000000b',
    '2023-11-17',
    5342806.7,
    'PGK',
    'CON-NPC2023-13',
    '2023-11-17',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e7-0000-0000-0000-000000000007',
    '100007e7-0000-0000-0000-00000000002f',
    'NPC Board',
    'NPC Board Meeting No.13/2023 held on 17/11/23',
    '2023-11-17',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2023-14
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000030',
    'NPC2023-14',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-04-19',
    '2023-04-19 10:00:00+10',
    'Open Tender',
    'Investigation, Design and Construction of Liba Bridge along the Magi Highway in Abau District, Central Province.',
    'Investigation, Design and Construction of Liba Bridge along the Magi Highway in Abau District, Central Province.',
    NULL,
    'f50007e7-0000-0000-0000-000000000001',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-15
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000031',
    'NPC2023-15',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-04-19',
    '2023-04-19 10:00:00+10',
    'Open Tender',
    'Investigation, Design and Construction of Robinson Bridge along the Magi Highway in Abau District, Central Province.',
    'Investigation, Design and Construction of Robinson Bridge along the Magi Highway in Abau District, Central Province.',
    NULL,
    'f50007e7-0000-0000-0000-000000000001',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-16
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000032',
    'NPC2023-16',
    'a10007e7-0000-0000-0000-00000000000d',
    '2024-03-07',
    '2024-03-07 10:00:00+10',
    'Open Tender',
    'PNGDF Catering and Hospitality Services Contract for Southern Region Units.',
    'PNGDF Catering and Hospitality Services Contract for Southern Region Units.',
    98988000,
    'f50007e7-0000-0000-0000-000000000008',
    'Active',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-17
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000033',
    'NPC2023-17',
    'a10007e7-0000-0000-0000-000000000003',
    '2023-06-29',
    '2023-06-29 10:00:00+10',
    'Open Tender',
    'Contract No.37-CPNG-SRC-PM-72/23. Upgrading and sealing of 100.20km Kutubu Road from Highland Highway Junction at Parita (CH00.00) to Moro Gate Kamiri Bridge (CH100.200) in Southern Highlands Province',
    'Contract No.37-CPNG-SRC-PM-72/23. Upgrading and sealing of 100.20km Kutubu Road from Highland Highway Junction at Parita (CH00.00) to Moro Gate Kamiri Bridge (CH100.200) in Southern Highlands Province.',
    NULL,
    'f50007e7-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e7-0000-0000-0000-00000000000b',
    '100007e7-0000-0000-0000-000000000033',
    'c10007e7-0000-0000-0000-00000000000c',
    '2024-06-02',
    371000000,
    'PGK',
    'CON-NPC2023-17',
    '2024-06-02',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e7-0000-0000-0000-000000000008',
    '100007e7-0000-0000-0000-000000000033',
    'NEC',
    'Board endorsed to NEC meeting No.02/6/24, held on',
    '2024-06-02',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2023-18
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000034',
    'NPC2023-18',
    'a10007e7-0000-0000-0000-000000000001',
    '2023-09-14',
    '2023-09-14 10:00:00+10',
    'Open Tender',
    '4G Mobile Broadband Services-Upgrade(2023-UAS-MBU1)',
    '4G Mobile Broadband Services-Upgrade(2023-UAS-MBU1)',
    NULL,
    'f50007e7-0000-0000-0000-000000000001',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-106
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000035',
    'NPC2023-106',
    'a10007e7-0000-0000-0000-000000000004',
    '2023-12-08',
    '2023-12-08 10:00:00+10',
    'Open Tender',
    'Consolidation ,packing,labelling and Delivery of Teaching and Learning Materials under the Governmentn''s Tuition Fee Subsidy (GFTS) policy to all Elementary,Primary and Secondary schools in West Sepik',
    'Consolidation ,packing,labelling and Delivery of Teaching and Learning Materials under the Governmentn''s Tuition Fee Subsidy (GFTS) policy to all Elementary,Primary and Secondary schools in West Sepik Province',
    1120000,
    'f50007e7-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e7-0000-0000-0000-00000000000c',
    '100007e7-0000-0000-0000-000000000035',
    'c10007e7-0000-0000-0000-00000000000d',
    '2023-12-08',
    1120000,
    'PGK',
    'CON-NPC2023-106',
    '2023-12-08',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2023-107
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000036',
    'NPC2023-107',
    'a10007e7-0000-0000-0000-00000000000d',
    '2024-03-07',
    '2024-03-07 10:00:00+10',
    'Open Tender',
    'PNGDF Catering and Hospitality Services Contract for Igam Barracks, Lae, Morobe Province and HMPNGS Tarangau, Lombrum, Manus Province.',
    'PNGDF Catering and Hospitality Services Contract for Igam Barracks, Lae, Morobe Province and HMPNGS Tarangau, Lombrum, Manus Province.',
    42894800,
    'f50007e7-0000-0000-0000-000000000008',
    'Active',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2023-108
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e7-0000-0000-0000-000000000037',
    'NPC2023-108',
    'a10007e7-0000-0000-0000-00000000000d',
    '2024-03-07',
    '2024-03-07 10:00:00+10',
    'Open Tender',
    'PNGDF Catering and Hospitality Service Contract for Southern Region Units.',
    'PNGDF Catering and Hospitality Service Contract for Southern Region Units.',
    37120500,
    'f50007e7-0000-0000-0000-000000000008',
    'Active',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- END OF 2023 DATA MIGRATION
