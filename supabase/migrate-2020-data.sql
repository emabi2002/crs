-- ============================================
-- 2020 CONTRACT REGISTRY DATA MIGRATION
-- Generated from 2020_crs.csv
-- ============================================


-- ============================================
-- AGENCIES (18 records)
-- ============================================
INSERT INTO agencies (id, name, abbreviation, level, sector) VALUES
    ('a2002020-0000-0000-0000-000000000001', 'Department of Works & Highways', 'DoWH', 'National', 'Infrastructure'),
    ('a2002020-0000-0000-0000-000000000002', 'National Information & Communication Technology Authority', 'NICTA', 'National', 'Other'),
    ('a2002020-0000-0000-0000-000000000003', 'Department of Education', 'DoE', 'National', 'Education'),
    ('a2002020-0000-0000-0000-000000000004', 'Department of Higher Education Research Science & Technology', 'DHERST', 'National', 'Education'),
    ('a2002020-0000-0000-0000-000000000005', 'Department of Prime Minister & NEC', 'PMNEC', 'National', 'Other'),
    ('a2002020-0000-0000-0000-000000000006', 'PNG Correctional Service', '', 'National', 'Justice'),
    ('a2002020-0000-0000-0000-000000000007', 'Department of Transport', 'DoT', 'National', 'Transport'),
    ('a2002020-0000-0000-0000-000000000008', 'National Fisheries Authority', 'NFA', 'National', 'Maritime'),
    ('a2002020-0000-0000-0000-000000000009', 'Public Service Commission', 'PSC', 'National', 'Other'),
    ('a2002020-0000-0000-0000-00000000000a', 'National Statistical Office', 'NSO', 'National', 'Statistics'),
    ('a2002020-0000-0000-0000-00000000000b', 'Telefomin District Development Authority', 'TDDA', 'Provincial', 'Other'),
    ('a2002020-0000-0000-0000-00000000000c', 'National Judicial and Supreme Services Secretariat', 'NJSS', 'National', 'Other'),
    ('a2002020-0000-0000-0000-00000000000d', 'Coffee Industry Corporation', 'CIC', 'National', 'Other'),
    ('a2002020-0000-0000-0000-00000000000e', 'PNG Institute of Medical Research', 'PNGIMR', 'National', 'Other'),
    ('a2002020-0000-0000-0000-00000000000f', 'National Capital District Commission', 'NCDC', 'Provincial', 'Local Government'),
    ('a2002020-0000-0000-0000-000000000010', 'East Sepik Provincial Government', 'ESPG', 'Provincial', 'Provincial'),
    ('a2002020-0000-0000-0000-000000000011', 'Internal Revenue Commission', 'IRC', 'National', 'Finance'),
    ('a2002020-0000-0000-0000-000000000012', 'Department of Health', 'DoH', 'National', 'Health')
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- FUNDING SOURCES (3 records)
-- ============================================
INSERT INTO funding_sources (id, name, donor_name) VALUES
    ('f5202020-0000-0000-0000-000000000001', 'Asian Development Bank', 'Asian Development Bank'),
    ('f5202020-0000-0000-0000-000000000002', 'GoPNG', NULL),
    ('f5202020-0000-0000-0000-000000000003', 'Indian Exim Bank', 'Government of India')
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- OFFICERS (8 records)
-- ============================================
INSERT INTO officers (id, full_name, email, agency_id, role) VALUES
    ('0f202020-0000-0000-0000-000000000001', 'Guria Verave', 'guria.verave@npc.gov.pg', 'a2002020-0000-0000-0000-000000000001', 'Procurement Officer'),
    ('0f202020-0000-0000-0000-000000000002', 'Geoffrey Kinibo', 'geoffrey.kinibo@npc.gov.pg', 'a2002020-0000-0000-0000-000000000002', 'Procurement Officer'),
    ('0f202020-0000-0000-0000-000000000003', 'Frank Hare', 'frank.hare@npc.gov.pg', 'a2002020-0000-0000-0000-000000000003', 'Procurement Officer'),
    ('0f202020-0000-0000-0000-000000000004', 'Wanom Nothsman', 'wanom.nothsman@npc.gov.pg', 'a2002020-0000-0000-0000-000000000003', 'Procurement Officer'),
    ('0f202020-0000-0000-0000-000000000005', 'Agaru Agarobe', 'agaru.agarobe@npc.gov.pg', 'a2002020-0000-0000-0000-000000000005', 'Procurement Officer'),
    ('0f202020-0000-0000-0000-000000000006', 'Angeline Oki', 'angeline.oki@npc.gov.pg', 'a2002020-0000-0000-0000-000000000007', 'Procurement Officer'),
    ('0f202020-0000-0000-0000-000000000007', 'Hane Hekwa', 'hane.hekwa@npc.gov.pg', 'a2002020-0000-0000-0000-000000000008', 'Procurement Officer'),
    ('0f202020-0000-0000-0000-000000000008', 'Veari Hitolo', 'veari.hitolo@npc.gov.pg', 'a2002020-0000-0000-0000-00000000000d', 'Procurement Officer')
ON CONFLICT (email) DO NOTHING;

-- ============================================
-- CONTRACTORS (47 records)
-- ============================================
INSERT INTO contractors (id, legal_name, trading_name, address, province, contact_person, phone, email, status, categories) VALUES
    ('c2002020-0000-0000-0000-000000000001', 'Cardno Emerging Markets (Australia) Pty. Ltd.', 'Cardno Emerging Markets (Australia) Pty. Ltd.', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000002', 'Egis International Limited and PNG Surveys Limited', 'Egis International Limited and PNG Surveys Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000003', 'MH Supplies', 'MH Supplies', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c2002020-0000-0000-0000-000000000004', 'Tamake Engineering & Construction Limited', 'Tamake Engineering & Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000005', 'Zenith Limited', 'Zenith Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000006', 'Joint Venture - Finnish Overseas Consultants & Sirway Limited', 'Joint Venture - Finnish Overseas Consultants & Sirway Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting']),
    ('c2002020-0000-0000-0000-000000000007', 'Korea Consultants International co Ltd', 'Korea Consultants International co Ltd', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting']),
    ('c2002020-0000-0000-0000-000000000008', 'Joint Venture - Bonifica SPA AND Renardt S.A', 'Joint Venture - Bonifica SPA AND Renardt S.A', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000009', 'Metallurgical Corp of China', 'Metallurgical Corp of China', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-00000000000a', 'China Wu Yi Co Limited', 'China Wu Yi Co Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-00000000000b', 'China Civil Engineering Construction Corporation', 'China Civil Engineering Construction Corporation', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-00000000000c', 'Atika Investment Limited', 'Atika Investment Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-00000000000d', 'Wakale Stationeries', 'Wakale Stationeries', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c2002020-0000-0000-0000-00000000000e', 'Printsol Limited', 'Printsol Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-00000000000f', 'Digitech ICT Limited', 'Digitech ICT Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000010', 'Tumla Investment Limited', 'Tumla Investment Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000011', 'NBC Limited', 'NBC Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000012', 'MH Supplies Ltd', 'MH Supplies Ltd', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c2002020-0000-0000-0000-000000000013', 'Caveman Construction Ltd', 'Caveman Construction Ltd', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000014', 'Arepesh Construction Limited', 'Arepesh Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000015', 'Aarvee Associated Architects Engineers & Consultants Pvt Ltd', 'Aarvee Associated Architects Engineers & Consultants Pvt Ltd', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting']),
    ('c2002020-0000-0000-0000-000000000016', 'Diwanie Plant Hire Limited', 'Diwanie Plant Hire Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000017', 'Heduru Contractors Limited', 'Heduru Contractors Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000018', 'Hymergent Limited', 'Hymergent Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000019', 'MK Civil Works', 'MK Civil Works', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-00000000001a', 'Akitou Limited', 'Akitou Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-00000000001b', 'Souths Contractor Limited', 'Souths Contractor Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-00000000001c', 'Associated Builders Limited', 'Associated Builders Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-00000000001d', 'Ipwenz Construction', 'Ipwenz Construction', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-00000000001e', 'Mobile Works Limited', 'Mobile Works Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-00000000001f', 'Phoenix Builders', 'Phoenix Builders', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000020', 'Andro Holdings Limited', 'Andro Holdings Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000021', 'Clade PNG Limited', 'Clade PNG Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000022', 'Finnish Overseas Consultants Ltd', 'Finnish Overseas Consultants Ltd', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Consulting']),
    ('c2002020-0000-0000-0000-000000000023', 'JV PNG Investment Limited', 'JV PNG Investment Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000024', 'Green Hill Construction Limited', 'Green Hill Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000025', 'Kana Construction Limited', 'Kana Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000026', 'Global Construction Limited', 'Global Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000027', 'CRCE Group Limited', 'CRCE Group Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000028', 'Covec (PNG) Limited', 'Covec (PNG) Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-000000000029', 'LD Logistic Limited', 'LD Logistic Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Services']),
    ('c2002020-0000-0000-0000-00000000002a', 'Protocol Investment Limited', 'Protocol Investment Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-00000000002b', 'Express Customs Limited', 'Express Customs Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Services']),
    ('c2002020-0000-0000-0000-00000000002c', 'Post PNG Limited', 'Post PNG Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Services']),
    ('c2002020-0000-0000-0000-00000000002d', 'Kaystar Construction Limited', 'Kaystar Construction Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works']),
    ('c2002020-0000-0000-0000-00000000002e', 'MH Supplies Limited', 'MH Supplies Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Goods']),
    ('c2002020-0000-0000-0000-00000000002f', 'Pioneer Construction Engineering Limited', 'Pioneer Construction Engineering Limited', 'Port Moresby', 'NCD', 'Contact Person', '675 300 0000', 'info@contractor.com.pg', 'Active', ARRAY['Works'])
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- TENDERS (68 records)
-- ============================================

-- Tender: NPC2020-29
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000001',
    'NPC2020-29',
    'a2002020-0000-0000-0000-000000000001',
    '2021-09-27',
    '2021-09-27 10:00:00+10',
    'Open Tender',
    'Preparation of Feasibility Study and Detailed Engineering Design for Lae-Malalaua road (Trans-Island Highway)',
    'Preparation of Feasibility Study and Detailed Engineering Design for Lae-Malalaua road (Trans-Island Highway)',
    NULL,
    'f5202020-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-29
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000001',
    '20002020-0000-0000-0000-000000000001',
    'c2002020-0000-0000-0000-000000000001',
    '2021-09-27',
    6918459,
    'PGK',
    'CON-NPC2020-29',
    '2021-09-27',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2020-30
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000002',
    'NPC2020-30',
    'a2002020-0000-0000-0000-000000000001',
    '2022-02-07',
    '2022-02-07 10:00:00+10',
    'Open Tender',
    'Preparation of Feasibility Study and Detailed Engineering Design for roads in Highlands Region',
    'Preparation of Feasibility Study and Detailed Engineering Design for roads in Highlands Region',
    NULL,
    'f5202020-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-30
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000002',
    '20002020-0000-0000-0000-000000000002',
    'c2002020-0000-0000-0000-000000000002',
    '2022-09-09',
    7554596,
    'PGK',
    'CON-NPC2020-30',
    '2022-09-09',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-30
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000002',
    '20002020-0000-0000-0000-000000000002',
    'NPC Board',
    'MoM No. 12/22 dated 09/09/22',
    '2022-09-09',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-31
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000003',
    'NPC2020-31',
    'a2002020-0000-0000-0000-000000000002',
    '2020-10-30',
    '2020-10-30 10:00:00+10',
    'Open Tender',
    'Construction of eight (8x) meters towers in selected areas within Papua New Guinea',
    'Construction of eight (8x) meters towers in selected areas within Papua New Guinea',
    6000000,
    'f5202020-0000-0000-0000-000000000002',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-32
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000004',
    'NPC2020-32',
    'a2002020-0000-0000-0000-000000000002',
    '2020-10-30',
    '2020-10-30 10:00:00+10',
    'Open Tender',
    'Installation of Digital Television Services to six (6) selected locations',
    'Installation of Digital Television Services to six (6) selected locations',
    2000000,
    'f5202020-0000-0000-0000-000000000002',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-33
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000005',
    'NPC2020-33',
    'a2002020-0000-0000-0000-000000000003',
    '2020-11-10',
    '2020-11-10 10:00:00+10',
    'Open Tender',
    'Purchase and Supply of teaching and learning component materials under the GRFS Policy',
    'Purchase and Supply of teaching and learning component materials under the GRFS Policy',
    76985581,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-33
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000003',
    '20002020-0000-0000-0000-000000000005',
    'c2002020-0000-0000-0000-000000000003',
    '2020-11-10',
    74077881.62,
    'PGK',
    'CON-NPC2020-33',
    '2020-11-10',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2020-34
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000006',
    'NPC2020-34',
    'a2002020-0000-0000-0000-000000000003',
    '2020-11-10',
    '2020-11-10 10:00:00+10',
    'Open Tender',
    'Delivery of Teaching and Learning Component Materials - Southern Region',
    'Delivery of Teaching and Learning Component Materials - Southern Region',
    4419680,
    'f5202020-0000-0000-0000-000000000002',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-35
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000007',
    'NPC2020-35',
    'a2002020-0000-0000-0000-000000000003',
    '2020-11-10',
    '2020-11-10 10:00:00+10',
    'Open Tender',
    'Delivery of Teaching and Learning Component Materials - Momase Region',
    'Delivery of Teaching and Learning Component Materials - Momase Region',
    5669040,
    'f5202020-0000-0000-0000-000000000002',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-36
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000008',
    'NPC2020-36',
    'a2002020-0000-0000-0000-000000000003',
    '2020-11-10',
    '2020-11-10 10:00:00+10',
    'Open Tender',
    'Delivery of Teaching and Learning Component Materials - New Guinea Islands Region',
    'Delivery of Teaching and Learning Component Materials - New Guinea Islands Region',
    4110560,
    'f5202020-0000-0000-0000-000000000002',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-37
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000009',
    'NPC2020-37',
    'a2002020-0000-0000-0000-000000000003',
    '2020-11-10',
    '2020-11-10 10:00:00+10',
    'Open Tender',
    'Delivery of Teaching and Learning Component Materials - Eastern Highlands Region',
    'Delivery of Teaching and Learning Component Materials - Eastern Highlands Region',
    2782080,
    'f5202020-0000-0000-0000-000000000002',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-38
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000000a',
    'NPC2020-38',
    'a2002020-0000-0000-0000-000000000003',
    '2020-11-10',
    '2020-11-10 10:00:00+10',
    'Open Tender',
    'Delivery of Teaching and Learning Component Materials - Western Highlands Region',
    'Delivery of Teaching and Learning Component Materials - Western Highlands Region',
    3760960,
    'f5202020-0000-0000-0000-000000000002',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-39
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000000b',
    'NPC2020-39',
    'a2002020-0000-0000-0000-000000000003',
    '2020-11-10',
    '2020-11-10 10:00:00+10',
    'Open Tender',
    'Purchase of Library for the National Library and Archives',
    'Purchase of Library for the National Library and Archives',
    5,
    'f5202020-0000-0000-0000-000000000002',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-40
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000000c',
    'NPC2020-40',
    'a2002020-0000-0000-0000-000000000004',
    '2020-01-01',
    NULL,
    'Open Tender',
    'National Higher Technical Education Management Information System',
    'National Higher Technical Education Management Information System',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-41
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000000d',
    'NPC2020-41',
    'a2002020-0000-0000-0000-000000000004',
    '2020-01-01',
    NULL,
    'Open Tender',
    'Higher Education Loan Program (HELP)',
    'Higher Education Loan Program (HELP)',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-42
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000000e',
    'NPC2020-42',
    'a2002020-0000-0000-0000-000000000004',
    '2020-01-01',
    NULL,
    'Open Tender',
    'Higher Education E-Library',
    'Higher Education E-Library',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-43
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000000f',
    'NPC2020-43',
    'a2002020-0000-0000-0000-000000000005',
    '2023-02-23',
    '2023-02-23 10:00:00+10',
    'Open Tender',
    'Design and Construction of New Perimeter Fencing and Staff Residence for Mirigini',
    'Design and Construction of New Perimeter Fencing and Staff Residence for Mirigini',
    17000000,
    'f5202020-0000-0000-0000-000000000002',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-44
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000010',
    'NPC2020-44',
    'a2002020-0000-0000-0000-000000000001',
    '2020-01-01',
    NULL,
    'Open Tender',
    'Design and Construction of 96km Road from Maria to Pori to Kopiago in Hela Province',
    'Design and Construction of 96km Road from Maria to Pori to Kopiago in Hela Province',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-45
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000011',
    'NPC2020-45',
    'a2002020-0000-0000-0000-000000000006',
    '2021-01-13',
    '2021-01-13 10:00:00+10',
    'Open Tender',
    'Construction of a 100 Men Dormitory at Buimo Correctional Institution in Lae',
    'Construction of a 100 Men Dormitory at Buimo Correctional Institution in Lae',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-45
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000004',
    '20002020-0000-0000-0000-000000000011',
    'c2002020-0000-0000-0000-000000000004',
    '2021-01-13',
    3105528.26,
    'PGK',
    'CON-NPC2020-45',
    '2021-01-13',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2020-46
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000012',
    'NPC2020-46',
    'a2002020-0000-0000-0000-000000000007',
    '2020-11-24',
    '2020-11-24 10:00:00+10',
    'Open Tender',
    'Construction of the PNG Maritime College Simulator Building and 2x Staff Houses',
    'Construction of the PNG Maritime College Simulator Building and 2x Staff Houses',
    3600000,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'angeline.oki@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-46
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000005',
    '20002020-0000-0000-0000-000000000012',
    'c2002020-0000-0000-0000-000000000005',
    '2022-02-10',
    8434038.5,
    'PGK',
    'CON-NPC2020-46',
    '2022-02-10',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-46
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000004',
    '20002020-0000-0000-0000-000000000012',
    'NPC Board',
    'M-02/22 dated 10/02/22',
    '2022-02-10',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-47
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000013',
    'NPC2020-47',
    'a2002020-0000-0000-0000-000000000001',
    '2020-01-01',
    NULL,
    'Open Tender',
    'Consultancy Services for Development of Bridge Asset Management Systems',
    'Consultancy Services for Development of Bridge Asset Management Systems',
    NULL,
    'f5202020-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-47
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000006',
    '20002020-0000-0000-0000-000000000013',
    'c2002020-0000-0000-0000-000000000006',
    '2022-05-19',
    9648370.5,
    'PGK',
    'CON-NPC2020-47',
    '2022-05-19',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-47
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000005',
    '20002020-0000-0000-0000-000000000013',
    'NPC Board',
    'M-09/22 on 19/05/22',
    '2022-05-19',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-48
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000014',
    'NPC2020-48',
    'a2002020-0000-0000-0000-000000000001',
    '2021-12-03',
    '2021-12-03 10:00:00+10',
    'Open Tender',
    'Consultancy Services for Construction Supervision of Bridges under BCW1',
    'Consultancy Services for Construction Supervision of Bridges under BCW1',
    NULL,
    'f5202020-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-48
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000007',
    '20002020-0000-0000-0000-000000000014',
    'c2002020-0000-0000-0000-000000000007',
    '2022-05-19',
    13509420,
    'PGK',
    'CON-NPC2020-48',
    '2022-05-19',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-48
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000006',
    '20002020-0000-0000-0000-000000000014',
    'NPC Board',
    'M-09/22 on 19/05/22',
    '2022-05-19',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-49
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000015',
    'NPC2020-49',
    'a2002020-0000-0000-0000-000000000001',
    '2021-12-03',
    '2021-12-03 10:00:00+10',
    'Open Tender',
    'Consultancy Services for Construction Supervision of Bridges under BCW2 and BCW3',
    'Consultancy Services for Construction Supervision of Bridges under BCW2 and BCW3',
    NULL,
    'f5202020-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-49
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000008',
    '20002020-0000-0000-0000-000000000015',
    'c2002020-0000-0000-0000-000000000008',
    '2022-05-19',
    19360000,
    'PGK',
    'CON-NPC2020-49',
    '2022-05-19',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-49
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000007',
    '20002020-0000-0000-0000-000000000015',
    'NPC Board',
    'M-09/22 on 19/05/22',
    '2022-05-19',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-50
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000016',
    'NPC2020-50',
    'a2002020-0000-0000-0000-000000000001',
    '2021-01-15',
    '2021-01-15 10:00:00+10',
    'Open Tender',
    'Detailed Design Construction and Rehabilitation of Bridges between Lae Nadzab and Henganofi',
    'Detailed Design Construction and Rehabilitation of Bridges between Lae Nadzab and Henganofi',
    NULL,
    'f5202020-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-50
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000009',
    '20002020-0000-0000-0000-000000000016',
    'c2002020-0000-0000-0000-000000000009',
    '2022-05-19',
    315395676.88,
    'PGK',
    'CON-NPC2020-50',
    '2022-05-19',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-50
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000008',
    '20002020-0000-0000-0000-000000000016',
    'NPC Board',
    'M-09/22 on 19/05/22',
    '2022-05-19',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-51
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000017',
    'NPC2020-51',
    'a2002020-0000-0000-0000-000000000001',
    '2021-01-15',
    '2021-01-15 10:00:00+10',
    'Open Tender',
    'Detailed Design Construction and Rehabilitation of Bridges between Henganofi and Mangiro',
    'Detailed Design Construction and Rehabilitation of Bridges between Henganofi and Mangiro',
    NULL,
    'f5202020-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-51
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000000a',
    '20002020-0000-0000-0000-000000000017',
    'c2002020-0000-0000-0000-00000000000a',
    '2022-05-19',
    243358407.03,
    'PGK',
    'CON-NPC2020-51',
    '2022-05-19',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-51
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000009',
    '20002020-0000-0000-0000-000000000017',
    'NPC Board',
    'M-09/22 on 19/05/22',
    '2022-05-19',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-52
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000018',
    'NPC2020-52',
    'a2002020-0000-0000-0000-000000000001',
    '2021-01-15',
    '2021-01-15 10:00:00+10',
    'Open Tender',
    'Detailed Design Construction and Rehabilitation of Bridges between Mangiro and Kagamuga',
    'Detailed Design Construction and Rehabilitation of Bridges between Mangiro and Kagamuga',
    NULL,
    'f5202020-0000-0000-0000-000000000001',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-53
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000019',
    'NPC2020-53',
    'a2002020-0000-0000-0000-000000000008',
    '2020-12-18',
    '2020-12-18 10:00:00+10',
    'Open Tender',
    'Consultancy Service for Feasibility Study for Wagang Fishing Port Project in Lae',
    'Consultancy Service for Feasibility Study for Wagang Fishing Port Project in Lae',
    20000000,
    'f5202020-0000-0000-0000-000000000002',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'hane.hekwa@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-54
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000001a',
    'NPC2020-54',
    'a2002020-0000-0000-0000-000000000001',
    '2020-09-07',
    '2020-09-07 10:00:00+10',
    'Open Tender',
    'Upgrading and Rehabilitation of Mt Hagen City Roads in Western Highlands Province',
    'Upgrading and Rehabilitation of Mt Hagen City Roads in Western Highlands Province',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Submitted for Approval',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-55
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000001b',
    'NPC2020-55',
    'a2002020-0000-0000-0000-000000000009',
    '2020-11-12',
    '2020-11-12 10:00:00+10',
    'Open Tender',
    'Construction of new residential building at Kagamuga Mt Hagen WHP',
    'Construction of new residential building at Kagamuga Mt Hagen WHP',
    2500000,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-55
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000000b',
    '20002020-0000-0000-0000-00000000001b',
    'c2002020-0000-0000-0000-00000000000c',
    '2020-12-15',
    2625850,
    'PGK',
    'CON-NPC2020-55',
    '2020-12-15',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-55
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000000b',
    '20002020-0000-0000-0000-00000000001b',
    'NPC Board',
    'M-14/20 dated 15/12/20',
    '2020-12-15',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-56
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000001c',
    'NPC2020-56',
    'a2002020-0000-0000-0000-00000000000a',
    '2020-11-27',
    '2020-11-27 10:00:00+10',
    'Open Tender',
    'Printing of Manuals Booklets and Forms for 2021 Census Enumeration',
    'Printing of Manuals Booklets and Forms for 2021 Census Enumeration',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-56
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000000c',
    '20002020-0000-0000-0000-00000000001c',
    'c2002020-0000-0000-0000-000000000003',
    '2020-12-15',
    4941978.34,
    'PGK',
    'CON-NPC2020-56',
    '2020-12-15',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-56
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000000c',
    '20002020-0000-0000-0000-00000000001c',
    'NPC Board',
    'M-14/20 dated 15/12/20',
    '2020-12-15',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-57
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000001d',
    'NPC2020-57',
    'a2002020-0000-0000-0000-00000000000a',
    '2020-11-27',
    '2020-11-27 10:00:00+10',
    'Open Tender',
    'Procurement of 2021 Census Field Supplies and Stationaries for Enumeration',
    'Procurement of 2021 Census Field Supplies and Stationaries for Enumeration',
    4680000,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-57
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000000d',
    '20002020-0000-0000-0000-00000000001d',
    'c2002020-0000-0000-0000-00000000000d',
    '2020-12-15',
    4139465,
    'PGK',
    'CON-NPC2020-57',
    '2020-12-15',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-57
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000000d',
    '20002020-0000-0000-0000-00000000001d',
    'NPC Board',
    'M-14/20 dated 15/12/20',
    '2020-12-15',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-58
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000001e',
    'NPC2020-58',
    'a2002020-0000-0000-0000-00000000000a',
    '2020-11-27',
    '2020-11-27 10:00:00+10',
    'Open Tender',
    'Procurement of 2021 Census Field Gears for Listing and Enumeration',
    'Procurement of 2021 Census Field Gears for Listing and Enumeration',
    4139495,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-58
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000000e',
    '20002020-0000-0000-0000-00000000001e',
    'c2002020-0000-0000-0000-00000000000e',
    '2020-12-15',
    3546626,
    'PGK',
    'CON-NPC2020-58',
    '2020-12-15',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-58
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000000e',
    '20002020-0000-0000-0000-00000000001e',
    'NPC Board',
    'M-14/20 dated 15/12/20',
    '2020-12-15',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-59
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000001f',
    'NPC2020-59',
    'a2002020-0000-0000-0000-00000000000a',
    '2020-11-27',
    '2020-11-27 10:00:00+10',
    'Open Tender',
    'Procurement of 2021 Census ICT Equipment',
    'Procurement of 2021 Census ICT Equipment',
    935800,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-59
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000000f',
    '20002020-0000-0000-0000-00000000001f',
    'c2002020-0000-0000-0000-00000000000f',
    '2020-12-15',
    970860,
    'PGK',
    'CON-NPC2020-59',
    '2020-12-15',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-59
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000000f',
    '20002020-0000-0000-0000-00000000001f',
    'NPC Board',
    'M-14/20 dated 15/12/20',
    '2020-12-15',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-60
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000020',
    'NPC2020-60',
    'a2002020-0000-0000-0000-00000000000b',
    '2020-12-17',
    '2020-12-17 10:00:00+10',
    'Open Tender',
    'Construction of the New Telefomin DDA Office Complex in Telefomin',
    'Construction of the New Telefomin DDA Office Complex in Telefomin',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-60
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000010',
    '20002020-0000-0000-0000-000000000020',
    'c2002020-0000-0000-0000-000000000010',
    '2021-03-15',
    9668664.52,
    'PGK',
    'CON-NPC2020-60',
    '2021-03-15',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-60
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000010',
    '20002020-0000-0000-0000-000000000020',
    'NPC Board',
    'M-02/21 dated 15/03/21',
    '2021-03-15',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-61
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000021',
    'NPC2020-61',
    'a2002020-0000-0000-0000-000000000001',
    '2020-10-30',
    '2020-10-30 10:00:00+10',
    'Open Tender',
    'Design and Construction of New Ireland Provincial Administration HQ Building',
    'Design and Construction of New Ireland Provincial Administration HQ Building',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Approved',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-62
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000022',
    'NPC2020-62',
    'a2002020-0000-0000-0000-00000000000c',
    '2021-01-26',
    '2021-01-26 10:00:00+10',
    'Open Tender',
    'Construction of Finschhafen District Court Sub Registry in Morobe Province',
    'Construction of Finschhafen District Court Sub Registry in Morobe Province',
    3000000,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-62
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000011',
    '20002020-0000-0000-0000-000000000022',
    'c2002020-0000-0000-0000-000000000011',
    '2021-07-16',
    3192504.26,
    'PGK',
    'CON-NPC2020-62',
    '2021-07-16',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-62
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000011',
    '20002020-0000-0000-0000-000000000022',
    'NPC Board',
    'M-06/2021 dated 16/07/21',
    '2021-07-16',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-63
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000023',
    'NPC2020-63',
    'a2002020-0000-0000-0000-000000000003',
    '2020-11-26',
    '2020-11-26 10:00:00+10',
    'Open Tender',
    'Purchase and Supply of Mathematics and Science Kits - Southern Region',
    'Purchase and Supply of Mathematics and Science Kits - Southern Region',
    4306919.37,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-63
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000012',
    '20002020-0000-0000-0000-000000000023',
    'c2002020-0000-0000-0000-000000000012',
    '2020-12-02',
    5371819.79,
    'PGK',
    'CON-NPC2020-63',
    '2020-12-02',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-63
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000012',
    '20002020-0000-0000-0000-000000000023',
    'NPC Board',
    'M-13/20 dated 02/12/20',
    '2020-12-02',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-64
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000024',
    'NPC2020-64',
    'a2002020-0000-0000-0000-000000000008',
    '2020-12-08',
    '2020-12-08 10:00:00+10',
    'Open Tender',
    'Construction of Esaala Fisheries Jetty Project',
    'Construction of Esaala Fisheries Jetty Project',
    5800000,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-64
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000013',
    '20002020-0000-0000-0000-000000000024',
    'c2002020-0000-0000-0000-000000000013',
    '2021-08-25',
    5715238,
    'PGK',
    'CON-NPC2020-64',
    '2021-08-25',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-64
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000013',
    '20002020-0000-0000-0000-000000000024',
    'NPC Board',
    '25/08/21 @M-08/21',
    '2021-08-25',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-65
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000025',
    'NPC2020-65',
    'a2002020-0000-0000-0000-000000000006',
    '2021-01-13',
    '2021-01-13 10:00:00+10',
    'Open Tender',
    'Construction of a New Female Facility at Boram Correctional Institution in Wewak',
    'Construction of a New Female Facility at Boram Correctional Institution in Wewak',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-65
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000014',
    '20002020-0000-0000-0000-000000000025',
    'c2002020-0000-0000-0000-000000000014',
    '2021-01-13',
    2541322.21,
    'PGK',
    'CON-NPC2020-65',
    '2021-01-13',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2020-66
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000026',
    'NPC2020-66',
    'a2002020-0000-0000-0000-000000000001',
    '2020-01-01',
    NULL,
    'Open Tender',
    'Long Term Performance Based Road Restoration on Elimbari Ring Road in Simbu Province',
    'Long Term Performance Based Road Restoration on Elimbari Ring Road in Simbu Province',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Cancelled',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Tender: NPC2020-01
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000027',
    'NPC2020-01',
    'a2002020-0000-0000-0000-000000000001',
    '2020-08-21',
    '2020-08-21 10:00:00+10',
    'Open Tender',
    'Consultancy Services for Kokopo Town Roads Design in ENB Province',
    'Consultancy Services for Kokopo Town Roads Design in ENB Province',
    NULL,
    'f5202020-0000-0000-0000-000000000003',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-01
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000015',
    '20002020-0000-0000-0000-000000000027',
    'c2002020-0000-0000-0000-000000000015',
    '2021-04-01',
    4397678.6,
    'PGK',
    'CON-NPC2020-01',
    '2021-04-01',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-01
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000015',
    '20002020-0000-0000-0000-000000000027',
    'NPC Board',
    'M-03/21 dated 01/04/21',
    '2021-04-01',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-02
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000028',
    'NPC2020-02',
    'a2002020-0000-0000-0000-00000000000d',
    '2020-06-25',
    '2020-06-25 10:00:00+10',
    'Open Tender',
    'Rehabilitation of Tokena to Parera Feeders Rd in Obura Wanenara Rd in EHP',
    'Rehabilitation of Tokena to Parera Feeders Rd in Obura Wanenara Rd in EHP',
    2700000,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-02
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000016',
    '20002020-0000-0000-0000-000000000028',
    'c2002020-0000-0000-0000-000000000016',
    '2020-12-02',
    2812915.2,
    'PGK',
    'CON-NPC2020-02',
    '2020-12-02',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-02
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000016',
    '20002020-0000-0000-0000-000000000028',
    'NPC Board',
    '02/12/2020 MoM 13/20',
    '2020-12-02',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-06
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000029',
    'NPC2020-06',
    'a2002020-0000-0000-0000-000000000003',
    '2020-01-01',
    NULL,
    'Open Tender',
    'Construction of a Science Laboratory Wantoat High School Morobe Province',
    'Construction of a Science Laboratory Wantoat High School Morobe Province',
    800000,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-06
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000017',
    '20002020-0000-0000-0000-000000000029',
    'c2002020-0000-0000-0000-000000000017',
    '2020-12-15',
    879984.6,
    'PGK',
    'CON-NPC2020-06',
    '2020-12-15',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-06
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000017',
    '20002020-0000-0000-0000-000000000029',
    'NPC Board',
    'M-14/20 dated 15/12/2020',
    '2020-12-15',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-07
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000002a',
    'NPC2020-07',
    'a2002020-0000-0000-0000-000000000003',
    '2020-01-01',
    NULL,
    'Open Tender',
    'Construction of a Science Laboratory Kami High School Jiwaka Province',
    'Construction of a Science Laboratory Kami High School Jiwaka Province',
    800000,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-07
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000018',
    '20002020-0000-0000-0000-00000000002a',
    'c2002020-0000-0000-0000-000000000018',
    '2020-12-15',
    789575.44,
    'PGK',
    'CON-NPC2020-07',
    '2020-12-15',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-07
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000018',
    '20002020-0000-0000-0000-00000000002a',
    'NPC Board',
    'M-14/20 dated 15/12/2020',
    '2020-12-15',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-08
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000002b',
    'NPC2020-08',
    'a2002020-0000-0000-0000-000000000003',
    '2020-01-01',
    NULL,
    'Open Tender',
    'Construction of a Science Laboratory Neregaima High School Simbu Province',
    'Construction of a Science Laboratory Neregaima High School Simbu Province',
    800000,
    'f5202020-0000-0000-0000-000000000002',
    'Approved',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Approval for NPC2020-08
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000019',
    '20002020-0000-0000-0000-00000000002b',
    'NPC Board',
    'M-14/20 dated 15/12/2020',
    '2020-12-15',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-10
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000002c',
    'NPC2020-10',
    'a2002020-0000-0000-0000-000000000003',
    '2020-01-01',
    NULL,
    'Open Tender',
    'Construction of a Science Laboratory Kwikila High School Central Province',
    'Construction of a Science Laboratory Kwikila High School Central Province',
    800000,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-10
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000019',
    '20002020-0000-0000-0000-00000000002c',
    'c2002020-0000-0000-0000-000000000018',
    '2020-12-15',
    789575.44,
    'PGK',
    'CON-NPC2020-10',
    '2020-12-15',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-10
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000001a',
    '20002020-0000-0000-0000-00000000002c',
    'NPC Board',
    'M-14/20 dated 15/12/2020',
    '2020-12-15',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-11
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000002d',
    'NPC2020-11',
    'a2002020-0000-0000-0000-000000000003',
    '2020-01-01',
    NULL,
    'Open Tender',
    'Construction of a Science Laboratory St Marcellin High School East Sepik Province',
    'Construction of a Science Laboratory St Marcellin High School East Sepik Province',
    800000,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-11
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000001a',
    '20002020-0000-0000-0000-00000000002d',
    'c2002020-0000-0000-0000-00000000001a',
    '2020-12-15',
    797500,
    'PGK',
    'CON-NPC2020-11',
    '2020-12-15',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-11
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000001b',
    '20002020-0000-0000-0000-00000000002d',
    'NPC Board',
    'M-14/20 dated 15/12/2020',
    '2020-12-15',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-12
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000002e',
    'NPC2020-12',
    'a2002020-0000-0000-0000-000000000003',
    '2020-01-01',
    NULL,
    'Open Tender',
    'Construction of a Science Laboratory Daru Secondary School Western Province',
    'Construction of a Science Laboratory Daru Secondary School Western Province',
    800000,
    'f5202020-0000-0000-0000-000000000002',
    'Approved',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Approval for NPC2020-12
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000001c',
    '20002020-0000-0000-0000-00000000002e',
    'NPC Board',
    'M-14/20 dated 15/12/2020',
    '2020-12-15',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-15
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000002f',
    'NPC2020-15',
    'a2002020-0000-0000-0000-00000000000e',
    '2020-08-03',
    '2020-08-03 10:00:00+10',
    'Open Tender',
    'Construction of Madang Laboratory Building',
    'Construction of Madang Laboratory Building',
    24623500,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-15
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000001b',
    '20002020-0000-0000-0000-00000000002f',
    'c2002020-0000-0000-0000-00000000001c',
    '2020-12-15',
    24365874.95,
    'PGK',
    'CON-NPC2020-15',
    '2020-12-15',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-15
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000001d',
    '20002020-0000-0000-0000-00000000002f',
    'NPC Board',
    'M-14/20 dated 15/12/2020',
    '2020-12-15',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-16
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000030',
    'NPC2020-16',
    'a2002020-0000-0000-0000-000000000001',
    '2020-05-15',
    '2020-05-15 10:00:00+10',
    'Open Tender',
    'Engineering Procurement Construction of Nipa Secondary School to Ambu Top',
    'Engineering Procurement Construction of Nipa Secondary School to Ambu Top',
    244386069.35,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-16
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000001c',
    '20002020-0000-0000-0000-000000000030',
    'c2002020-0000-0000-0000-00000000001d',
    '2021-02-03',
    224386069.35,
    'PGK',
    'CON-NPC2020-16',
    '2021-02-03',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-16
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000001e',
    '20002020-0000-0000-0000-000000000030',
    'NEC',
    'NEC M/No.2/21 on 03/2/21',
    '2021-02-03',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-21
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000031',
    'NPC2020-21',
    'a2002020-0000-0000-0000-00000000000f',
    '2020-06-30',
    '2020-06-30 10:00:00+10',
    'Open Tender',
    'Design and Construction of Road from 9 Mile Roundabout to Pacific Adventist University',
    'Design and Construction of Road from 9 Mile Roundabout to Pacific Adventist University',
    240000000,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-21
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000001d',
    '20002020-0000-0000-0000-000000000031',
    'c2002020-0000-0000-0000-00000000001e',
    '2020-10-27',
    117726748.9,
    'PGK',
    'CON-NPC2020-21',
    '2020-10-27',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-21
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000001f',
    '20002020-0000-0000-0000-000000000031',
    'NPC Board',
    'M-12/20 dated 27/10/20',
    '2020-10-27',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-22
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000032',
    'NPC2020-22',
    'a2002020-0000-0000-0000-00000000000f',
    '2020-06-30',
    '2020-06-30 10:00:00+10',
    'Open Tender',
    'Construction of Gerehu Drive from Modiki Drive to Nigibata Road',
    'Construction of Gerehu Drive from Modiki Drive to Nigibata Road',
    240000000,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'frank.hare@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-22
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000001e',
    '20002020-0000-0000-0000-000000000032',
    'c2002020-0000-0000-0000-00000000001f',
    '2020-10-27',
    39489612.57,
    'PGK',
    'CON-NPC2020-22',
    '2020-10-27',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-22
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000020',
    '20002020-0000-0000-0000-000000000032',
    'NPC Board',
    'M-12/20 dated 27/10/20',
    '2020-10-27',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-24
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000033',
    'NPC2020-24',
    'a2002020-0000-0000-0000-000000000010',
    '2019-12-06',
    '2019-12-06 10:00:00+10',
    'Open Tender',
    'Civil Works Road Maintenance Project for Brandi to Suanum in Wewak District',
    'Civil Works Road Maintenance Project for Brandi to Suanum in Wewak District',
    5000000,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'veari.hitolo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-24
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000001f',
    '20002020-0000-0000-0000-000000000033',
    'c2002020-0000-0000-0000-000000000020',
    '2020-07-09',
    5000000,
    'PGK',
    'CON-NPC2020-24',
    '2020-07-09',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-24
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000021',
    '20002020-0000-0000-0000-000000000033',
    'NPC Board',
    '09/07/20 BM No. 07/2020',
    '2020-07-09',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-27
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000034',
    'NPC2020-27',
    'a2002020-0000-0000-0000-000000000011',
    '2023-07-28',
    '2023-07-28 10:00:00+10',
    'Open Tender',
    'New Integrated Tax Administration System (ITAS)',
    'New Integrated Tax Administration System (ITAS)',
    82000000,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'agaru.agarobe@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-27
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000020',
    '20002020-0000-0000-0000-000000000034',
    'c2002020-0000-0000-0000-000000000021',
    '2023-07-28',
    79500000,
    'PGK',
    'CON-NPC2020-27',
    '2023-07-28',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Tender: NPC2020-28
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000035',
    'NPC2020-28',
    'a2002020-0000-0000-0000-000000000001',
    '2022-02-07',
    '2022-02-07 10:00:00+10',
    'Open Tender',
    'Preparation of Feasibility Study for Northern Region Corridor',
    'Preparation of Feasibility Study for Northern Region Corridor',
    NULL,
    'f5202020-0000-0000-0000-000000000001',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-28
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000021',
    '20002020-0000-0000-0000-000000000035',
    'c2002020-0000-0000-0000-000000000022',
    '2022-09-09',
    11552800,
    'PGK',
    'CON-NPC2020-28',
    '2022-09-09',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-28
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000022',
    '20002020-0000-0000-0000-000000000035',
    'NPC Board',
    'MoM No. 12/22 dated 09/09/22',
    '2022-09-09',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-134
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000036',
    'NPC2020-134',
    'a2002020-0000-0000-0000-000000000001',
    '2020-01-25',
    '2020-01-25 10:00:00+10',
    'Open Tender',
    'Detailed Design and Construction of 40km Ramu Highway Section',
    'Detailed Design and Construction of 40km Ramu Highway Section',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-134
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000022',
    '20002020-0000-0000-0000-000000000036',
    'c2002020-0000-0000-0000-000000000023',
    '2021-09-05',
    139850695.81,
    'PGK',
    'CON-NPC2020-134',
    '2021-09-05',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-134
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000023',
    '20002020-0000-0000-0000-000000000036',
    'NPC Board',
    'M-09/21 dated 05/09/21',
    '2021-09-05',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-135
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000037',
    'NPC2020-135',
    'a2002020-0000-0000-0000-000000000001',
    '2020-12-22',
    '2020-12-22 10:00:00+10',
    'Open Tender',
    'Detailed Design and Construction of 40km Coastal Highway Section in Sandaun Province',
    'Detailed Design and Construction of 40km Coastal Highway Section in Sandaun Province',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-135
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000023',
    '20002020-0000-0000-0000-000000000037',
    'c2002020-0000-0000-0000-000000000024',
    '2021-09-05',
    145243352.39,
    'PGK',
    'CON-NPC2020-135',
    '2021-09-05',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-135
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000024',
    '20002020-0000-0000-0000-000000000037',
    'NPC Board',
    'M-09/21 dated 05/09/21',
    '2021-09-05',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-136
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000038',
    'NPC2020-136',
    'a2002020-0000-0000-0000-000000000001',
    '2020-12-22',
    '2020-12-22 10:00:00+10',
    'Open Tender',
    'Long Term Performance Based Maintenance of 148.2km Magi Highway Section',
    'Long Term Performance Based Maintenance of 148.2km Magi Highway Section',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-136
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000024',
    '20002020-0000-0000-0000-000000000038',
    'c2002020-0000-0000-0000-000000000025',
    '2021-09-05',
    73595391.1,
    'PGK',
    'CON-NPC2020-136',
    '2021-09-05',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-136
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000025',
    '20002020-0000-0000-0000-000000000038',
    'NPC Board',
    'M-09/21 dated 05/09/21',
    '2021-09-05',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-137
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000039',
    'NPC2020-137',
    'a2002020-0000-0000-0000-000000000001',
    '2020-12-22',
    '2020-12-22 10:00:00+10',
    'Open Tender',
    'Detailed Design and Construction of 52.0km Magi Highway Section',
    'Detailed Design and Construction of 52.0km Magi Highway Section',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-137
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000025',
    '20002020-0000-0000-0000-000000000039',
    'c2002020-0000-0000-0000-000000000026',
    '2021-09-05',
    164428602.45,
    'PGK',
    'CON-NPC2020-137',
    '2021-09-05',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-137
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000026',
    '20002020-0000-0000-0000-000000000039',
    'NPC Board',
    'M-09/21 dated 05/09/21',
    '2021-09-05',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-138
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000003a',
    'NPC2020-138',
    'a2002020-0000-0000-0000-000000000001',
    '2020-12-08',
    '2020-12-08 10:00:00+10',
    'Open Tender',
    'Detailed Design and Construction of 40.0km New Britain Highway Section',
    'Detailed Design and Construction of 40.0km New Britain Highway Section',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-138
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000026',
    '20002020-0000-0000-0000-00000000003a',
    'c2002020-0000-0000-0000-000000000027',
    '2021-09-05',
    138495587.45,
    'PGK',
    'CON-NPC2020-138',
    '2021-09-05',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-138
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000027',
    '20002020-0000-0000-0000-00000000003a',
    'NPC Board',
    'M-09/21 dated 05/09/21',
    '2021-09-05',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-140
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000003b',
    'NPC2020-140',
    'a2002020-0000-0000-0000-000000000001',
    '2020-12-08',
    '2020-12-08 10:00:00+10',
    'Open Tender',
    'Detailed Design and Construction of 30.0km East West Highway section in Manus Province',
    'Detailed Design and Construction of 30.0km East West Highway section in Manus Province',
    NULL,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-140
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000027',
    '20002020-0000-0000-0000-00000000003b',
    'c2002020-0000-0000-0000-000000000028',
    '2021-09-13',
    115988738.53,
    'PGK',
    'CON-NPC2020-140',
    '2021-09-13',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-140
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000028',
    '20002020-0000-0000-0000-00000000003b',
    'NPC Board',
    'M-04/21 dated 13/09/21',
    '2021-09-13',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-142
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000003c',
    'NPC2020-142',
    'a2002020-0000-0000-0000-000000000012',
    '2021-08-10',
    '2021-08-10 10:00:00+10',
    'Open Tender',
    'Provision of Routine Logistics and Distribution of Medical Supplies - Momase Region',
    'Provision of Routine Logistics and Distribution of Medical Supplies - Momase Region',
    9881073,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-142
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000028',
    '20002020-0000-0000-0000-00000000003c',
    'c2002020-0000-0000-0000-000000000029',
    '2022-04-26',
    9881073,
    'PGK',
    'CON-NPC2020-142',
    '2022-04-26',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-142
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000029',
    '20002020-0000-0000-0000-00000000003c',
    'NPC Board',
    '26/04/2022 M-04/22',
    '2022-04-26',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-143
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000003d',
    'NPC2020-143',
    'a2002020-0000-0000-0000-000000000012',
    '2021-08-10',
    '2021-08-10 10:00:00+10',
    'Open Tender',
    'Provision of Routine Logistics and Distribution of Medical Supplies - Highlands Region',
    'Provision of Routine Logistics and Distribution of Medical Supplies - Highlands Region',
    9801173.5,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-143
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000029',
    '20002020-0000-0000-0000-00000000003d',
    'c2002020-0000-0000-0000-00000000002a',
    '2022-04-26',
    9801173.5,
    'PGK',
    'CON-NPC2020-143',
    '2022-04-26',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-143
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000002a',
    '20002020-0000-0000-0000-00000000003d',
    'NPC Board',
    '26/04/2022 M-04/22',
    '2022-04-26',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-144
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000003e',
    'NPC2020-144',
    'a2002020-0000-0000-0000-000000000012',
    '2021-08-10',
    '2021-08-10 10:00:00+10',
    'Open Tender',
    'Provision of Routine Logistics and Distribution of Medical Supplies - Southern Region',
    'Provision of Routine Logistics and Distribution of Medical Supplies - Southern Region',
    8391673.41,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-144
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000002a',
    '20002020-0000-0000-0000-00000000003e',
    'c2002020-0000-0000-0000-00000000002b',
    '2022-04-26',
    8391673.41,
    'PGK',
    'CON-NPC2020-144',
    '2022-04-26',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-144
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000002b',
    '20002020-0000-0000-0000-00000000003e',
    'NPC Board',
    '26/04/2022 M-04/22',
    '2022-04-26',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-145
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-00000000003f',
    'NPC2020-145',
    'a2002020-0000-0000-0000-000000000012',
    '2021-08-10',
    '2021-08-10 10:00:00+10',
    'Open Tender',
    'Provision of Routine Logistics and Distribution of Medical Supplies - NGI Region',
    'Provision of Routine Logistics and Distribution of Medical Supplies - NGI Region',
    7014559,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-145
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000002b',
    '20002020-0000-0000-0000-00000000003f',
    'c2002020-0000-0000-0000-00000000002c',
    '2022-04-26',
    7014559,
    'PGK',
    'CON-NPC2020-145',
    '2022-04-26',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-145
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000002c',
    '20002020-0000-0000-0000-00000000003f',
    'NPC Board',
    '26/04/2022 M-04/22',
    '2022-04-26',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-149
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000040',
    'NPC2020-149',
    'a2002020-0000-0000-0000-000000000001',
    '2021-07-15',
    '2021-07-15 10:00:00+10',
    'Open Tender',
    'Long Term Maintenance Contract on the Enga Highway from Lai Bridge to Wabag town',
    'Long Term Maintenance Contract on the Enga Highway from Lai Bridge to Wabag town',
    9998952.48,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'guria.verave@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-149
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000002c',
    '20002020-0000-0000-0000-000000000040',
    'c2002020-0000-0000-0000-00000000002d',
    '2021-09-30',
    9841227,
    'PGK',
    'CON-NPC2020-149',
    '2021-09-30',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-149
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000002d',
    '20002020-0000-0000-0000-000000000040',
    'NPC Board',
    'M-10/2021 dated 30/09/21',
    '2021-09-30',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-130
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000041',
    'NPC2020-130',
    'a2002020-0000-0000-0000-000000000003',
    '2020-11-26',
    '2020-11-26 10:00:00+10',
    'Open Tender',
    'Purchase and Supply of Mathematics and Science Kits - Highlands Region',
    'Purchase and Supply of Mathematics and Science Kits - Highlands Region',
    5447391.68,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-130
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000002d',
    '20002020-0000-0000-0000-000000000041',
    'c2002020-0000-0000-0000-000000000012',
    '2020-12-02',
    5447391.68,
    'PGK',
    'CON-NPC2020-130',
    '2020-12-02',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-130
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000002e',
    '20002020-0000-0000-0000-000000000041',
    'NPC Board',
    'M-13/20 dated 02/12/20',
    '2020-12-02',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-131
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000042',
    'NPC2020-131',
    'a2002020-0000-0000-0000-000000000003',
    '2020-11-26',
    '2020-11-26 10:00:00+10',
    'Open Tender',
    'Purchase and Supply of Mathematics and Science Kits - Momase Region',
    'Purchase and Supply of Mathematics and Science Kits - Momase Region',
    4402240.61,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-131
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000002e',
    '20002020-0000-0000-0000-000000000042',
    'c2002020-0000-0000-0000-000000000012',
    '2020-12-02',
    4402240,
    'PGK',
    'CON-NPC2020-131',
    '2020-12-02',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-131
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-00000000002f',
    '20002020-0000-0000-0000-000000000042',
    'NPC Board',
    'M-13/20 dated 02/12/20',
    '2020-12-02',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-132
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000043',
    'NPC2020-132',
    'a2002020-0000-0000-0000-000000000003',
    '2020-11-26',
    '2020-11-26 10:00:00+10',
    'Open Tender',
    'Purchase and Supply of Mathematics and Science Kits - New Guinea Islands Region',
    'Purchase and Supply of Mathematics and Science Kits - New Guinea Islands Region',
    5371819.79,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'geoffrey.kinibo@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-132
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-00000000002f',
    '20002020-0000-0000-0000-000000000043',
    'c2002020-0000-0000-0000-00000000002e',
    '2020-12-02',
    4306919.37,
    'PGK',
    'CON-NPC2020-132',
    '2020-12-02',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-132
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000030',
    '20002020-0000-0000-0000-000000000043',
    'NPC Board',
    'M-13/20 dated 02/12/20',
    '2020-12-02',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- Tender: NPC2020-133
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES (
    '20002020-0000-0000-0000-000000000044',
    'NPC2020-133',
    'a2002020-0000-0000-0000-000000000007',
    '2020-12-20',
    '2020-12-20 10:00:00+10',
    'Open Tender',
    'Construction of Tidegu Jetty Finschhafen District Morobe Province',
    'Construction of Tidegu Jetty Finschhafen District Morobe Province',
    3000000,
    'f5202020-0000-0000-0000-000000000002',
    'Awarded',
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1),
    (SELECT id FROM officers WHERE email = 'wanom.nothsman@npc.gov.pg' LIMIT 1)
) ON CONFLICT (tender_no) DO NOTHING;

-- Contract Award for NPC2020-133
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES (
    'ca202020-0000-0000-0000-000000000030',
    '20002020-0000-0000-0000-000000000044',
    'c2002020-0000-0000-0000-00000000002f',
    '2021-03-15',
    1998595.5,
    'PGK',
    'CON-NPC2020-133',
    '2021-03-15',
    '2025-12-31',
    'Completed'
) ON CONFLICT (tender_id) DO NOTHING;

-- Approval for NPC2020-133
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision) VALUES (
    'a9202020-0000-0000-0000-000000000031',
    '20002020-0000-0000-0000-000000000044',
    'NPC Board',
    'M-02/21 dated 15/03/21',
    '2021-03-15',
    'Approved'
) ON CONFLICT (id) DO NOTHING;

-- ============================================
-- END OF 2020 DATA MIGRATION
-- ============================================
