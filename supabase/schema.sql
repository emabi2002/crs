-- ============================================
-- CONTRACT REGISTRY SYSTEM - SUPABASE SCHEMA
-- National Procurement Commission, Papua New Guinea
-- ============================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- REFERENCE / MASTER TABLES
-- ============================================

-- Agencies Table
CREATE TABLE IF NOT EXISTS agencies (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    abbreviation TEXT,
    level TEXT NOT NULL CHECK (level IN ('National', 'Provincial', 'District')),
    sector TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Officers Table
CREATE TABLE IF NOT EXISTS officers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    full_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT,
    agency_id UUID REFERENCES agencies(id),
    role TEXT NOT NULL CHECK (role IN ('Admin', 'Management', 'Procurement Officer', 'Viewer', 'Auditor')),
    auth_user_id UUID, -- Will reference auth.users when authentication is enabled
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Funding Sources Table
CREATE TABLE IF NOT EXISTS funding_sources (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    donor_name TEXT,
    program_code TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Contractors (Supplier Registry) Table
CREATE TABLE IF NOT EXISTS contractors (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    legal_name TEXT NOT NULL,
    trading_name TEXT,
    ipa_registration_no TEXT,
    tax_id TEXT,
    address TEXT NOT NULL,
    province TEXT NOT NULL,
    district TEXT,
    contact_person TEXT NOT NULL,
    phone TEXT NOT NULL,
    email TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'Active' CHECK (status IN ('Active', 'Suspended', 'Blacklisted')),
    categories TEXT[] NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- TENDER LIFECYCLE TABLES
-- ============================================

-- Tender Status Codes (Reference)
CREATE TABLE IF NOT EXISTS tender_status_codes (
    code TEXT PRIMARY KEY,
    description TEXT,
    display_order INT
);

INSERT INTO tender_status_codes (code, description, display_order) VALUES
    ('Draft', 'Tender in draft, not yet issued', 1),
    ('Issued', 'Tender has been published', 2),
    ('Active', 'Tender is open for submissions', 3),
    ('Closed', 'Submission period has ended', 4),
    ('Evaluation', 'Bids are being evaluated', 5),
    ('Submitted for Approval', 'Awaiting TFEC/Board approval', 6),
    ('Approved', 'Approved, pending award', 7),
    ('Awarded', 'Contract has been awarded', 8),
    ('Cancelled', 'Tender was cancelled', 9),
    ('On Hold', 'Tender is on hold', 10)
ON CONFLICT (code) DO NOTHING;

-- Tenders Table
CREATE TABLE IF NOT EXISTS tenders (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tender_no TEXT UNIQUE NOT NULL,
    agency_id UUID NOT NULL REFERENCES agencies(id),
    issued_date DATE,
    closing_datetime TIMESTAMPTZ,
    procurement_method TEXT NOT NULL CHECK (procurement_method IN (
        'Open Tender', 'Restricted Tender', 'Single Source',
        'Request for Quotation', 'Framework Agreement'
    )),
    project_title TEXT,
    project_description TEXT NOT NULL,
    estimated_value NUMERIC(15,2),
    funding_source_id UUID REFERENCES funding_sources(id),
    status_code TEXT NOT NULL DEFAULT 'Draft' REFERENCES tender_status_codes(code),
    officer_id UUID REFERENCES officers(id),
    created_by UUID REFERENCES officers(id),
    updated_by UUID REFERENCES officers(id),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tender Workflow Events Table (Audit Trail)
CREATE TABLE IF NOT EXISTS tender_workflow_events (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tender_id UUID NOT NULL REFERENCES tenders(id) ON DELETE CASCADE,
    event_type TEXT NOT NULL CHECK (event_type IN (
        'Issued', 'Addendum', 'Clarification', 'Closed',
        'Evaluation Started', 'Evaluation Completed',
        'Submitted to TFEC', 'TFEC Approved', 'Board Approved',
        'NEC Approved', 'Awarded', 'Cancelled'
    )),
    event_datetime TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    notes TEXT,
    actor_officer_id UUID REFERENCES officers(id),
    attachment_id UUID,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tender Documents Table
CREATE TABLE IF NOT EXISTS tender_documents (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tender_id UUID NOT NULL REFERENCES tenders(id) ON DELETE CASCADE,
    doc_type TEXT NOT NULL CHECK (doc_type IN (
        'RFT', 'Addendum', 'Clarification', 'Minutes',
        'Evaluation Report', 'Board Paper', 'Award Notice',
        'Contract', 'Variation', 'Milestone Report', 'Invoice', 'Certificate'
    )),
    file_name TEXT NOT NULL,
    file_url TEXT NOT NULL,
    uploaded_by UUID REFERENCES officers(id),
    uploaded_at TIMESTAMPTZ DEFAULT NOW()
);

-- Approvals Table
CREATE TABLE IF NOT EXISTS approvals (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tender_id UUID NOT NULL REFERENCES tenders(id) ON DELETE CASCADE,
    approval_type TEXT NOT NULL CHECK (approval_type IN (
        'TFEC', 'NPC Board', 'NEC', 'Agency Board', 'Department Head'
    )),
    reference_no TEXT,
    approval_date DATE NOT NULL,
    decision TEXT NOT NULL CHECK (decision IN ('Approved', 'Noted', 'Deferred', 'Rejected')),
    notes TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- APC Certificates Table
CREATE TABLE IF NOT EXISTS apc_certificates (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tender_id UUID NOT NULL REFERENCES tenders(id) ON DELETE CASCADE,
    cert_no TEXT NOT NULL,
    cert_date DATE NOT NULL,
    certified_value NUMERIC(15,2) NOT NULL,
    notes TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- BIDS AND EVALUATION TABLES
-- ============================================

-- Bids Table
CREATE TABLE IF NOT EXISTS bids (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tender_id UUID NOT NULL REFERENCES tenders(id) ON DELETE CASCADE,
    contractor_id UUID NOT NULL REFERENCES contractors(id),
    bid_price NUMERIC(15,2) NOT NULL,
    received_datetime TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    is_compliant BOOLEAN DEFAULT TRUE,
    notes TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Evaluations Table
CREATE TABLE IF NOT EXISTS evaluations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tender_id UUID NOT NULL REFERENCES tenders(id) ON DELETE CASCADE,
    evaluation_type TEXT NOT NULL CHECK (evaluation_type IN ('Technical', 'Financial', 'Combined')),
    start_date DATE NOT NULL,
    end_date DATE,
    outcome_summary TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Evaluation Scores Table
CREATE TABLE IF NOT EXISTS evaluation_scores (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    evaluation_id UUID NOT NULL REFERENCES evaluations(id) ON DELETE CASCADE,
    bid_id UUID NOT NULL REFERENCES bids(id) ON DELETE CASCADE,
    criteria_code TEXT NOT NULL,
    score NUMERIC(5,2) NOT NULL,
    max_score NUMERIC(5,2) NOT NULL,
    comments TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- CONTRACT / AWARD TABLES
-- ============================================

-- Contract Status Codes (Reference)
CREATE TABLE IF NOT EXISTS contract_status_codes (
    code TEXT PRIMARY KEY,
    description TEXT,
    display_order INT
);

INSERT INTO contract_status_codes (code, description, display_order) VALUES
    ('Active', 'Contract is active and in good standing', 1),
    ('Under Implementation', 'Contract work is in progress', 2),
    ('Delayed', 'Contract is behind schedule', 3),
    ('Completed', 'Contract has been completed', 4),
    ('Terminated', 'Contract was terminated early', 5),
    ('Suspended', 'Contract is temporarily suspended', 6)
ON CONFLICT (code) DO NOTHING;

-- Contract Awards Table
CREATE TABLE IF NOT EXISTS contract_awards (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tender_id UUID UNIQUE NOT NULL REFERENCES tenders(id),
    contractor_id UUID NOT NULL REFERENCES contractors(id),
    award_date DATE NOT NULL,
    contract_value NUMERIC(15,2) NOT NULL,
    currency TEXT NOT NULL DEFAULT 'PGK' CHECK (currency IN ('PGK', 'USD', 'AUD')),
    contract_no TEXT UNIQUE,
    commencement_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status TEXT NOT NULL DEFAULT 'Active' REFERENCES contract_status_codes(code),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Contract Milestones Table
CREATE TABLE IF NOT EXISTS contract_milestones (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    contract_award_id UUID NOT NULL REFERENCES contract_awards(id) ON DELETE CASCADE,
    milestone_name TEXT NOT NULL,
    milestone_no INT NOT NULL,
    due_date DATE NOT NULL,
    completion_date DATE,
    status TEXT NOT NULL DEFAULT 'Not Started' CHECK (status IN ('Not Started', 'In Progress', 'Completed', 'Overdue')),
    deliverable_doc_id UUID REFERENCES tender_documents(id),
    payment_percentage NUMERIC(5,2),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Contract Variations Table
CREATE TABLE IF NOT EXISTS contract_variations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    contract_award_id UUID NOT NULL REFERENCES contract_awards(id) ON DELETE CASCADE,
    variation_no INT NOT NULL,
    variation_date DATE NOT NULL,
    value_delta NUMERIC(15,2) NOT NULL DEFAULT 0,
    time_extension_days INT NOT NULL DEFAULT 0,
    reason TEXT NOT NULL,
    approved_by UUID REFERENCES officers(id),
    approval_ref TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Contract Issues and Risks Table
CREATE TABLE IF NOT EXISTS contract_issues_risks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    contract_award_id UUID NOT NULL REFERENCES contract_awards(id) ON DELETE CASCADE,
    type TEXT NOT NULL CHECK (type IN ('Issue', 'Risk')),
    severity TEXT NOT NULL CHECK (severity IN ('Low', 'Medium', 'High', 'Critical')),
    description TEXT NOT NULL,
    owner_officer_id UUID REFERENCES officers(id),
    opened_date DATE NOT NULL DEFAULT CURRENT_DATE,
    closed_date DATE,
    resolution TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Contractor Performance Reviews Table
CREATE TABLE IF NOT EXISTS contractor_performance_reviews (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    contract_award_id UUID NOT NULL REFERENCES contract_awards(id) ON DELETE CASCADE,
    review_date DATE NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    quality_score NUMERIC(5,2),
    timeliness_score NUMERIC(5,2),
    compliance_score NUMERIC(5,2),
    narrative_feedback TEXT,
    recommended_action TEXT CHECK (recommended_action IN ('Continue', 'Watchlist', 'Suspend', 'Debar')),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- INDEXES FOR PERFORMANCE
-- ============================================

CREATE INDEX IF NOT EXISTS idx_tenders_agency ON tenders(agency_id);
CREATE INDEX IF NOT EXISTS idx_tenders_status ON tenders(status_code);
CREATE INDEX IF NOT EXISTS idx_tenders_officer ON tenders(officer_id);
CREATE INDEX IF NOT EXISTS idx_tenders_closing ON tenders(closing_datetime);

CREATE INDEX IF NOT EXISTS idx_bids_tender ON bids(tender_id);
CREATE INDEX IF NOT EXISTS idx_bids_contractor ON bids(contractor_id);

CREATE INDEX IF NOT EXISTS idx_contract_awards_tender ON contract_awards(tender_id);
CREATE INDEX IF NOT EXISTS idx_contract_awards_contractor ON contract_awards(contractor_id);
CREATE INDEX IF NOT EXISTS idx_contract_awards_status ON contract_awards(status);

CREATE INDEX IF NOT EXISTS idx_milestones_contract ON contract_milestones(contract_award_id);
CREATE INDEX IF NOT EXISTS idx_milestones_status ON contract_milestones(status);
CREATE INDEX IF NOT EXISTS idx_milestones_due ON contract_milestones(due_date);

CREATE INDEX IF NOT EXISTS idx_issues_contract ON contract_issues_risks(contract_award_id);
CREATE INDEX IF NOT EXISTS idx_issues_severity ON contract_issues_risks(severity);

CREATE INDEX IF NOT EXISTS idx_workflow_tender ON tender_workflow_events(tender_id);
CREATE INDEX IF NOT EXISTS idx_workflow_type ON tender_workflow_events(event_type);

-- ============================================
-- ROW LEVEL SECURITY (RLS) POLICIES
-- ============================================

-- Enable RLS on all tables
ALTER TABLE agencies ENABLE ROW LEVEL SECURITY;
ALTER TABLE officers ENABLE ROW LEVEL SECURITY;
ALTER TABLE contractors ENABLE ROW LEVEL SECURITY;
ALTER TABLE tenders ENABLE ROW LEVEL SECURITY;
ALTER TABLE tender_workflow_events ENABLE ROW LEVEL SECURITY;
ALTER TABLE tender_documents ENABLE ROW LEVEL SECURITY;
ALTER TABLE approvals ENABLE ROW LEVEL SECURITY;
ALTER TABLE bids ENABLE ROW LEVEL SECURITY;
ALTER TABLE contract_awards ENABLE ROW LEVEL SECURITY;
ALTER TABLE contract_milestones ENABLE ROW LEVEL SECURITY;
ALTER TABLE contract_variations ENABLE ROW LEVEL SECURITY;
ALTER TABLE contract_issues_risks ENABLE ROW LEVEL SECURITY;

-- Helper function to get current user's officer record
CREATE OR REPLACE FUNCTION get_current_officer()
RETURNS UUID AS $$
BEGIN
    RETURN (
        SELECT id FROM officers
        WHERE auth_user_id = auth.uid()
        LIMIT 1
    );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Helper function to get current user's role
CREATE OR REPLACE FUNCTION get_current_role()
RETURNS TEXT AS $$
BEGIN
    RETURN (
        SELECT role FROM officers
        WHERE auth_user_id = auth.uid()
        LIMIT 1
    );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Admin can do everything
DROP POLICY IF EXISTS admin_all ON tenders;
CREATE POLICY admin_all ON tenders
    FOR ALL USING (get_current_role() = 'Admin');

-- Management can view all, but not modify Awarded status
DROP POLICY IF EXISTS management_select ON tenders;
CREATE POLICY management_select ON tenders
    FOR SELECT USING (get_current_role() IN ('Admin', 'Management'));

-- Procurement officers can manage within their agency
DROP POLICY IF EXISTS officer_agency_tenders ON tenders;
CREATE POLICY officer_agency_tenders ON tenders
    FOR ALL USING (
        get_current_role() = 'Procurement Officer' AND
        agency_id = (SELECT agency_id FROM officers WHERE id = get_current_officer())
    );

-- Viewers and Auditors can only read
DROP POLICY IF EXISTS viewer_read ON tenders;
CREATE POLICY viewer_read ON tenders
    FOR SELECT USING (get_current_role() IN ('Viewer', 'Auditor'));

-- Workflow events are append-only (no update/delete for audit integrity)
DROP POLICY IF EXISTS workflow_insert_only ON tender_workflow_events;
CREATE POLICY workflow_insert_only ON tender_workflow_events
    FOR INSERT WITH CHECK (TRUE);

DROP POLICY IF EXISTS workflow_select ON tender_workflow_events;
CREATE POLICY workflow_select ON tender_workflow_events
    FOR SELECT USING (TRUE);

-- ============================================
-- USEFUL VIEWS FOR REPORTING
-- ============================================

-- Pipeline Summary View
CREATE OR REPLACE VIEW v_tender_pipeline AS
SELECT
    status_code,
    COUNT(*) as tender_count,
    COALESCE(SUM(estimated_value), 0) as total_estimated_value
FROM tenders
GROUP BY status_code
ORDER BY (SELECT display_order FROM tender_status_codes WHERE code = status_code);

-- Agency Spend Summary View
CREATE OR REPLACE VIEW v_agency_spend AS
SELECT
    a.id as agency_id,
    a.name as agency_name,
    a.abbreviation,
    COUNT(ca.id) as contract_count,
    COALESCE(SUM(ca.contract_value), 0) as total_contract_value
FROM agencies a
LEFT JOIN tenders t ON t.agency_id = a.id
LEFT JOIN contract_awards ca ON ca.tender_id = t.id
GROUP BY a.id, a.name, a.abbreviation
ORDER BY total_contract_value DESC;

-- Contractor Performance Summary View
CREATE OR REPLACE VIEW v_contractor_performance AS
SELECT
    c.id as contractor_id,
    c.legal_name,
    c.trading_name,
    c.status,
    COUNT(ca.id) as contract_count,
    COALESCE(SUM(ca.contract_value), 0) as total_awarded_value,
    COALESCE(AVG(cpr.rating), 0) as avg_rating
FROM contractors c
LEFT JOIN contract_awards ca ON ca.contractor_id = c.id
LEFT JOIN contractor_performance_reviews cpr ON cpr.contract_award_id = ca.id
GROUP BY c.id, c.legal_name, c.trading_name, c.status
ORDER BY total_awarded_value DESC;

-- Overdue Milestones View
CREATE OR REPLACE VIEW v_overdue_milestones AS
SELECT
    cm.*,
    ca.contract_no,
    t.project_title,
    c.legal_name as contractor_name,
    c.trading_name as contractor_trading_name
FROM contract_milestones cm
JOIN contract_awards ca ON ca.id = cm.contract_award_id
JOIN tenders t ON t.id = ca.tender_id
JOIN contractors c ON c.id = ca.contractor_id
WHERE cm.status = 'Overdue' OR (cm.status != 'Completed' AND cm.due_date < CURRENT_DATE)
ORDER BY cm.due_date;

-- High Priority Issues View
CREATE OR REPLACE VIEW v_high_priority_issues AS
SELECT
    cir.*,
    ca.contract_no,
    t.project_title,
    c.legal_name as contractor_name,
    o.full_name as owner_name
FROM contract_issues_risks cir
JOIN contract_awards ca ON ca.id = cir.contract_award_id
JOIN tenders t ON t.id = ca.tender_id
JOIN contractors c ON c.id = ca.contractor_id
LEFT JOIN officers o ON o.id = cir.owner_officer_id
WHERE cir.severity IN ('High', 'Critical') AND cir.closed_date IS NULL
ORDER BY
    CASE cir.severity WHEN 'Critical' THEN 1 WHEN 'High' THEN 2 END,
    cir.opened_date;

-- ============================================
-- TRIGGERS FOR UPDATED_AT
-- ============================================

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS update_tenders_updated_at ON tenders;
CREATE TRIGGER update_tenders_updated_at
    BEFORE UPDATE ON tenders
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

DROP TRIGGER IF EXISTS update_contract_awards_updated_at ON contract_awards;
CREATE TRIGGER update_contract_awards_updated_at
    BEFORE UPDATE ON contract_awards
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

DROP TRIGGER IF EXISTS update_contract_milestones_updated_at ON contract_milestones;
CREATE TRIGGER update_contract_milestones_updated_at
    BEFORE UPDATE ON contract_milestones
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

DROP TRIGGER IF EXISTS update_contract_issues_updated_at ON contract_issues_risks;
CREATE TRIGGER update_contract_issues_updated_at
    BEFORE UPDATE ON contract_issues_risks
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

DROP TRIGGER IF EXISTS update_contractors_updated_at ON contractors;
CREATE TRIGGER update_contractors_updated_at
    BEFORE UPDATE ON contractors
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

DROP TRIGGER IF EXISTS update_officers_updated_at ON officers;
CREATE TRIGGER update_officers_updated_at
    BEFORE UPDATE ON officers
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- SEED DATA - STATUS CODES ARE ALREADY INSERTED
-- Add more reference data as needed
-- ============================================

-- Sample Funding Sources (only insert if table is empty)
INSERT INTO funding_sources (name, donor_name, program_code)
SELECT * FROM (VALUES
    ('GoPNG', NULL::TEXT, 'GOPNG-2026'),
    ('Own Source Revenue', NULL::TEXT, NULL::TEXT),
    ('World Bank', 'World Bank', 'WB-PNG-2026'),
    ('ADB', 'Asian Development Bank', 'ADB-PNG-2026'),
    ('DFAT Australia', 'Australian Government', 'DFAT-PNG-2026'),
    ('JICA', 'Japan International Cooperation Agency', 'JICA-PNG-2026'),
    ('EU Grant', 'European Union', 'EU-PNG-2026')
) AS v(name, donor_name, program_code)
WHERE NOT EXISTS (SELECT 1 FROM funding_sources LIMIT 1);
