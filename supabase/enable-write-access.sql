-- ============================================
-- ENABLE PUBLIC WRITE ACCESS FOR TESTING
-- Run this in Supabase SQL Editor to allow updates
-- ============================================

-- Allow public update access to contractors (for editing contact details)
DROP POLICY IF EXISTS public_update_contractors ON contractors;
CREATE POLICY public_update_contractors ON contractors
    FOR UPDATE USING (true) WITH CHECK (true);

-- Allow public insert for contractors
DROP POLICY IF EXISTS public_insert_contractors ON contractors;
CREATE POLICY public_insert_contractors ON contractors
    FOR INSERT WITH CHECK (true);

-- Allow public update to tenders
DROP POLICY IF EXISTS public_update_tenders ON tenders;
CREATE POLICY public_update_tenders ON tenders
    FOR UPDATE USING (true) WITH CHECK (true);

-- Allow public update to contract_awards
DROP POLICY IF EXISTS public_update_contract_awards ON contract_awards;
CREATE POLICY public_update_contract_awards ON contract_awards
    FOR UPDATE USING (true) WITH CHECK (true);

-- Allow public update to officers
DROP POLICY IF EXISTS public_update_officers ON officers;
CREATE POLICY public_update_officers ON officers
    FOR UPDATE USING (true) WITH CHECK (true);

-- Allow public insert to officers
DROP POLICY IF EXISTS public_insert_officers ON officers;
CREATE POLICY public_insert_officers ON officers
    FOR INSERT WITH CHECK (true);

-- Verify policies
SELECT tablename, policyname, permissive, cmd
FROM pg_policies
WHERE schemaname = 'public'
ORDER BY tablename, cmd;
