// ============================================
// CONTRACT REGISTRY SYSTEM - DATABASE TYPES
// ============================================

// Reference / Master Tables
export interface Agency {
  id: string;
  name: string;
  abbreviation?: string;
  level: 'National' | 'Provincial' | 'District';
  sector: string;
  created_at: string;
}

export interface Officer {
  id: string;
  full_name: string;
  email: string;
  phone?: string;
  agency_id: string;
  role: 'Admin' | 'Management' | 'Procurement Officer' | 'Viewer' | 'Auditor';
  created_at: string;
}

export interface FundingSource {
  id: string;
  name: string;
  donor_name?: string;
  program_code?: string;
}

export interface Contractor {
  id: string;
  legal_name: string;
  trading_name?: string;
  ipa_registration_no?: string;
  tax_id?: string;
  address: string;
  province: string;
  district?: string;
  contact_person: string;
  phone: string;
  email: string;
  status: 'Active' | 'Suspended' | 'Blacklisted';
  categories: ('Works' | 'Goods' | 'Services' | 'Consulting')[];
  created_at: string;
}

// Status Codes
export type TenderStatusCode =
  | 'Draft'
  | 'Issued'
  | 'Active'
  | 'Closed'
  | 'Evaluation'
  | 'Submitted for Approval'
  | 'Approved'
  | 'Awarded'
  | 'Cancelled'
  | 'On Hold';

export type ContractStatusCode =
  | 'Active'
  | 'Under Implementation'
  | 'Delayed'
  | 'Completed'
  | 'Terminated'
  | 'Suspended';

export type ProcurementMethod =
  | 'Open Tender'
  | 'Restricted Tender'
  | 'Single Source'
  | 'Request for Quotation'
  | 'Framework Agreement';

// Tender Lifecycle Tables
export interface Tender {
  id: string;
  tender_no: string;
  agency_id: string;
  agency?: Agency;
  issued_date: string;
  closing_datetime: string;
  procurement_method: ProcurementMethod;
  project_title?: string;
  project_description: string;
  estimated_value?: number;
  funding_source_id: string;
  funding_source?: FundingSource;
  status_code: TenderStatusCode;
  officer_id: string;
  officer?: Officer;
  created_by: string;
  updated_by: string;
  created_at: string;
  updated_at: string;
}

export type TenderEventType =
  | 'Issued'
  | 'Addendum'
  | 'Clarification'
  | 'Closed'
  | 'Evaluation Started'
  | 'Evaluation Completed'
  | 'Submitted to TFEC'
  | 'TFEC Approved'
  | 'Board Approved'
  | 'NEC Approved'
  | 'Awarded'
  | 'Cancelled';

export interface TenderWorkflowEvent {
  id: string;
  tender_id: string;
  event_type: TenderEventType;
  event_datetime: string;
  notes?: string;
  actor_officer_id: string;
  actor_officer?: Officer;
  attachment_id?: string;
}

export type DocumentType =
  | 'RFT'
  | 'Addendum'
  | 'Clarification'
  | 'Minutes'
  | 'Evaluation Report'
  | 'Board Paper'
  | 'Award Notice'
  | 'Contract'
  | 'Variation'
  | 'Milestone Report'
  | 'Invoice'
  | 'Certificate';

export interface TenderDocument {
  id: string;
  tender_id: string;
  doc_type: DocumentType;
  file_name: string;
  file_url: string;
  uploaded_by: string;
  uploaded_at: string;
}

export type ApprovalType = 'TFEC' | 'NPC Board' | 'NEC' | 'Agency Board' | 'Department Head';
export type ApprovalDecision = 'Approved' | 'Noted' | 'Deferred' | 'Rejected';

export interface Approval {
  id: string;
  tender_id: string;
  approval_type: ApprovalType;
  reference_no?: string;
  approval_date: string;
  decision: ApprovalDecision;
  notes?: string;
}

export interface APCCertificate {
  id: string;
  tender_id: string;
  cert_no: string;
  cert_date: string;
  certified_value: number;
  notes?: string;
}

// Bids and Evaluation
export interface Bid {
  id: string;
  tender_id: string;
  contractor_id: string;
  contractor?: Contractor;
  bid_price: number;
  received_datetime: string;
  is_compliant: boolean;
  notes?: string;
}

export type EvaluationType = 'Technical' | 'Financial' | 'Combined';

export interface Evaluation {
  id: string;
  tender_id: string;
  evaluation_type: EvaluationType;
  start_date: string;
  end_date?: string;
  outcome_summary?: string;
}

export interface EvaluationScore {
  id: string;
  evaluation_id: string;
  bid_id: string;
  criteria_code: string;
  score: number;
  max_score: number;
  comments?: string;
}

// Contract / Award Tables
export interface ContractAward {
  id: string;
  tender_id: string;
  tender?: Tender;
  contractor_id: string;
  contractor?: Contractor;
  award_date: string;
  contract_value: number;
  currency: 'PGK' | 'USD' | 'AUD';
  contract_no?: string;
  commencement_date: string;
  end_date: string;
  status: ContractStatusCode;
  created_at: string;
  updated_at: string;
}

export type MilestoneStatus = 'Not Started' | 'In Progress' | 'Completed' | 'Overdue';

export interface ContractMilestone {
  id: string;
  contract_award_id: string;
  milestone_name: string;
  milestone_no: number;
  due_date: string;
  completion_date?: string;
  status: MilestoneStatus;
  deliverable_doc_id?: string;
  payment_percentage?: number;
}

export interface ContractVariation {
  id: string;
  contract_award_id: string;
  variation_no: number;
  variation_date: string;
  value_delta: number;
  time_extension_days: number;
  reason: string;
  approved_by?: string;
  approval_ref?: string;
}

export type IssueRiskType = 'Issue' | 'Risk';
export type Severity = 'Low' | 'Medium' | 'High' | 'Critical';

export interface ContractIssueRisk {
  id: string;
  contract_award_id: string;
  type: IssueRiskType;
  severity: Severity;
  description: string;
  owner_officer_id?: string;
  owner_officer?: Officer;
  opened_date: string;
  closed_date?: string;
  resolution?: string;
}

export type PerformanceRating = 1 | 2 | 3 | 4 | 5;
export type RecommendedAction = 'Continue' | 'Watchlist' | 'Suspend' | 'Debar';

export interface ContractorPerformanceReview {
  id: string;
  contract_award_id: string;
  review_date: string;
  rating: PerformanceRating;
  quality_score?: number;
  timeliness_score?: number;
  compliance_score?: number;
  narrative_feedback?: string;
  recommended_action: RecommendedAction;
}

// Dashboard / Report Types
export interface PipelineStats {
  draft: number;
  issued: number;
  active: number;
  closed: number;
  evaluation: number;
  approval: number;
  approved: number;
  awarded: number;
}

export interface PortfolioSummary {
  total_tenders: number;
  total_awarded_value: number;
  active_contracts: number;
  completed_contracts: number;
  contractors_count: number;
  agencies_count: number;
}

export interface AgencySpend {
  agency_name: string;
  abbreviation: string;
  total_value: number;
  contract_count: number;
}

export interface ContractorAwardSummary {
  contractor_name: string;
  total_awarded: number;
  contract_count: number;
  avg_rating: number;
}

export interface MonthlyTrend {
  month: string;
  issued: number;
  closed: number;
  awarded: number;
  value_awarded: number;
}
