-- ============================================
-- CONTRACT REGISTRY SYSTEM - SEED DATA
-- National Procurement Commission, Papua New Guinea
-- ============================================

-- ============================================
-- AGENCIES
-- ============================================
INSERT INTO agencies (id, name, abbreviation, level, sector) VALUES
    ('a0000001-0000-0000-0000-000000000001', 'Department of Works', 'DoW', 'National', 'Infrastructure'),
    ('a0000001-0000-0000-0000-000000000002', 'Department of Health', 'DoH', 'National', 'Health'),
    ('a0000001-0000-0000-0000-000000000003', 'Department of Education', 'DoE', 'National', 'Education'),
    ('a0000001-0000-0000-0000-000000000004', 'Department of Finance', 'DoF', 'National', 'Finance'),
    ('a0000001-0000-0000-0000-000000000005', 'Department of ICT', 'DICT', 'National', 'ICT'),
    ('a0000001-0000-0000-0000-000000000006', 'PNG Power Limited', 'PPL', 'National', 'Energy'),
    ('a0000001-0000-0000-0000-000000000007', 'National Roads Authority', 'NRA', 'National', 'Infrastructure'),
    ('a0000001-0000-0000-0000-000000000008', 'Western Province Administration', 'WPA', 'Provincial', 'Administration'),
    ('a0000001-0000-0000-0000-000000000009', 'Morobe Provincial Administration', 'MPA', 'Provincial', 'Administration'),
    ('a0000001-0000-0000-0000-000000000010', 'NCD Provincial Health Authority', 'NCDPHA', 'Provincial', 'Health');

-- ============================================
-- OFFICERS
-- ============================================
INSERT INTO officers (id, full_name, email, phone, agency_id, role) VALUES
    ('b0000001-0000-0000-0000-000000000001', 'John Waiko', 'j.waiko@works.gov.pg', '675 321 4567', 'a0000001-0000-0000-0000-000000000001', 'Procurement Officer'),
    ('b0000001-0000-0000-0000-000000000002', 'Mary Tukul', 'm.tukul@health.gov.pg', '675 321 4568', 'a0000001-0000-0000-0000-000000000002', 'Procurement Officer'),
    ('b0000001-0000-0000-0000-000000000003', 'Peter Kuman', 'p.kuman@education.gov.pg', '675 321 4569', 'a0000001-0000-0000-0000-000000000003', 'Procurement Officer'),
    ('b0000001-0000-0000-0000-000000000004', 'Susan Naru', 's.naru@finance.gov.pg', '675 321 4570', 'a0000001-0000-0000-0000-000000000004', 'Management'),
    ('b0000001-0000-0000-0000-000000000005', 'James Kila', 'j.kila@ict.gov.pg', '675 321 4571', 'a0000001-0000-0000-0000-000000000005', 'Procurement Officer'),
    ('b0000001-0000-0000-0000-000000000006', 'Anna Maru', 'a.maru@npc.gov.pg', '675 303 8800', 'a0000001-0000-0000-0000-000000000004', 'Admin'),
    ('b0000001-0000-0000-0000-000000000007', 'David Eri', 'd.eri@nra.gov.pg', '675 321 4573', 'a0000001-0000-0000-0000-000000000007', 'Procurement Officer'),
    ('b0000001-0000-0000-0000-000000000008', 'Grace Sipo', 'g.sipo@ppl.com.pg', '675 321 4574', 'a0000001-0000-0000-0000-000000000006', 'Procurement Officer');

-- ============================================
-- CONTRACTORS
-- ============================================
INSERT INTO contractors (id, legal_name, trading_name, ipa_registration_no, tax_id, address, province, district, contact_person, phone, email, status, categories) VALUES
    ('c0000001-0000-0000-0000-000000000001', 'Curtain Brothers (PNG) Ltd', 'Curtain Bros', 'IPA-001234', 'TIN-001234', 'Section 47, Gordons', 'NCD', 'Moresby North', 'Michael Curtain', '675 325 1234', 'contracts@curtainbros.com.pg', 'Active', ARRAY['Works']),
    ('c0000001-0000-0000-0000-000000000002', 'Ela Motors Limited', 'Ela Motors', 'IPA-001235', 'TIN-001235', 'Champion Parade, Boroko', 'NCD', 'Moresby South', 'Robert Gillies', '675 325 2345', 'sales@elamotors.com.pg', 'Active', ARRAY['Goods']),
    ('c0000001-0000-0000-0000-000000000003', 'Deloitte PNG', 'Deloitte', 'IPA-001236', 'TIN-001236', 'Deloitte Tower, Port Moresby', 'NCD', 'Moresby South', 'Sarah Thompson', '675 325 3456', 'contact@deloitte.com.pg', 'Active', ARRAY['Consulting', 'Services']),
    ('c0000001-0000-0000-0000-000000000004', 'Datec PNG', 'Datec', 'IPA-001237', 'TIN-001237', 'Datec Centre, Waigani', 'NCD', 'Moresby North-West', 'Tom Kurio', '675 325 4567', 'sales@datec.com.pg', 'Active', ARRAY['Goods', 'Services']),
    ('c0000001-0000-0000-0000-000000000005', 'Consort Express Lines', 'Consort', 'IPA-001238', 'TIN-001238', 'Harbour City, Lae', 'Morobe', 'Lae', 'Joe Tamate', '675 472 1234', 'logistics@consort.com.pg', 'Active', ARRAY['Services']),
    ('c0000001-0000-0000-0000-000000000006', 'Hornibrook NGI Ltd', 'Hornibrook', 'IPA-001239', 'TIN-001239', 'Gordons Industrial', 'NCD', 'Moresby North-East', 'Mark Johnson', '675 325 5678', 'projects@hornibrook.com.pg', 'Active', ARRAY['Works']),
    ('c0000001-0000-0000-0000-000000000007', 'China Harbour Engineering', 'CHEC', 'IPA-001240', 'TIN-001240', 'Kennedy Road, Port Moresby', 'NCD', 'Moresby South', 'Wei Zhang', '675 325 6789', 'png@chec.bj.cn', 'Active', ARRAY['Works']),
    ('c0000001-0000-0000-0000-000000000008', 'McKinsey & Company PNG', 'McKinsey', 'IPA-001241', 'TIN-001241', 'Credit House, Port Moresby', 'NCD', 'Moresby South', 'Amanda Chen', '675 325 7890', 'png@mckinsey.com', 'Active', ARRAY['Consulting']),
    ('c0000001-0000-0000-0000-000000000009', 'Pacific Building Solutions', 'PBS', 'IPA-001242', 'TIN-001242', '6 Mile, Lae Road', 'NCD', 'Moresby North-East', 'Paul Wari', '675 325 8901', 'contracts@pbs.com.pg', 'Suspended', ARRAY['Works']),
    ('c0000001-0000-0000-0000-000000000010', 'Boroko Motors', 'Boroko Motors', 'IPA-001243', 'TIN-001243', 'Boroko Drive', 'NCD', 'Moresby South', 'James Kora', '675 325 9012', 'sales@borokomotors.com.pg', 'Active', ARRAY['Goods']);

-- ============================================
-- TENDERS
-- ============================================
INSERT INTO tenders (id, tender_no, agency_id, issued_date, closing_datetime, procurement_method, project_title, project_description, estimated_value, funding_source_id, status_code, officer_id, created_by, updated_by) VALUES
    ('d0000001-0000-0000-0000-000000000001', 'NPC2026-001', 'a0000001-0000-0000-0000-000000000001', '2026-01-15', '2026-02-15 16:00:00+10', 'Open Tender', 'Highlands Highway Rehabilitation - Section A', 'Major rehabilitation works for 50km section of Highlands Highway between Goroka and Kundiawa including resurfacing, drainage improvements, and bridge repairs.', 85000000, (SELECT id FROM funding_sources WHERE name = 'World Bank'), 'Evaluation', 'b0000001-0000-0000-0000-000000000001', 'b0000001-0000-0000-0000-000000000001', 'b0000001-0000-0000-0000-000000000001'),
    ('d0000001-0000-0000-0000-000000000002', 'NPC2026-002', 'a0000001-0000-0000-0000-000000000002', '2026-01-20', '2026-02-20 16:00:00+10', 'Open Tender', 'Medical Equipment Supply - Port Moresby General Hospital', 'Supply and installation of diagnostic imaging equipment including CT scanner, MRI machine, and X-ray units for PMGH upgrade project.', 15000000, (SELECT id FROM funding_sources WHERE name = 'DFAT Australia'), 'Approved', 'b0000001-0000-0000-0000-000000000002', 'b0000001-0000-0000-0000-000000000002', 'b0000001-0000-0000-0000-000000000002'),
    ('d0000001-0000-0000-0000-000000000003', 'NPC2026-003', 'a0000001-0000-0000-0000-000000000003', '2026-01-25', '2026-02-25 16:00:00+10', 'Open Tender', 'School Infrastructure Program - Phase 2', 'Construction of 20 new primary schools in remote districts of Western, Gulf, and Sandaun provinces under the Education Infrastructure Program.', 45000000, (SELECT id FROM funding_sources WHERE name = 'ADB'), 'Active', 'b0000001-0000-0000-0000-000000000003', 'b0000001-0000-0000-0000-000000000003', 'b0000001-0000-0000-0000-000000000003'),
    ('d0000001-0000-0000-0000-000000000004', 'NPC2026-004', 'a0000001-0000-0000-0000-000000000005', '2026-01-10', '2026-02-10 16:00:00+10', 'Restricted Tender', 'National Digital ID System', 'Development and implementation of a national digital identification system including biometric capture, database infrastructure, and integration with government services.', 25000000, (SELECT id FROM funding_sources WHERE name = 'World Bank'), 'Awarded', 'b0000001-0000-0000-0000-000000000005', 'b0000001-0000-0000-0000-000000000005', 'b0000001-0000-0000-0000-000000000005'),
    ('d0000001-0000-0000-0000-000000000005', 'NPC2026-005', 'a0000001-0000-0000-0000-000000000006', '2026-02-01', '2026-03-01 16:00:00+10', 'Open Tender', 'Solar Power Installation - 10 Provincial Hospitals', 'Design, supply, installation, and commissioning of solar power systems with battery storage for 10 provincial hospitals.', 18000000, (SELECT id FROM funding_sources WHERE name = 'JICA'), 'Issued', 'b0000001-0000-0000-0000-000000000008', 'b0000001-0000-0000-0000-000000000008', 'b0000001-0000-0000-0000-000000000008'),
    ('d0000001-0000-0000-0000-000000000006', 'NPC2026-006', 'a0000001-0000-0000-0000-000000000007', '2025-11-15', '2025-12-15 16:00:00+10', 'Open Tender', 'Lae-Nadzab Highway Upgrade', 'Upgrade of the Lae-Nadzab highway including dualization of key sections and installation of traffic management systems.', 120000000, (SELECT id FROM funding_sources WHERE name = 'ADB'), 'Awarded', 'b0000001-0000-0000-0000-000000000007', 'b0000001-0000-0000-0000-000000000007', 'b0000001-0000-0000-0000-000000000007'),
    ('d0000001-0000-0000-0000-000000000007', 'NPC2026-007', 'a0000001-0000-0000-0000-000000000004', '2026-01-05', '2026-02-05 16:00:00+10', 'Restricted Tender', 'Treasury Management System Upgrade', 'Upgrade of the IFMS treasury management module including new payment gateway integration and enhanced reporting capabilities.', 8500000, (SELECT id FROM funding_sources WHERE name = 'GoPNG'), 'Submitted for Approval', 'b0000001-0000-0000-0000-000000000004', 'b0000001-0000-0000-0000-000000000004', 'b0000001-0000-0000-0000-000000000004'),
    ('d0000001-0000-0000-0000-000000000008', 'NPC2025-089', 'a0000001-0000-0000-0000-000000000001', '2025-09-01', '2025-10-01 16:00:00+10', 'Open Tender', 'Port Moresby Road Network Improvement', 'Improvement of urban roads in Port Moresby including Waigani Drive, Hubert Murray Highway, and connecting roads.', 65000000, (SELECT id FROM funding_sources WHERE name = 'World Bank'), 'Awarded', 'b0000001-0000-0000-0000-000000000001', 'b0000001-0000-0000-0000-000000000001', 'b0000001-0000-0000-0000-000000000001');

-- ============================================
-- CONTRACT AWARDS
-- ============================================
INSERT INTO contract_awards (id, tender_id, contractor_id, award_date, contract_value, currency, contract_no, commencement_date, end_date, status) VALUES
    ('e0000001-0000-0000-0000-000000000001', 'd0000001-0000-0000-0000-000000000004', 'c0000001-0000-0000-0000-000000000004', '2026-03-05', 24500000, 'PGK', 'CON-2026-001', '2026-03-15', '2028-03-14', 'Active'),
    ('e0000001-0000-0000-0000-000000000002', 'd0000001-0000-0000-0000-000000000006', 'c0000001-0000-0000-0000-000000000007', '2026-01-20', 118000000, 'PGK', 'CON-2026-002', '2026-02-01', '2029-01-31', 'Under Implementation'),
    ('e0000001-0000-0000-0000-000000000003', 'd0000001-0000-0000-0000-000000000008', 'c0000001-0000-0000-0000-000000000001', '2025-12-15', 63500000, 'PGK', 'CON-2025-089', '2026-01-02', '2027-06-30', 'Delayed'),
    ('e0000001-0000-0000-0000-000000000004', 'd0000001-0000-0000-0000-000000000002', 'c0000001-0000-0000-0000-000000000002', '2026-02-01', 14200000, 'PGK', 'CON-2026-003', '2026-02-15', '2026-08-14', 'Active');

-- ============================================
-- CONTRACT MILESTONES
-- ============================================
INSERT INTO contract_milestones (id, contract_award_id, milestone_name, milestone_no, due_date, completion_date, status, payment_percentage) VALUES
    -- Digital ID System (e0000001-0000-0000-0000-000000000001)
    ('f0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000001', 'Project Inception & Requirements', 1, '2026-04-15', NULL, 'In Progress', 10),
    ('f0000001-0000-0000-0000-000000000002', 'e0000001-0000-0000-0000-000000000001', 'System Design & Architecture', 2, '2026-06-30', NULL, 'Not Started', 15),
    ('f0000001-0000-0000-0000-000000000003', 'e0000001-0000-0000-0000-000000000001', 'Development Phase 1', 3, '2026-10-31', NULL, 'Not Started', 20),
    ('f0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000001', 'Pilot Implementation', 4, '2027-03-31', NULL, 'Not Started', 20),
    ('f0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000001', 'National Rollout', 5, '2027-12-31', NULL, 'Not Started', 25),
    ('f0000001-0000-0000-0000-000000000006', 'e0000001-0000-0000-0000-000000000001', 'Final Acceptance & Handover', 6, '2028-03-14', NULL, 'Not Started', 10),
    -- Lae-Nadzab Highway (e0000001-0000-0000-0000-000000000002)
    ('f0000001-0000-0000-0000-000000000007', 'e0000001-0000-0000-0000-000000000002', 'Mobilization', 1, '2026-03-01', '2026-02-25', 'Completed', 5),
    ('f0000001-0000-0000-0000-000000000008', 'e0000001-0000-0000-0000-000000000002', 'Section 1 - Earthworks', 2, '2026-06-30', NULL, 'In Progress', 15),
    ('f0000001-0000-0000-0000-000000000009', 'e0000001-0000-0000-0000-000000000002', 'Section 1 - Paving', 3, '2026-10-31', NULL, 'Not Started', 20),
    ('f0000001-0000-0000-0000-000000000010', 'e0000001-0000-0000-0000-000000000002', 'Section 2 - Earthworks', 4, '2027-03-31', NULL, 'Not Started', 15),
    ('f0000001-0000-0000-0000-000000000011', 'e0000001-0000-0000-0000-000000000002', 'Section 2 - Paving', 5, '2027-08-31', NULL, 'Not Started', 20),
    ('f0000001-0000-0000-0000-000000000012', 'e0000001-0000-0000-0000-000000000002', 'Final Completion', 6, '2029-01-31', NULL, 'Not Started', 25),
    -- POM Road Network (e0000001-0000-0000-0000-000000000003)
    ('f0000001-0000-0000-0000-000000000013', 'e0000001-0000-0000-0000-000000000003', 'Mobilization', 1, '2026-01-31', '2026-02-05', 'Completed', 5),
    ('f0000001-0000-0000-0000-000000000014', 'e0000001-0000-0000-0000-000000000003', 'Waigani Drive Section', 2, '2026-04-30', NULL, 'Overdue', 25),
    ('f0000001-0000-0000-0000-000000000015', 'e0000001-0000-0000-0000-000000000003', 'Hubert Murray Highway', 3, '2026-08-31', NULL, 'Not Started', 30),
    ('f0000001-0000-0000-0000-000000000016', 'e0000001-0000-0000-0000-000000000003', 'Connecting Roads', 4, '2027-01-31', NULL, 'Not Started', 25),
    ('f0000001-0000-0000-0000-000000000017', 'e0000001-0000-0000-0000-000000000003', 'Final Completion', 5, '2027-06-30', NULL, 'Not Started', 15),
    -- Medical Equipment (e0000001-0000-0000-0000-000000000004)
    ('f0000001-0000-0000-0000-000000000018', 'e0000001-0000-0000-0000-000000000004', 'Equipment Order & Shipping', 1, '2026-03-31', NULL, 'In Progress', 40),
    ('f0000001-0000-0000-0000-000000000019', 'e0000001-0000-0000-0000-000000000004', 'Delivery & Customs', 2, '2026-05-15', NULL, 'Not Started', 20),
    ('f0000001-0000-0000-0000-000000000020', 'e0000001-0000-0000-0000-000000000004', 'Installation & Commissioning', 3, '2026-07-15', NULL, 'Not Started', 30),
    ('f0000001-0000-0000-0000-000000000021', 'e0000001-0000-0000-0000-000000000004', 'Training & Handover', 4, '2026-08-14', NULL, 'Not Started', 10);

-- ============================================
-- CONTRACT VARIATIONS
-- ============================================
INSERT INTO contract_variations (id, contract_award_id, variation_no, variation_date, value_delta, time_extension_days, reason, approved_by, approval_ref) VALUES
    ('g0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000003', 1, '2026-02-15', 2500000, 45, 'Additional drainage works required due to unexpected ground conditions on Waigani Drive', 'b0000001-0000-0000-0000-000000000001', 'VAR-2026-001'),
    ('g0000001-0000-0000-0000-000000000002', 'e0000001-0000-0000-0000-000000000002', 1, '2026-03-10', 5000000, 0, 'Addition of traffic management equipment at intersections per revised design', 'b0000001-0000-0000-0000-000000000007', 'VAR-2026-002');

-- ============================================
-- CONTRACT ISSUES/RISKS
-- ============================================
INSERT INTO contract_issues_risks (id, contract_award_id, type, severity, description, owner_officer_id, opened_date, closed_date, resolution) VALUES
    ('h0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000003', 'Issue', 'High', 'Contractor experiencing material supply delays due to shipping disruptions', 'b0000001-0000-0000-0000-000000000001', '2026-02-10', NULL, NULL),
    ('h0000001-0000-0000-0000-000000000002', 'e0000001-0000-0000-0000-000000000003', 'Issue', 'Medium', 'Traffic management causing complaints from road users', 'b0000001-0000-0000-0000-000000000001', '2026-02-05', NULL, NULL),
    ('h0000001-0000-0000-0000-000000000003', 'e0000001-0000-0000-0000-000000000002', 'Risk', 'Medium', 'Wet season approaching - potential for earthworks delays in coming months', 'b0000001-0000-0000-0000-000000000007', '2026-02-20', NULL, NULL),
    ('h0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000001', 'Risk', 'Low', 'Technical staff availability for requirements gathering phase', 'b0000001-0000-0000-0000-000000000005', '2026-03-10', NULL, NULL),
    ('h0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000004', 'Risk', 'Medium', 'International shipping delays may impact equipment delivery timeline', 'b0000001-0000-0000-0000-000000000002', '2026-02-25', NULL, NULL);

-- ============================================
-- APPROVALS
-- ============================================
INSERT INTO approvals (id, tender_id, approval_type, reference_no, approval_date, decision, notes) VALUES
    ('i0000001-0000-0000-0000-000000000001', 'd0000001-0000-0000-0000-000000000004', 'TFEC', 'TFEC-2026-05', '2026-02-28', 'Approved', NULL),
    ('i0000001-0000-0000-0000-000000000002', 'd0000001-0000-0000-0000-000000000006', 'NPC Board', 'NPC-BM-2026-01', '2026-01-15', 'Approved', NULL),
    ('i0000001-0000-0000-0000-000000000003', 'd0000001-0000-0000-0000-000000000008', 'NPC Board', 'NPC-BM-2025-12', '2025-12-10', 'Approved', NULL),
    ('i0000001-0000-0000-0000-000000000004', 'd0000001-0000-0000-0000-000000000002', 'TFEC', 'TFEC-2026-04', '2026-02-25', 'Approved', NULL),
    ('i0000001-0000-0000-0000-000000000005', 'd0000001-0000-0000-0000-000000000007', 'TFEC', 'TFEC-2026-06', '2026-02-05', 'Deferred', 'Additional technical evaluation requested');

-- ============================================
-- BIDS
-- ============================================
INSERT INTO bids (id, tender_id, contractor_id, bid_price, received_datetime, is_compliant, notes) VALUES
    ('j0000001-0000-0000-0000-000000000001', 'd0000001-0000-0000-0000-000000000004', 'c0000001-0000-0000-0000-000000000004', 24500000, '2026-02-10 15:30:00+10', TRUE, NULL),
    ('j0000001-0000-0000-0000-000000000002', 'd0000001-0000-0000-0000-000000000004', 'c0000001-0000-0000-0000-000000000003', 28000000, '2026-02-10 14:45:00+10', TRUE, NULL),
    ('j0000001-0000-0000-0000-000000000003', 'd0000001-0000-0000-0000-000000000006', 'c0000001-0000-0000-0000-000000000007', 118000000, '2025-12-15 16:00:00+10', TRUE, NULL),
    ('j0000001-0000-0000-0000-000000000004', 'd0000001-0000-0000-0000-000000000006', 'c0000001-0000-0000-0000-000000000001', 125000000, '2025-12-15 15:30:00+10', TRUE, NULL),
    ('j0000001-0000-0000-0000-000000000005', 'd0000001-0000-0000-0000-000000000006', 'c0000001-0000-0000-0000-000000000006', 135000000, '2025-12-15 14:00:00+10', FALSE, 'Missing required certifications'),
    ('j0000001-0000-0000-0000-000000000006', 'd0000001-0000-0000-0000-000000000008', 'c0000001-0000-0000-0000-000000000001', 63500000, '2025-10-01 15:45:00+10', TRUE, NULL),
    ('j0000001-0000-0000-0000-000000000007', 'd0000001-0000-0000-0000-000000000008', 'c0000001-0000-0000-0000-000000000006', 68000000, '2025-10-01 16:00:00+10', TRUE, NULL),
    ('j0000001-0000-0000-0000-000000000008', 'd0000001-0000-0000-0000-000000000002', 'c0000001-0000-0000-0000-000000000002', 14200000, '2026-02-20 15:00:00+10', TRUE, NULL),
    ('j0000001-0000-0000-0000-000000000009', 'd0000001-0000-0000-0000-000000000001', 'c0000001-0000-0000-0000-000000000001', 82000000, '2026-02-15 15:30:00+10', TRUE, NULL),
    ('j0000001-0000-0000-0000-000000000010', 'd0000001-0000-0000-0000-000000000001', 'c0000001-0000-0000-0000-000000000007', 78500000, '2026-02-15 14:45:00+10', TRUE, NULL);

-- ============================================
-- WORKFLOW EVENTS
-- ============================================
INSERT INTO tender_workflow_events (id, tender_id, event_type, event_datetime, notes, actor_officer_id) VALUES
    ('k0000001-0000-0000-0000-000000000001', 'd0000001-0000-0000-0000-000000000004', 'Issued', '2026-01-10 09:00:00+10', NULL, 'b0000001-0000-0000-0000-000000000005'),
    ('k0000001-0000-0000-0000-000000000002', 'd0000001-0000-0000-0000-000000000004', 'Closed', '2026-02-10 16:00:00+10', NULL, 'b0000001-0000-0000-0000-000000000005'),
    ('k0000001-0000-0000-0000-000000000003', 'd0000001-0000-0000-0000-000000000004', 'Evaluation Started', '2026-02-11 09:00:00+10', NULL, 'b0000001-0000-0000-0000-000000000005'),
    ('k0000001-0000-0000-0000-000000000004', 'd0000001-0000-0000-0000-000000000004', 'Evaluation Completed', '2026-02-20 17:00:00+10', NULL, 'b0000001-0000-0000-0000-000000000005'),
    ('k0000001-0000-0000-0000-000000000005', 'd0000001-0000-0000-0000-000000000004', 'Submitted to TFEC', '2026-02-22 10:00:00+10', NULL, 'b0000001-0000-0000-0000-000000000005'),
    ('k0000001-0000-0000-0000-000000000006', 'd0000001-0000-0000-0000-000000000004', 'TFEC Approved', '2026-02-28 15:00:00+10', 'TFEC Meeting 2026-05', 'b0000001-0000-0000-0000-000000000006'),
    ('k0000001-0000-0000-0000-000000000007', 'd0000001-0000-0000-0000-000000000004', 'Awarded', '2026-03-05 10:00:00+10', 'Contract awarded to Datec PNG', 'b0000001-0000-0000-0000-000000000005'),
    ('k0000001-0000-0000-0000-000000000008', 'd0000001-0000-0000-0000-000000000006', 'Awarded', '2026-01-20 10:00:00+10', 'Contract awarded to CHEC', 'b0000001-0000-0000-0000-000000000007'),
    ('k0000001-0000-0000-0000-000000000009', 'd0000001-0000-0000-0000-000000000008', 'Awarded', '2025-12-15 10:00:00+10', 'Contract awarded to Curtain Bros', 'b0000001-0000-0000-0000-000000000001');
