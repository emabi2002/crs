-- ============================================
-- 2024 CONTRACT REGISTRY DATA MIGRATION
-- Generated from 2024_crs.csv
-- ============================================


-- AGENCIES (17 records)
INSERT INTO agencies (id, name, abbreviation, level, sector) VALUES
    ('a10007e8-0000-0000-0000-000000000001', 'Department of Health', 'DoH', 'National', 'Health'),
    ('a10007e8-0000-0000-0000-000000000002', 'Immigration & Citizenship Services Authority', 'ICSA', 'National', 'Other'),
    ('a10007e8-0000-0000-0000-000000000003', 'Department of Education', 'DoE', 'National', 'Education'),
    ('a10007e8-0000-0000-0000-000000000004', 'National Fisheries Authority', 'NFA', 'National', 'Maritime'),
    ('a10007e8-0000-0000-0000-000000000005', 'Coffee Industry Corporation', 'CIC', 'National', 'Other'),
    ('a10007e8-0000-0000-0000-000000000006', 'Department of Works & Highways', 'DoWH', 'National', 'Infrastructure'),
    ('a10007e8-0000-0000-0000-000000000007', 'Department of Transport', 'DoT', 'National', 'Transport'),
    ('a10007e8-0000-0000-0000-000000000008', 'Kokonas Indastri Koporesen', 'KIK', 'National', 'Other'),
    ('a10007e8-0000-0000-0000-000000000009', 'National Statistical Office', 'NSO', 'National', 'Other'),
    ('a10007e8-0000-0000-0000-00000000000a', 'Cocoa Board of Papua New Guinea PACD Project Management Unit', 'PMU', 'National', 'Other'),
    ('a10007e8-0000-0000-0000-00000000000b', 'National Information & Communications Technology Authority', 'NICTA', 'National', 'Other'),
    ('a10007e8-0000-0000-0000-00000000000c', 'Bomana Correctional Services Institution', '', 'National', 'Justice'),
    ('a10007e8-0000-0000-0000-00000000000d', 'Internal Revenue Commission', 'IRC', 'National', 'Finance'),
    ('a10007e8-0000-0000-0000-00000000000e', 'Autonomous Region of Bougainville', 'AROB', 'National', 'Other'),
    ('a10007e8-0000-0000-0000-00000000000f', 'Department of Finance', 'DoF', 'National', 'Finance'),
    ('a10007e8-0000-0000-0000-000000000010', 'National Gaming Control Board', 'NGCB', 'National', 'Other'),
    ('a10007e8-0000-0000-0000-000000000011', 'National Housing Corporation', 'NHC', 'National', 'Other')
ON CONFLICT (id) DO NOTHING;

-- FUNDING SOURCES (4 records)
INSERT INTO funding_sources (id, name, donor_name) VALUES
    ('f50007e8-0000-0000-0000-000000000001', 'World Bank', 'World Bank'),
    ('f50007e8-0000-0000-0000-000000000002', 'GoPNG', NULL),
    ('f50007e8-0000-0000-0000-000000000003', 'GoPNG', NULL),
    ('f50007e8-0000-0000-0000-000000000004', 'GoPNG', NULL)
ON CONFLICT (id) DO NOTHING;

-- OFFICERS (12 records)
INSERT INTO officers (id, full_name, email, agency_id, role) VALUES
    ('0f0007e8-0000-0000-0000-000000000001', 'Veari Hitolo', 'veari.hitolo@npc.gov.pg', 'a10007e8-0000-0000-0000-000000000001', 'Procurement Officer'),
    ('0f0007e8-0000-0000-0000-000000000002', 'Angeline Oki', 'angeline.oki@npc.gov.pg', 'a10007e8-0000-0000-0000-000000000002', 'Procurement Officer'),
    ('0f0007e8-0000-0000-0000-000000000003', 'Geoffrey Kinibo', 'geoffrey.kinibo@npc.gov.pg', 'a10007e8-0000-0000-0000-000000000003', 'Procurement Officer'),
    ('0f0007e8-0000-0000-0000-000000000004', 'Pora Kewa', 'pora.kewa@npc.gov.pg', 'a10007e8-0000-0000-0000-000000000004', 'Procurement Officer'),
    ('0f0007e8-0000-0000-0000-000000000005', 'Wanom Nothsman', 'wanom.nothsman@npc.gov.pg', 'a10007e8-0000-0000-0000-000000000005', 'Procurement Officer'),
    ('0f0007e8-0000-0000-0000-000000000006', 'Elina Norman', 'elina.norman@npc.gov.pg', 'a10007e8-0000-0000-0000-000000000005', 'Procurement Officer'),
    ('0f0007e8-0000-0000-0000-000000000007', 'Guria Verave', 'guria.verave@npc.gov.pg', 'a10007e8-0000-0000-0000-000000000006', 'Procurement Officer'),
    ('0f0007e8-0000-0000-0000-000000000008', 'Steven Peter', 'steven.peter@npc.gov.pg', 'a10007e8-0000-0000-0000-00000000000a', 'Procurement Officer'),
    ('0f0007e8-0000-0000-0000-000000000009', 'Agaru Agarobe', 'agaru.agarobe@npc.gov.pg', 'a10007e8-0000-0000-0000-00000000000b', 'Procurement Officer'),
    ('0f0007e8-0000-0000-0000-00000000000a', 'Josephine Makiba', 'josephine.makiba@npc.gov.pg', 'a10007e8-0000-0000-0000-000000000001', 'Procurement Officer'),
    ('0f0007e8-0000-0000-0000-00000000000b', 'Hane Hekwa', 'hane.hekwa@npc.gov.pg', 'a10007e8-0000-0000-0000-00000000000f', 'Procurement Officer'),
    ('0f0007e8-0000-0000-0000-00000000000c', 'MacNamana Hitolo', 'macnamana.hitolo@npc.gov.pg', 'a10007e8-0000-0000-0000-00000000000f', 'Procurement Officer')
ON CONFLICT (email) DO NOTHING;

-- CONTRACTORS (22 records)
INSERT INTO contractors (id, legal_name, trading_name, address, province, contact_person, phone, email, status, categories) VALUES
    ('c10007e8-0000-0000-0000-000000000001', 'United Nations Office for Project Services (UNOPS)', 'United Nations Office for Project Services (UNOPS)', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-000000000002', 'Kaia Works Limited', 'Kaia Works Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-000000000003', 'Bushdog Construction Limited', 'Bushdog Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-000000000004', 'Cat-One Pty Limited', 'Cat-One Pty Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-000000000005', 'MACOVS Limited', 'MACOVS Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-000000000006', 'Sangarapillai Suntharesan', 'Sangarapillai Suntharesan', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-000000000007', 'Torben Mikkelsen', 'Torben Mikkelsen', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-000000000008', 'Cat One Pty Limited', 'Cat One Pty Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-000000000009', 'Max Enterprise Limited', 'Max Enterprise Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c10007e8-0000-0000-0000-00000000000a', 'Digicel (PNG) Limited', 'Digicel (PNG) Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-00000000000b', 'Supreme Industries Limited', 'Supreme Industries Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-00000000000c', 'Designer Zucci Limited', 'Designer Zucci Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-00000000000d', 'JJ Ship Equip Agencies Limited', 'JJ Ship Equip Agencies Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-00000000000e', 'COVEC (PNG)Limited', 'COVEC (PNG)Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-00000000000f', 'Kokopo Plant Hire Limited.', 'Kokopo Plant Hire Limited.', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-000000000010', 'Digicel', 'Digicel', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-000000000011', 'Tagali Contractors Limited', 'Tagali Contractors Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-000000000012', 'Protocol Investment Limited', 'Protocol Investment Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-000000000013', 'Lome Paina Construction Limited', 'Lome Paina Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-000000000014', 'Kemudi Santun SDN.BHD.', 'Kemudi Santun SDN.BHD.', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-000000000015', 'Technology One Limited', 'Technology One Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c10007e8-0000-0000-0000-000000000016', 'Twin Merlion Building Business', 'Twin Merlion Building Business', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works'])
ON CONFLICT (id) DO NOTHING;

-- TENDERS (37 records)

-- Tender: NPC2024-01
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000001',
    'NPC2024-01',
    'a10007e8-0000-0000-0000-000000000001',
    '2024-01-17',
    '2024-01-17 10:00:00+10',
    'Open Tender',
    'Installation, Certification & Commissioning of the 21 Medical Waste Incinerators for the 21 Provincial Hospitals & Procurement of related Equipment & Supplies.                        (Single Source Pr',
    'Installation, Certification & Commissioning of the 21 Medical Waste Incinerators for the 21 Provincial Hospitals & Procurement of related Equipment & Supplies.                        (Single Source Procurement).',
    29990538.83,
    'f50007e8-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-000000000001',
    '100007e8-0000-0000-0000-000000000001',
    'c10007e8-0000-0000-0000-000000000001',
    '2023-12-29',
    29990538.83,
    'PGK',
    'CON-NPC2024-01',
    '2023-12-29',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e8-0000-0000-0000-000000000001',
    '100007e8-0000-0000-0000-000000000001',
    'NEC',
    'NPC Board meeting No.15 of 2023 held on 29/12/23.',
    '2023-12-29',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2024-02
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000002',
    'NPC2024-02',
    'a10007e8-0000-0000-0000-000000000002',
    '2024-08-06',
    '2024-08-06 10:00:00+10',
    'Open Tender',
    'Integrated Border Management System (IBMS) Project for the Papua New Guinea Immigration & Citizenship Services Authority.',
    'Integrated Border Management System (IBMS) Project for the Papua New Guinea Immigration & Citizenship Services Authority.',
    NULL,
    'f50007e8-0000-0000-0000-000000000002',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2024-03
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000003',
    'NPC2024-03',
    'a10007e8-0000-0000-0000-000000000003',
    '2024-02-06',
    '2024-02-06 10:00:00+10',
    'Open Tender',
    'Education Haus Project.',
    'Education Haus Project.',
    NULL,
    'f50007e8-0000-0000-0000-000000000002',
    'Active',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2024-04
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000004',
    'NPC2024-04',
    'a10007e8-0000-0000-0000-000000000004',
    '2024-10-15',
    '2024-10-15 10:00:00+10',
    'Open Tender',
    'Construction of NFA Office Complex at Voco Point, Lae, Morobe Province.',
    'Construction of NFA Office Complex at Voco Point, Lae, Morobe Province.',
    NULL,
    'f50007e8-0000-0000-0000-000000000002',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'pora.kewa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2024-05
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000005',
    'NPC2024-05',
    'a10007e8-0000-0000-0000-000000000005',
    '2024-05-14',
    '2024-05-14 10:00:00+10',
    'Open Tender',
    'Rehabilitation of Gera to Mouwa Feeder Road (CH0.0-5.30km), Sinesine Yongomugl District, Simbu Province.',
    'Rehabilitation of Gera to Mouwa Feeder Road (CH0.0-5.30km), Sinesine Yongomugl District, Simbu Province.',
    4817210.75,
    'f50007e8-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-000000000002',
    '100007e8-0000-0000-0000-000000000005',
    'c10007e8-0000-0000-0000-000000000002',
    '2025-05-08',
    4817210.75,
    'PGK',
    'CON-NPC2024-05',
    '2025-05-08',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e8-0000-0000-0000-000000000003',
    '100007e8-0000-0000-0000-000000000005',
    'NPC Board',
    'M-No.03/2025 held on 08/05/2025',
    '2025-05-08',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2024-06
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000006',
    'NPC2024-06',
    'a10007e8-0000-0000-0000-000000000005',
    '2024-05-14',
    '2024-05-14 10:00:00+10',
    'Open Tender',
    'Rehabilitation of Kamborini to Wala Feeder Road (CH0.0-5.50km), South Wiru, Ialibu Pangia District, Southern Highlands Province.',
    'Rehabilitation of Kamborini to Wala Feeder Road (CH0.0-5.50km), South Wiru, Ialibu Pangia District, Southern Highlands Province.',
    3575650.1,
    'f50007e8-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'elina.norman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'elina.norman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'elina.norman@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-000000000003',
    '100007e8-0000-0000-0000-000000000006',
    'c10007e8-0000-0000-0000-000000000003',
    '2024-05-14',
    3233877.63,
    'PGK',
    'CON-NPC2024-06',
    '2024-05-14',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2024-07
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000007',
    'NPC2024-07',
    'a10007e8-0000-0000-0000-000000000005',
    '2024-05-14',
    '2024-05-14 10:00:00+10',
    'Open Tender',
    'Rehabilitation of Ice Wara Junction to Habina Feeder Road (CH0.0-2.8km), Lamari LLG, Obura Wonenara District, Eastern Highlands Province.',
    'Rehabilitation of Ice Wara Junction to Habina Feeder Road (CH0.0-2.8km), Lamari LLG, Obura Wonenara District, Eastern Highlands Province.',
    NULL,
    'f50007e8-0000-0000-0000-000000000001',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2024-08
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000008',
    'NPC2024-08',
    'a10007e8-0000-0000-0000-000000000006',
    '2024-05-08',
    '2024-05-08 10:00:00+10',
    'Open Tender',
    'Pre-qualification tenders for the delivery of the Governmnent Business Precinct.                                                            (DoWH Headquarters Redevelopment Project).',
    'Pre-qualification tenders for the delivery of the Governmnent Business Precinct.                                                            (DoWH Headquarters Redevelopment Project).',
    NULL,
    'f50007e8-0000-0000-0000-000000000002',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2024-09
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000009',
    'NPC2024-09',
    'a10007e8-0000-0000-0000-000000000006',
    '2024-06-13',
    '2024-06-13 10:00:00+10',
    'Open Tender',
    'Procurement of Goroka City Road Section from Mount Zion to Goroka Market to 2way  4Lane anns stablised base coure and asphaltic concrete pavement road standard in EHP under Connect PNG Program.',
    'Procurement of Goroka City Road Section from Mount Zion to Goroka Market to 2way  4Lane anns stablised base coure and asphaltic concrete pavement road standard in EHP under Connect PNG Program.',
    NULL,
    'f50007e8-0000-0000-0000-000000000003',
    'Approved',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2024-10
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-00000000000a',
    'NPC2024-10',
    'a10007e8-0000-0000-0000-000000000006',
    '2024-07-31',
    '2024-07-31 10:00:00+10',
    'Open Tender',
    'Upgrading and Sealing of Madang Coastal Highway from Nubia to Bunapas - 26.00km Road under Connect PNG Program in Madang Province.',
    'Upgrading and Sealing of Madang Coastal Highway from Nubia to Bunapas - 26.00km Road under Connect PNG Program in Madang Province.',
    NULL,
    'f50007e8-0000-0000-0000-000000000003',
    'Approved',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2024-11
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-00000000000b',
    'NPC2024-11',
    'a10007e8-0000-0000-0000-000000000006',
    '2024-07-31',
    '2024-07-31 10:00:00+10',
    'Open Tender',
    'Design and Construction of Sepik Highway from Warasikau Bridge (CH166+610KM) TO Karaitem CH253+279KM) -86.669km Road under Connect PNG in West Sepik Province.',
    'Design and Construction of Sepik Highway from Warasikau Bridge (CH166+610KM) TO Karaitem CH253+279KM) -86.669km Road under Connect PNG in West Sepik Province.',
    NULL,
    'f50007e8-0000-0000-0000-000000000003',
    'Active',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2024-12
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-00000000000c',
    'NPC2024-12',
    'a10007e8-0000-0000-0000-000000000007',
    '2024-04-23',
    '2024-04-23 10:00:00+10',
    'Open Tender',
    'Single Source Procurement for three(3) ferries under the National Shipping Services Program (NSSP) Program of the National Government for Maritime District of East New Britain Province.',
    'Single Source Procurement for three(3) ferries under the National Shipping Services Program (NSSP) Program of the National Government for Maritime District of East New Britain Province.',
    6800000,
    'f50007e8-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-000000000004',
    '100007e8-0000-0000-0000-00000000000c',
    'c10007e8-0000-0000-0000-000000000004',
    '2024-12-31',
    6800000,
    'PGK',
    'CON-NPC2024-12',
    '2024-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2024-39
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-00000000000d',
    'NPC2024-39',
    'a10007e8-0000-0000-0000-000000000008',
    '2024-12-11',
    '2024-12-11 10:00:00+10',
    'Open Tender',
    'Refurbishment for the integrated Coconut Downstream Processing Building, Steward Research Station, Murnas, Madang Province.',
    'Refurbishment for the integrated Coconut Downstream Processing Building, Steward Research Station, Murnas, Madang Province.',
    4811248.64,
    'f50007e8-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-000000000005',
    '100007e8-0000-0000-0000-00000000000d',
    'c10007e8-0000-0000-0000-000000000005',
    '2025-03-19',
    4956352.31,
    'PGK',
    'CON-NPC2024-39',
    '2025-03-19',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e8-0000-0000-0000-000000000005',
    '100007e8-0000-0000-0000-00000000000d',
    'NPC Board',
    'Meeting No.02 OF 2024 Held on 19/03/2025',
    '2025-03-19',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2024-40
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-00000000000e',
    'NPC2024-40',
    'a10007e8-0000-0000-0000-000000000006',
    '2024-10-31',
    '2024-10-31 10:00:00+10',
    'Open Tender',
    '(Contract No.37-CPNG-COI-US-LSKJ-11/24)                                              Upgrade to seal Ialibu loop road from Lipenomu junction CH0+00 to Kaka junction CH16+500 in Imbonggu district, SHP.',
    '(Contract No.37-CPNG-COI-US-LSKJ-11/24)                                              Upgrade to seal Ialibu loop road from Lipenomu junction CH0+00 to Kaka junction CH16+500 in Imbonggu district, SHP.',
    52052353.9,
    'f50007e8-0000-0000-0000-000000000004',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2024-41
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-00000000000f',
    'NPC2024-41',
    'a10007e8-0000-0000-0000-000000000006',
    '2024-11-18',
    '2024-11-18 10:00:00+10',
    'Open Tender',
    'Individual Consultation Contract - Torben Mikkelsen - Output and Performance Based Contracts Specilialist',
    'Individual Consultation Contract - Torben Mikkelsen - Output and Performance Based Contracts Specilialist',
    NULL,
    'f50007e8-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-000000000006',
    '100007e8-0000-0000-0000-00000000000f',
    'c10007e8-0000-0000-0000-000000000006',
    '2024-09-03',
    1672051.2,
    'PGK',
    'CON-NPC2024-41',
    '2024-09-03',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e8-0000-0000-0000-000000000006',
    '100007e8-0000-0000-0000-00000000000f',
    'NPC Board',
    'NPC Board Decision letter dated 03/09/24, Meeting',
    '2024-09-03',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2024-42
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000010',
    'NPC2024-42',
    'a10007e8-0000-0000-0000-000000000006',
    '2024-11-18',
    '2024-11-18 10:00:00+10',
    'Open Tender',
    'Individual Consultation Contract - Torben Mikkelsen - Output and Performance Based Contracts Specilialist',
    'Individual Consultation Contract - Torben Mikkelsen - Output and Performance Based Contracts Specilialist',
    NULL,
    'f50007e8-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-000000000007',
    '100007e8-0000-0000-0000-000000000010',
    'c10007e8-0000-0000-0000-000000000007',
    '2024-09-03',
    1980393.984,
    'PGK',
    'CON-NPC2024-42',
    '2024-09-03',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e8-0000-0000-0000-000000000007',
    '100007e8-0000-0000-0000-000000000010',
    'NPC Board',
    'NPC Board Decision letter dated 03/09/24, Meeting',
    '2024-09-03',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2024-13
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000011',
    'NPC2024-13',
    'a10007e8-0000-0000-0000-000000000007',
    '2025-02-12',
    '2025-02-12 10:00:00+10',
    'Open Tender',
    'Single Source Procurement for three (3) ferries under the National Shipping Services Program (NSSP) Program of the National Government for Maritime District of Morobe Province.',
    'Single Source Procurement for three (3) ferries under the National Shipping Services Program (NSSP) Program of the National Government for Maritime District of Morobe Province.',
    6750000,
    'f50007e8-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-000000000008',
    '100007e8-0000-0000-0000-000000000011',
    'c10007e8-0000-0000-0000-000000000008',
    '2025-02-12',
    6750000,
    'PGK',
    'CON-NPC2024-13',
    '2025-02-12',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2024-14
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000012',
    'NPC2024-14',
    'a10007e8-0000-0000-0000-000000000007',
    '2024-04-23',
    '2024-04-23 10:00:00+10',
    'Open Tender',
    'Single Source Procurement for three (3) ferries under the National Shipping Services Program (NSSP) Program of the National Government for Maritime District of Milne Bay Province.',
    'Single Source Procurement for three (3) ferries under the National Shipping Services Program (NSSP) Program of the National Government for Maritime District of Milne Bay Province.',
    6625000,
    'f50007e8-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-000000000009',
    '100007e8-0000-0000-0000-000000000012',
    'c10007e8-0000-0000-0000-000000000004',
    '2024-12-31',
    6625000,
    'PGK',
    'CON-NPC2024-14',
    '2024-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2024-15
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000013',
    'NPC2024-15',
    'a10007e8-0000-0000-0000-000000000009',
    '2024-05-01',
    '2024-05-01 10:00:00+10',
    'Open Tender',
    'Single Source Procurement of 22,000 Android Tablets and Accessories for the 2024 National Population Census.',
    'Single Source Procurement of 22,000 Android Tablets and Accessories for the 2024 National Population Census.',
    17241400,
    'f50007e8-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-00000000000a',
    '100007e8-0000-0000-0000-000000000013',
    'c10007e8-0000-0000-0000-000000000009',
    '2024-12-31',
    17241400,
    'PGK',
    'CON-NPC2024-15',
    '2024-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2024-16
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000014',
    'NPC2024-16',
    'a10007e8-0000-0000-0000-000000000009',
    '2024-05-01',
    '2024-05-01 10:00:00+10',
    'Open Tender',
    'Single Source Procurement for Access Point Name (APN) for the 2024 National Population Census.',
    'Single Source Procurement for Access Point Name (APN) for the 2024 National Population Census.',
    5371300,
    'f50007e8-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-00000000000b',
    '100007e8-0000-0000-0000-000000000014',
    'c10007e8-0000-0000-0000-00000000000a',
    '2024-12-31',
    5371300,
    'PGK',
    'CON-NPC2024-16',
    '2024-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2024-17
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000015',
    'NPC2024-17',
    'a10007e8-0000-0000-0000-000000000009',
    '2024-05-01',
    '2024-05-01 10:00:00+10',
    'Open Tender',
    'Single Source Procurement for Stationery Supplies for the 2024 National Population Census.',
    'Single Source Procurement for Stationery Supplies for the 2024 National Population Census.',
    3573520.17,
    'f50007e8-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-00000000000c',
    '100007e8-0000-0000-0000-000000000015',
    'c10007e8-0000-0000-0000-00000000000b',
    '2024-12-31',
    3573520.17,
    'PGK',
    'CON-NPC2024-17',
    '2024-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2024-18
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000016',
    'NPC2024-18',
    'a10007e8-0000-0000-0000-000000000009',
    '2024-05-01',
    '2024-05-01 10:00:00+10',
    'Open Tender',
    'Single Source Procurement of 2024 Census Printed Materials for 2024 National Population Census.',
    'Single Source Procurement of 2024 Census Printed Materials for 2024 National Population Census.',
    2382786.43,
    'f50007e8-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-00000000000d',
    '100007e8-0000-0000-0000-000000000016',
    'c10007e8-0000-0000-0000-00000000000c',
    '2024-12-31',
    2382786.43,
    'PGK',
    'CON-NPC2024-18',
    '2024-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2024-19
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000017',
    'NPC2024-19',
    'a10007e8-0000-0000-0000-000000000007',
    '2024-05-02',
    '2024-05-02 10:00:00+10',
    'Open Tender',
    'Single Source Procurement for the North Bougainville District Vessel.',
    'Single Source Procurement for the North Bougainville District Vessel.',
    9810000,
    'f50007e8-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-00000000000e',
    '100007e8-0000-0000-0000-000000000017',
    'c10007e8-0000-0000-0000-00000000000d',
    '2024-12-31',
    9810000,
    'PGK',
    'CON-NPC2024-19',
    '2024-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2024-20
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000018',
    'NPC2024-20',
    'a10007e8-0000-0000-0000-00000000000a',
    '2024-05-24',
    '2024-05-24 10:00:00+10',
    'Open Tender',
    'Rehabilitation of Vunapalading- Burit Feeder Road, CH.0.0-3.180km, inland Baining, Gazelle District, East New Britain Province.',
    'Rehabilitation of Vunapalading- Burit Feeder Road, CH.0.0-3.180km, inland Baining, Gazelle District, East New Britain Province.',
    NULL,
    'f50007e8-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'steven.peter@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'steven.peter@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'steven.peter@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-00000000000f',
    '100007e8-0000-0000-0000-000000000018',
    'c10007e8-0000-0000-0000-00000000000e',
    '2024-11-21',
    4101405.28,
    'PGK',
    'CON-NPC2024-20',
    '2024-11-21',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e8-0000-0000-0000-00000000000d',
    '100007e8-0000-0000-0000-000000000018',
    'NPC Board',
    'NPCB letter of approval dated 21/11/2024, M-No.10',
    '2024-11-21',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2024-21
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000019',
    'NPC2024-21',
    'a10007e8-0000-0000-0000-00000000000a',
    '2024-05-24',
    '2024-05-24 10:00:00+10',
    'Open Tender',
    'Rehabilitation of Kulungure Feeder Road, CH.0.0-4.0km, Sinivit, Pomio District, East New Britain Province.',
    'Rehabilitation of Kulungure Feeder Road, CH.0.0-4.0km, Sinivit, Pomio District, East New Britain Province.',
    NULL,
    'f50007e8-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'steven.peter@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'steven.peter@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'steven.peter@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-000000000010',
    '100007e8-0000-0000-0000-000000000019',
    'c10007e8-0000-0000-0000-00000000000f',
    '2024-12-13',
    4964336.34,
    'PGK',
    'CON-NPC2024-21',
    '2024-12-13',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e8-0000-0000-0000-00000000000e',
    '100007e8-0000-0000-0000-000000000019',
    'NPC Board',
    'NPCB M-No.12 of 2024 held on 13/12/2024.',
    '2024-12-13',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2024-22
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-00000000001a',
    'NPC2024-22',
    'a10007e8-0000-0000-0000-00000000000b',
    '2024-05-10',
    '2024-05-10 10:00:00+10',
    'Open Tender',
    '4G Mobile Broadband Services - Greenfield.',
    '4G Mobile Broadband Services - Greenfield.',
    8000000,
    'f50007e8-0000-0000-0000-000000000002',
    'Approved',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2024-23
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-00000000001b',
    'NPC2024-23',
    'a10007e8-0000-0000-0000-00000000000b',
    '2024-05-10',
    '2024-05-10 10:00:00+10',
    'Open Tender',
    'Radio Broadcasting Services.',
    'Radio Broadcasting Services.',
    2600000,
    'f50007e8-0000-0000-0000-000000000002',
    'Approved',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2024-30
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-00000000001c',
    'NPC2024-30',
    'a10007e8-0000-0000-0000-000000000001',
    '2024-09-10',
    '2024-09-10 10:00:00+10',
    'Open Tender',
    'Provision of Routine Medical Supplies Distribution Services for Eastern Highlands and Morobe Province to the National Department of Health',
    'Provision of Routine Medical Supplies Distribution Services for Eastern Highlands and Morobe Province to the National Department of Health',
    7461269.9,
    'f50007e8-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-000000000011',
    '100007e8-0000-0000-0000-00000000001c',
    'c10007e8-0000-0000-0000-000000000011',
    '2024-09-10',
    7574339,
    'PGK',
    'CON-NPC2024-30',
    '2024-09-10',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2024-31
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-00000000001d',
    'NPC2024-31',
    'a10007e8-0000-0000-0000-000000000001',
    '2024-09-10',
    '2024-09-10 10:00:00+10',
    'Open Tender',
    'Provision of Routine Medical Supplies Distribution Services for Western Highlands, Jiwaka and Simbu Province to the National Department of Health',
    'Provision of Routine Medical Supplies Distribution Services for Western Highlands, Jiwaka and Simbu Province to the National Department of Health',
    7686324.2,
    'f50007e8-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-000000000012',
    '100007e8-0000-0000-0000-00000000001d',
    'c10007e8-0000-0000-0000-000000000012',
    '2025-10-14',
    7681480,
    'PGK',
    'CON-NPC2024-31',
    '2025-10-14',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e8-0000-0000-0000-000000000010',
    '100007e8-0000-0000-0000-00000000001d',
    'NPC Board',
    'Meeting No.09. 14th October,2025',
    '2025-10-14',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2024-32
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-00000000001e',
    'NPC2024-32',
    'a10007e8-0000-0000-0000-000000000006',
    '2024-10-07',
    '2024-10-07 10:00:00+10',
    'Open Tender',
    'Design and Construction of Sepik Highway from Maprik Town (CH92+56KM) To Warasikau Bridge (CH166+610KM) -74.05km Road under Connect PNG in East Sepik Province.',
    'Design and Construction of Sepik Highway from Maprik Town (CH92+56KM) To Warasikau Bridge (CH166+610KM) -74.05km Road under Connect PNG in East Sepik Province.',
    NULL,
    'f50007e8-0000-0000-0000-000000000003',
    'Approved',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2024-33
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-00000000001f',
    'NPC2024-33',
    'a10007e8-0000-0000-0000-00000000000c',
    '2024-09-12',
    '2024-09-12 10:00:00+10',
    'Open Tender',
    'Single Source Procurement for Bomana Correctional Institution Sewerage System Upgrade Work.',
    'Single Source Procurement for Bomana Correctional Institution Sewerage System Upgrade Work.',
    NULL,
    'f50007e8-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-000000000013',
    '100007e8-0000-0000-0000-00000000001f',
    'c10007e8-0000-0000-0000-000000000013',
    '2024-12-31',
    7920000,
    'PGK',
    'CON-NPC2024-33',
    '2024-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2024-34
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000020',
    'NPC2024-34',
    'a10007e8-0000-0000-0000-00000000000d',
    '2024-09-12',
    '2024-09-12 10:00:00+10',
    'Open Tender',
    'Single Source Procurement for Land Acquisition of Portion 2370 C, Volume 33,Folio 43, Milinch of Granville Fourmil of Port Moresby for Internal Revenue Commission (IRC) Staff Home Ownership Scheme.',
    'Single Source Procurement for Land Acquisition of Portion 2370 C, Volume 33,Folio 43, Milinch of Granville Fourmil of Port Moresby for Internal Revenue Commission (IRC) Staff Home Ownership Scheme.',
    NULL,
    'f50007e8-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2024-35
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000021',
    'NPC2024-35',
    'a10007e8-0000-0000-0000-00000000000e',
    '2024-09-23',
    '2024-09-23 10:00:00+10',
    'Open Tender',
    'Single Source Procurement for 43m Cargo Passenger Ferry for attols in the Autonomous Region of Bougainville.',
    'Single Source Procurement for 43m Cargo Passenger Ferry for attols in the Autonomous Region of Bougainville.',
    NULL,
    'f50007e8-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-000000000014',
    '100007e8-0000-0000-0000-000000000021',
    'c10007e8-0000-0000-0000-000000000014',
    '2024-12-31',
    10889250.15,
    'PGK',
    'CON-NPC2024-35',
    '2024-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2024-36
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000022',
    'NPC2024-36',
    'a10007e8-0000-0000-0000-00000000000f',
    '2024-09-26',
    '2024-09-26 10:00:00+10',
    'Open Tender',
    'Single Source Procurement for Integrated Financial Management Information System (IFMS) For Department of Finance (DoF)',
    'Single Source Procurement for Integrated Financial Management Information System (IFMS) For Department of Finance (DoF)',
    NULL,
    'f50007e8-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca0007e8-0000-0000-0000-000000000015',
    '100007e8-0000-0000-0000-000000000022',
    'c10007e8-0000-0000-0000-000000000015',
    '2024-12-31',
    4000000,
    'PGK',
    'CON-NPC2024-36',
    '2024-12-31',
    '2026-12-31',
    'Active'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2024-37
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000023',
    'NPC2024-37',
    'a10007e8-0000-0000-0000-000000000010',
    '2024-10-03',
    '2024-10-03 10:00:00+10',
    'Single Source',
    'Single Source Procurement for the purchase of Twin Merlion Business Centre building at allotment 25, section 122 Hohola for the National Gaming Control Board (NGCB).',
    'Single Source Procurement for the purchase of Twin Merlion Business Centre building at allotment 25, section 122 Hohola for the National Gaming Control Board (NGCB).',
    NULL,
    'f50007e8-0000-0000-0000-000000000002',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'josephine.makiba@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e8-0000-0000-0000-000000000014',
    '100007e8-0000-0000-0000-000000000023',
    'NPC Board',
    'NPC Board in its Meeting No.09 of 2024 held on 20/',
    '2024-09-20',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2024-38
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000024',
    'NPC2024-38',
    'a10007e8-0000-0000-0000-000000000011',
    '2024-10-10',
    '2024-10-10 10:00:00+10',
    'Open Tender',
    'Construction of Sewerage Reticulation Phase 1, for Durand Farm Housing Project, 8 mile, National Capital District.',
    'Construction of Sewerage Reticulation Phase 1, for Durand Farm Housing Project, 8 mile, National Capital District.',
    6485356.42,
    'f50007e8-0000-0000-0000-000000000002',
    'Active',
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2024-66
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '100007e8-0000-0000-0000-000000000025',
    'NPC2024-66',
    'a10007e8-0000-0000-0000-00000000000f',
    '2024-12-20',
    '2024-12-20 10:00:00+10',
    'Single Source',
    'Single Source Procurement Method for the Procurement of ICT Hosting Services for the Department of Finance (DoF)',
    'Single Source Procurement Method for the Procurement of ICT Hosting Services for the Department of Finance (DoF)',
    NULL,
    'f50007e8-0000-0000-0000-000000000002',
    'Approved',
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'macnamana.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a90007e8-0000-0000-0000-000000000015',
    '100007e8-0000-0000-0000-000000000025',
    'NPC Board',
    'NPC Board in its Meeting No.012 of 2024 held on 06',
    '2024-12-06',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- END OF 2024 DATA MIGRATION
