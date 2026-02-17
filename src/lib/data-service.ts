/**
 * Data Service Layer - Fetches all data from Supabase
 * Replaces mock-data.ts with real database queries
 */

import { supabase } from './supabase/client';
import type {
  Agency,
  Officer,
  FundingSource,
  Contractor,
  Tender,
  ContractAward,
  ContractMilestone,
  ContractVariation,
  ContractIssueRisk,
  Approval,
  Bid,
  PipelineStats,
  PortfolioSummary,
  AgencySpend,
  ContractorAwardSummary,
  MonthlyTrend,
  TenderStatusCode,
} from './types';

// ============================================
// AGENCIES
// ============================================

export async function getAgencies(): Promise<Agency[]> {
  const { data, error } = await supabase
    .from('agencies')
    .select('*')
    .order('name');

  if (error) {
    console.error('Error fetching agencies:', error);
    return [];
  }
  return data || [];
}

export async function getAgencyById(id: string): Promise<Agency | null> {
  const { data, error } = await supabase
    .from('agencies')
    .select('*')
    .eq('id', id)
    .single();

  if (error) {
    console.error('Error fetching agency:', error);
    return null;
  }
  return data;
}

// ============================================
// OFFICERS
// ============================================

export async function getOfficers(): Promise<Officer[]> {
  const { data, error } = await supabase
    .from('officers')
    .select('*, agency:agencies(*)')
    .order('full_name');

  if (error) {
    console.error('Error fetching officers:', error);
    return [];
  }
  return data || [];
}

export async function getOfficerById(id: string): Promise<Officer | null> {
  const { data, error } = await supabase
    .from('officers')
    .select('*, agency:agencies(*)')
    .eq('id', id)
    .single();

  if (error) {
    console.error('Error fetching officer:', error);
    return null;
  }
  return data;
}

// ============================================
// FUNDING SOURCES
// ============================================

export async function getFundingSources(): Promise<FundingSource[]> {
  const { data, error } = await supabase
    .from('funding_sources')
    .select('*')
    .order('name');

  if (error) {
    console.error('Error fetching funding sources:', error);
    return [];
  }
  return data || [];
}

// ============================================
// CONTRACTORS
// ============================================

export async function getContractors(): Promise<Contractor[]> {
  const { data, error } = await supabase
    .from('contractors')
    .select('*')
    .order('legal_name');

  if (error) {
    console.error('Error fetching contractors:', error);
    return [];
  }
  return data || [];
}

export async function getContractorById(id: string): Promise<Contractor | null> {
  const { data, error } = await supabase
    .from('contractors')
    .select('*')
    .eq('id', id)
    .single();

  if (error) {
    console.error('Error fetching contractor:', error);
    return null;
  }
  return data;
}

// ============================================
// TENDERS
// ============================================

export async function getTenders(): Promise<Tender[]> {
  const { data, error } = await supabase
    .from('tenders')
    .select(`
      *,
      agency:agencies(*),
      funding_source:funding_sources(*),
      officer:officers(*)
    `)
    .order('created_at', { ascending: false });

  if (error) {
    console.error('Error fetching tenders:', error);
    return [];
  }
  return data || [];
}

export async function getTenderById(id: string): Promise<Tender | null> {
  const { data, error } = await supabase
    .from('tenders')
    .select(`
      *,
      agency:agencies(*),
      funding_source:funding_sources(*),
      officer:officers(*)
    `)
    .eq('id', id)
    .single();

  if (error) {
    console.error('Error fetching tender:', error);
    return null;
  }
  return data;
}

export async function getTenderByTenderNo(tenderNo: string): Promise<Tender | null> {
  const { data, error } = await supabase
    .from('tenders')
    .select(`
      *,
      agency:agencies(*),
      funding_source:funding_sources(*),
      officer:officers(*)
    `)
    .eq('tender_no', tenderNo)
    .single();

  if (error) {
    console.error('Error fetching tender:', error);
    return null;
  }
  return data;
}

// ============================================
// CONTRACT AWARDS
// ============================================

export async function getContractAwards(): Promise<ContractAward[]> {
  const { data, error } = await supabase
    .from('contract_awards')
    .select(`
      *,
      tender:tenders(*, agency:agencies(*)),
      contractor:contractors(*)
    `)
    .order('award_date', { ascending: false });

  if (error) {
    console.error('Error fetching contract awards:', error);
    return [];
  }
  return data || [];
}

export async function getContractAwardById(id: string): Promise<ContractAward | null> {
  const { data, error } = await supabase
    .from('contract_awards')
    .select(`
      *,
      tender:tenders(*, agency:agencies(*), funding_source:funding_sources(*)),
      contractor:contractors(*)
    `)
    .eq('id', id)
    .single();

  if (error) {
    console.error('Error fetching contract award:', error);
    return null;
  }
  return data;
}

export async function getContractAwardByTenderId(tenderId: string): Promise<ContractAward | null> {
  const { data, error } = await supabase
    .from('contract_awards')
    .select(`
      *,
      tender:tenders(*),
      contractor:contractors(*)
    `)
    .eq('tender_id', tenderId)
    .single();

  if (error) {
    // Not an error if no contract exists yet
    return null;
  }
  return data;
}

// ============================================
// CONTRACT MILESTONES
// ============================================

export async function getMilestones(): Promise<ContractMilestone[]> {
  const { data, error } = await supabase
    .from('contract_milestones')
    .select('*')
    .order('due_date');

  if (error) {
    console.error('Error fetching milestones:', error);
    return [];
  }
  return data || [];
}

export async function getMilestonesByContractId(contractId: string): Promise<ContractMilestone[]> {
  const { data, error } = await supabase
    .from('contract_milestones')
    .select('*')
    .eq('contract_award_id', contractId)
    .order('milestone_no');

  if (error) {
    console.error('Error fetching milestones:', error);
    return [];
  }
  return data || [];
}

// ============================================
// CONTRACT VARIATIONS
// ============================================

export async function getVariationsByContractId(contractId: string): Promise<ContractVariation[]> {
  const { data, error } = await supabase
    .from('contract_variations')
    .select('*')
    .eq('contract_award_id', contractId)
    .order('variation_no');

  if (error) {
    console.error('Error fetching variations:', error);
    return [];
  }
  return data || [];
}

// ============================================
// CONTRACT ISSUES/RISKS
// ============================================

export async function getIssuesRisks(): Promise<ContractIssueRisk[]> {
  const { data, error } = await supabase
    .from('contract_issues_risks')
    .select('*, owner_officer:officers(*)')
    .order('opened_date', { ascending: false });

  if (error) {
    console.error('Error fetching issues/risks:', error);
    return [];
  }
  return data || [];
}

export async function getIssuesByContractId(contractId: string): Promise<ContractIssueRisk[]> {
  const { data, error } = await supabase
    .from('contract_issues_risks')
    .select('*, owner_officer:officers(*)')
    .eq('contract_award_id', contractId)
    .order('opened_date', { ascending: false });

  if (error) {
    console.error('Error fetching issues:', error);
    return [];
  }
  return data || [];
}

// ============================================
// APPROVALS
// ============================================

export async function getApprovals(): Promise<Approval[]> {
  const { data, error } = await supabase
    .from('approvals')
    .select('*, tender:tenders(*)')
    .order('approval_date', { ascending: false });

  if (error) {
    console.error('Error fetching approvals:', error);
    return [];
  }
  return data || [];
}

export async function getApprovalsByTenderId(tenderId: string): Promise<Approval[]> {
  const { data, error } = await supabase
    .from('approvals')
    .select('*')
    .eq('tender_id', tenderId)
    .order('approval_date', { ascending: false });

  if (error) {
    console.error('Error fetching approvals:', error);
    return [];
  }
  return data || [];
}

// ============================================
// BIDS
// ============================================

export async function getBidsByTenderId(tenderId: string): Promise<Bid[]> {
  const { data, error } = await supabase
    .from('bids')
    .select('*, contractor:contractors(*)')
    .eq('tender_id', tenderId)
    .order('bid_price');

  if (error) {
    console.error('Error fetching bids:', error);
    return [];
  }
  return data || [];
}

// ============================================
// WORKFLOW EVENTS
// ============================================

export async function getWorkflowEventsByTenderId(tenderId: string) {
  const { data, error } = await supabase
    .from('tender_workflow_events')
    .select('*, actor_officer:officers(*)')
    .eq('tender_id', tenderId)
    .order('event_datetime', { ascending: false });

  if (error) {
    console.error('Error fetching workflow events:', error);
    return [];
  }
  return data || [];
}

// ============================================
// DASHBOARD STATISTICS
// ============================================

export async function getPipelineStats(): Promise<PipelineStats> {
  const { data, error } = await supabase
    .from('tenders')
    .select('status_code');

  if (error) {
    console.error('Error fetching pipeline stats:', error);
    return {
      draft: 0,
      issued: 0,
      active: 0,
      closed: 0,
      evaluation: 0,
      approval: 0,
      approved: 0,
      awarded: 0,
    };
  }

  const stats: PipelineStats = {
    draft: 0,
    issued: 0,
    active: 0,
    closed: 0,
    evaluation: 0,
    approval: 0,
    approved: 0,
    awarded: 0,
  };

  (data || []).forEach((tender) => {
    const status = tender.status_code as TenderStatusCode;
    switch (status) {
      case 'Draft':
        stats.draft++;
        break;
      case 'Issued':
        stats.issued++;
        break;
      case 'Active':
        stats.active++;
        break;
      case 'Closed':
        stats.closed++;
        break;
      case 'Evaluation':
        stats.evaluation++;
        break;
      case 'Submitted for Approval':
        stats.approval++;
        break;
      case 'Approved':
        stats.approved++;
        break;
      case 'Awarded':
        stats.awarded++;
        break;
    }
  });

  return stats;
}

export async function getPortfolioSummary(): Promise<PortfolioSummary> {
  // Get tender count
  const { count: tenderCount } = await supabase
    .from('tenders')
    .select('*', { count: 'exact', head: true });

  // Get contract awards with values
  const { data: contracts } = await supabase
    .from('contract_awards')
    .select('contract_value, status');

  // Get contractor count
  const { count: contractorCount } = await supabase
    .from('contractors')
    .select('*', { count: 'exact', head: true });

  // Get agency count
  const { count: agencyCount } = await supabase
    .from('agencies')
    .select('*', { count: 'exact', head: true });

  const totalAwardedValue = (contracts || []).reduce((sum, c) => sum + (Number(c.contract_value) || 0), 0);
  const activeContracts = (contracts || []).filter((c) => c.status === 'Active' || c.status === 'Under Implementation').length;
  const completedContracts = (contracts || []).filter((c) => c.status === 'Completed').length;

  return {
    total_tenders: tenderCount || 0,
    total_awarded_value: totalAwardedValue,
    active_contracts: activeContracts,
    completed_contracts: completedContracts,
    contractors_count: contractorCount || 0,
    agencies_count: agencyCount || 0,
  };
}

export async function getAgencySpend(): Promise<AgencySpend[]> {
  const { data, error } = await supabase
    .from('contract_awards')
    .select(`
      contract_value,
      tender:tenders(agency:agencies(name, abbreviation))
    `);

  if (error) {
    console.error('Error fetching agency spend:', error);
    return [];
  }

  // Aggregate by agency
  const agencyMap = new Map<string, { name: string; abbreviation: string; total: number; count: number }>();

  (data || []).forEach((contract: any) => {
    const agency = contract.tender?.agency;
    if (agency) {
      const key = agency.name;
      const existing = agencyMap.get(key) || {
        name: agency.name,
        abbreviation: agency.abbreviation || '',
        total: 0,
        count: 0,
      };
      existing.total += Number(contract.contract_value) || 0;
      existing.count++;
      agencyMap.set(key, existing);
    }
  });

  return Array.from(agencyMap.values())
    .map((a) => ({
      agency_name: a.name,
      abbreviation: a.abbreviation,
      total_value: a.total,
      contract_count: a.count,
    }))
    .sort((a, b) => b.total_value - a.total_value)
    .slice(0, 10);
}

export async function getContractorAwardSummary(): Promise<ContractorAwardSummary[]> {
  const { data, error } = await supabase
    .from('contract_awards')
    .select(`
      contract_value,
      contractor:contractors(legal_name, trading_name)
    `);

  if (error) {
    console.error('Error fetching contractor awards:', error);
    return [];
  }

  // Aggregate by contractor
  const contractorMap = new Map<string, { name: string; total: number; count: number }>();

  (data || []).forEach((contract: any) => {
    const contractor = contract.contractor;
    if (contractor) {
      const name = contractor.trading_name || contractor.legal_name;
      const existing = contractorMap.get(name) || { name, total: 0, count: 0 };
      existing.total += Number(contract.contract_value) || 0;
      existing.count++;
      contractorMap.set(name, existing);
    }
  });

  return Array.from(contractorMap.values())
    .map((c) => ({
      contractor_name: c.name,
      total_awarded: c.total,
      contract_count: c.count,
      avg_rating: 4.0, // Default rating, would come from performance reviews
    }))
    .sort((a, b) => b.total_awarded - a.total_awarded)
    .slice(0, 10);
}

export async function getMonthlyTrends(): Promise<MonthlyTrend[]> {
  // Get last 6 months of tender data
  const sixMonthsAgo = new Date();
  sixMonthsAgo.setMonth(sixMonthsAgo.getMonth() - 6);

  const { data: tenders } = await supabase
    .from('tenders')
    .select('issued_date, closing_datetime, status_code')
    .gte('issued_date', sixMonthsAgo.toISOString().split('T')[0]);

  const { data: contracts } = await supabase
    .from('contract_awards')
    .select('award_date, contract_value')
    .gte('award_date', sixMonthsAgo.toISOString().split('T')[0]);

  // Group by month
  const monthMap = new Map<string, MonthlyTrend>();

  // Initialize last 6 months
  for (let i = 5; i >= 0; i--) {
    const date = new Date();
    date.setMonth(date.getMonth() - i);
    const monthKey = `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}`;
    monthMap.set(monthKey, { month: monthKey, issued: 0, closed: 0, awarded: 0, value_awarded: 0 });
  }

  // Count tenders
  (tenders || []).forEach((tender) => {
    if (tender.issued_date) {
      const monthKey = tender.issued_date.substring(0, 7);
      const existing = monthMap.get(monthKey);
      if (existing) {
        existing.issued++;
      }
    }
    if (tender.closing_datetime && tender.status_code === 'Closed') {
      const monthKey = tender.closing_datetime.substring(0, 7);
      const existing = monthMap.get(monthKey);
      if (existing) {
        existing.closed++;
      }
    }
  });

  // Count awards
  (contracts || []).forEach((contract) => {
    if (contract.award_date) {
      const monthKey = contract.award_date.substring(0, 7);
      const existing = monthMap.get(monthKey);
      if (existing) {
        existing.awarded++;
        existing.value_awarded += Number(contract.contract_value) || 0;
      }
    }
  });

  return Array.from(monthMap.values()).sort((a, b) => a.month.localeCompare(b.month));
}

// ============================================
// SIDEBAR COUNTS
// ============================================

export async function getSidebarCounts(): Promise<{
  tenders: number;
  contracts: number;
  pendingApprovals: number;
  issues: number;
}> {
  const [tendersResult, contractsResult, approvalsResult, issuesResult] = await Promise.all([
    supabase.from('tenders').select('status_code'),
    supabase.from('contract_awards').select('status').eq('status', 'Active'),
    supabase.from('tenders').select('id').eq('status_code', 'Submitted for Approval'),
    supabase.from('contract_issues_risks').select('id').is('closed_date', null),
  ]);

  // Count active tenders (not awarded or cancelled)
  const activeTenders = (tendersResult.data || []).filter(
    (t) => !['Awarded', 'Cancelled'].includes(t.status_code)
  ).length;

  return {
    tenders: activeTenders,
    contracts: contractsResult.data?.length || 0,
    pendingApprovals: approvalsResult.data?.length || 0,
    issues: issuesResult.data?.length || 0,
  };
}
