-- ============================================
-- ENABLE PUBLIC READ ACCESS FOR TESTING
-- Run this in Supabase SQL Editor to allow anonymous reads
-- ============================================

-- Allow public read access to all tables (for testing without auth)

-- Agencies
DROP POLICY IF EXISTS public_read_agencies ON agencies;
CREATE POLICY public_read_agencies ON agencies
    FOR SELECT USING (true);

-- Officers
DROP POLICY IF EXISTS public_read_officers ON officers;
CREATE POLICY public_read_officers ON officers
    FOR SELECT USING (true);

-- Funding Sources
DROP POLICY IF EXISTS public_read_funding_sources ON funding_sources;
CREATE POLICY public_read_funding_sources ON funding_sources
    FOR SELECT USING (true);

-- Contractors
DROP POLICY IF EXISTS public_read_contractors ON contractors;
CREATE POLICY public_read_contractors ON contractors
    FOR SELECT USING (true);

-- Tenders (update existing policy)
DROP POLICY IF EXISTS public_read_tenders ON tenders;
CREATE POLICY public_read_tenders ON tenders
    FOR SELECT USING (true);

-- Tender Workflow Events
DROP POLICY IF EXISTS public_read_workflow ON tender_workflow_events;
CREATE POLICY public_read_workflow ON tender_workflow_events
    FOR SELECT USING (true);

-- Tender Documents
DROP POLICY IF EXISTS public_read_documents ON tender_documents;
CREATE POLICY public_read_documents ON tender_documents
    FOR SELECT USING (true);

-- Approvals
DROP POLICY IF EXISTS public_read_approvals ON approvals;
CREATE POLICY public_read_approvals ON approvals
    FOR SELECT USING (true);

-- Bids
DROP POLICY IF EXISTS public_read_bids ON bids;
CREATE POLICY public_read_bids ON bids
    FOR SELECT USING (true);

-- Contract Awards
DROP POLICY IF EXISTS public_read_contract_awards ON contract_awards;
CREATE POLICY public_read_contract_awards ON contract_awards
    FOR SELECT USING (true);

-- Contract Milestones
DROP POLICY IF EXISTS public_read_milestones ON contract_milestones;
CREATE POLICY public_read_milestones ON contract_milestones
    FOR SELECT USING (true);

-- Contract Variations
DROP POLICY IF EXISTS public_read_variations ON contract_variations;
CREATE POLICY public_read_variations ON contract_variations
    FOR SELECT USING (true);

-- Contract Issues/Risks
DROP POLICY IF EXISTS public_read_issues ON contract_issues_risks;
CREATE POLICY public_read_issues ON contract_issues_risks
    FOR SELECT USING (true);

-- APC Certificates
DROP POLICY IF EXISTS public_read_apc ON apc_certificates;
CREATE POLICY public_read_apc ON apc_certificates
    FOR SELECT USING (true);

-- Evaluations
DROP POLICY IF EXISTS public_read_evaluations ON evaluations;
CREATE POLICY public_read_evaluations ON evaluations
    FOR SELECT USING (true);

-- Evaluation Scores
DROP POLICY IF EXISTS public_read_eval_scores ON evaluation_scores;
CREATE POLICY public_read_eval_scores ON evaluation_scores
    FOR SELECT USING (true);

-- Contractor Performance Reviews
DROP POLICY IF EXISTS public_read_performance ON contractor_performance_reviews;
CREATE POLICY public_read_performance ON contractor_performance_reviews
    FOR SELECT USING (true);

-- ============================================
-- Verify data exists
-- ============================================
SELECT 'agencies' as table_name, COUNT(*) as row_count FROM agencies
UNION ALL
SELECT 'officers', COUNT(*) FROM officers
UNION ALL
SELECT 'funding_sources', COUNT(*) FROM funding_sources
UNION ALL
SELECT 'contractors', COUNT(*) FROM contractors
UNION ALL
SELECT 'tenders', COUNT(*) FROM tenders
UNION ALL
SELECT 'contract_awards', COUNT(*) FROM contract_awards
UNION ALL
SELECT 'approvals', COUNT(*) FROM approvals;
