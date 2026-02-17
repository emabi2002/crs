'use client';

import { useEffect, useState } from 'react';
import { MainLayout } from '@/components/layout/main-layout';
import { StatsCard } from '@/components/ui/stats-card';
import { StatusBadge } from '@/components/ui/status-badge';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Progress } from '@/components/ui/progress';
import { Skeleton } from '@/components/ui/skeleton';
import {
  FileText,
  FileCheck,
  Building2,
  DollarSign,
  TrendingUp,
  AlertTriangle,
  Clock,
  ArrowRight,
} from 'lucide-react';
import {
  getPipelineStats,
  getPortfolioSummary,
  getAgencySpend,
  getContractorAwardSummary,
  getMonthlyTrends,
  getTenders,
  getContractAwards,
  getMilestones,
  getIssuesRisks,
} from '@/lib/data-service';
import type {
  PipelineStats,
  PortfolioSummary,
  AgencySpend,
  ContractorAwardSummary,
  MonthlyTrend,
  Tender,
  ContractAward,
  ContractMilestone,
  ContractIssueRisk,
} from '@/lib/types';
import Link from 'next/link';
import { Button } from '@/components/ui/button';
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  PieChart,
  Pie,
  Cell,
  LineChart,
  Line,
  Legend,
} from 'recharts';

const formatCurrency = (value: number) => {
  if (value >= 1000000) {
    return `K${(value / 1000000).toFixed(1)}M`;
  }
  if (value >= 1000) {
    return `K${(value / 1000).toFixed(0)}K`;
  }
  return `K${value}`;
};

const COLORS = ['#10b981', '#f59e0b', '#0ea5e9', '#a855f7', '#6366f1'];

function LoadingCard() {
  return (
    <Card>
      <CardHeader>
        <Skeleton className="h-4 w-32" />
        <Skeleton className="h-3 w-48" />
      </CardHeader>
      <CardContent>
        <Skeleton className="h-[200px] w-full" />
      </CardContent>
    </Card>
  );
}

export default function DashboardPage() {
  const [loading, setLoading] = useState(true);
  const [pipelineStats, setPipelineStats] = useState<PipelineStats | null>(null);
  const [portfolioSummary, setPortfolioSummary] = useState<PortfolioSummary | null>(null);
  const [agencySpend, setAgencySpend] = useState<AgencySpend[]>([]);
  const [contractorSummary, setContractorSummary] = useState<ContractorAwardSummary[]>([]);
  const [monthlyTrends, setMonthlyTrends] = useState<MonthlyTrend[]>([]);
  const [recentTenders, setRecentTenders] = useState<Tender[]>([]);
  const [contracts, setContracts] = useState<ContractAward[]>([]);
  const [milestones, setMilestones] = useState<ContractMilestone[]>([]);
  const [issues, setIssues] = useState<ContractIssueRisk[]>([]);

  useEffect(() => {
    async function fetchData() {
      try {
        const [
          statsData,
          summaryData,
          spendData,
          contractorData,
          trendsData,
          tendersData,
          contractsData,
          milestonesData,
          issuesData,
        ] = await Promise.all([
          getPipelineStats(),
          getPortfolioSummary(),
          getAgencySpend(),
          getContractorAwardSummary(),
          getMonthlyTrends(),
          getTenders(),
          getContractAwards(),
          getMilestones(),
          getIssuesRisks(),
        ]);

        setPipelineStats(statsData);
        setPortfolioSummary(summaryData);
        setAgencySpend(spendData);
        setContractorSummary(contractorData);
        setMonthlyTrends(trendsData);
        setRecentTenders(tendersData.slice(0, 5));
        setContracts(contractsData);
        setMilestones(milestonesData);
        setIssues(issuesData);
      } catch (error) {
        console.error('Error fetching dashboard data:', error);
      } finally {
        setLoading(false);
      }
    }

    fetchData();
  }, []);

  const pipelineData = pipelineStats
    ? [
        { name: 'Draft', count: pipelineStats.draft, color: '#9ca3af' },
        { name: 'Issued', count: pipelineStats.issued, color: '#0ea5e9' },
        { name: 'Active', count: pipelineStats.active, color: '#10b981' },
        { name: 'Closed', count: pipelineStats.closed, color: '#f59e0b' },
        { name: 'Evaluation', count: pipelineStats.evaluation, color: '#a855f7' },
        { name: 'Approval', count: pipelineStats.approval, color: '#6366f1' },
        { name: 'Approved', count: pipelineStats.approved, color: '#14b8a6' },
        { name: 'Awarded', count: pipelineStats.awarded, color: '#22c55e' },
      ]
    : [];

  const overdueMilestones = milestones.filter((m) => m.status === 'Overdue');
  const highRiskIssues = issues.filter((i) => i.severity === 'High' || i.severity === 'Critical');

  return (
    <MainLayout>
      <div className="space-y-6">
        {/* Page Header */}
        <div className="flex flex-col gap-2">
          <h1 className="text-2xl font-bold tracking-tight">Dashboard</h1>
          <p className="text-muted-foreground">
            Overview of procurement activities and contract performance
          </p>
        </div>

        {/* KPI Cards */}
        <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
          {loading ? (
            <>
              <Skeleton className="h-32" />
              <Skeleton className="h-32" />
              <Skeleton className="h-32" />
              <Skeleton className="h-32" />
            </>
          ) : (
            <>
              <StatsCard
                title="Total Portfolio Value"
                value={formatCurrency(portfolioSummary?.total_awarded_value || 0)}
                icon={DollarSign}
                iconColor="text-emerald-600"
              />
              <StatsCard
                title="Active Tenders"
                value={(pipelineStats?.active || 0) + (pipelineStats?.issued || 0)}
                icon={FileText}
                iconColor="text-blue-600"
                description="Open for submissions"
              />
              <StatsCard
                title="Active Contracts"
                value={portfolioSummary?.active_contracts || 0}
                icon={FileCheck}
                iconColor="text-primary"
              />
              <StatsCard
                title="Registered Contractors"
                value={portfolioSummary?.contractors_count || 0}
                icon={Building2}
                iconColor="text-amber-600"
              />
            </>
          )}
        </div>

        {/* Charts Row */}
        <div className="grid gap-6 lg:grid-cols-2">
          {loading ? (
            <>
              <LoadingCard />
              <LoadingCard />
            </>
          ) : (
            <>
              {/* Pipeline Status */}
              <Card>
                <CardHeader>
                  <CardTitle className="text-lg">Tender Pipeline</CardTitle>
                  <CardDescription>Current status distribution of all tenders</CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="h-[280px]">
                    {pipelineData.length > 0 ? (
                      <ResponsiveContainer width="100%" height="100%">
                        <BarChart data={pipelineData} layout="vertical">
                          <CartesianGrid strokeDasharray="3 3" horizontal={true} vertical={false} />
                          <XAxis type="number" />
                          <YAxis dataKey="name" type="category" width={80} tick={{ fontSize: 12 }} />
                          <Tooltip
                            contentStyle={{
                              backgroundColor: 'hsl(var(--card))',
                              border: '1px solid hsl(var(--border))',
                              borderRadius: '8px',
                            }}
                          />
                          <Bar dataKey="count" radius={[0, 4, 4, 0]}>
                            {pipelineData.map((entry, index) => (
                              <Cell key={`cell-${index}`} fill={entry.color} />
                            ))}
                          </Bar>
                        </BarChart>
                      </ResponsiveContainer>
                    ) : (
                      <div className="h-full flex items-center justify-center text-muted-foreground">
                        No tender data available
                      </div>
                    )}
                  </div>
                </CardContent>
              </Card>

              {/* Agency Spend Distribution */}
              <Card>
                <CardHeader>
                  <CardTitle className="text-lg">Spend by Agency</CardTitle>
                  <CardDescription>Contract value distribution across agencies</CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="h-[280px]">
                    {agencySpend.length > 0 ? (
                      <ResponsiveContainer width="100%" height="100%">
                        <PieChart>
                          <Pie
                            data={agencySpend}
                            cx="50%"
                            cy="50%"
                            innerRadius={60}
                            outerRadius={100}
                            paddingAngle={2}
                            dataKey="total_value"
                            nameKey="abbreviation"
                            label={(props: { abbreviation?: string; percent?: number }) =>
                              `${props.abbreviation || ''} ${((props.percent || 0) * 100).toFixed(0)}%`
                            }
                            labelLine={false}
                          >
                            {agencySpend.map((entry, index) => (
                              <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                            ))}
                          </Pie>
                          <Tooltip
                            formatter={(value) => formatCurrency(Number(value))}
                            contentStyle={{
                              backgroundColor: 'hsl(var(--card))',
                              border: '1px solid hsl(var(--border))',
                              borderRadius: '8px',
                            }}
                          />
                        </PieChart>
                      </ResponsiveContainer>
                    ) : (
                      <div className="h-full flex items-center justify-center text-muted-foreground">
                        No agency spend data available
                      </div>
                    )}
                  </div>
                </CardContent>
              </Card>
            </>
          )}
        </div>

        {/* Monthly Trends */}
        {loading ? (
          <LoadingCard />
        ) : (
          <Card>
            <CardHeader>
              <CardTitle className="text-lg">Monthly Activity Trends</CardTitle>
              <CardDescription>Tender issuance, closures, and awards over time</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="h-[300px]">
                {monthlyTrends.length > 0 ? (
                  <ResponsiveContainer width="100%" height="100%">
                    <LineChart data={monthlyTrends}>
                      <CartesianGrid strokeDasharray="3 3" />
                      <XAxis dataKey="month" tick={{ fontSize: 12 }} />
                      <YAxis tick={{ fontSize: 12 }} />
                      <Tooltip
                        contentStyle={{
                          backgroundColor: 'hsl(var(--card))',
                          border: '1px solid hsl(var(--border))',
                          borderRadius: '8px',
                        }}
                      />
                      <Legend />
                      <Line
                        type="monotone"
                        dataKey="issued"
                        stroke="#0ea5e9"
                        strokeWidth={2}
                        dot={{ r: 4 }}
                        name="Issued"
                      />
                      <Line
                        type="monotone"
                        dataKey="closed"
                        stroke="#f59e0b"
                        strokeWidth={2}
                        dot={{ r: 4 }}
                        name="Closed"
                      />
                      <Line
                        type="monotone"
                        dataKey="awarded"
                        stroke="#22c55e"
                        strokeWidth={2}
                        dot={{ r: 4 }}
                        name="Awarded"
                      />
                    </LineChart>
                  </ResponsiveContainer>
                ) : (
                  <div className="h-full flex items-center justify-center text-muted-foreground">
                    No trend data available
                  </div>
                )}
              </div>
            </CardContent>
          </Card>
        )}

        {/* Tables Row */}
        <div className="grid gap-6 lg:grid-cols-2">
          {/* Recent Tenders */}
          <Card>
            <CardHeader className="flex flex-row items-center justify-between">
              <div>
                <CardTitle className="text-lg">Recent Tenders</CardTitle>
                <CardDescription>Latest tender activities</CardDescription>
              </div>
              <Link href="/tenders">
                <Button variant="ghost" size="sm" className="gap-1">
                  View all <ArrowRight className="h-4 w-4" />
                </Button>
              </Link>
            </CardHeader>
            <CardContent>
              {loading ? (
                <div className="space-y-4">
                  {[1, 2, 3, 4, 5].map((i) => (
                    <Skeleton key={i} className="h-16" />
                  ))}
                </div>
              ) : recentTenders.length > 0 ? (
                <div className="space-y-4">
                  {recentTenders.map((tender) => (
                    <div
                      key={tender.id}
                      className="flex items-start justify-between gap-4 pb-4 border-b border-border last:border-0 last:pb-0"
                    >
                      <div className="space-y-1 min-w-0 flex-1">
                        <p className="font-medium text-sm truncate">{tender.project_title || tender.project_description?.substring(0, 50)}</p>
                        <p className="text-xs text-muted-foreground">
                          {tender.tender_no} | {(tender as any).agency?.abbreviation || (tender as any).agency?.name}
                        </p>
                      </div>
                      <StatusBadge status={tender.status_code} size="sm" />
                    </div>
                  ))}
                </div>
              ) : (
                <p className="text-sm text-muted-foreground py-8 text-center">No tenders found</p>
              )}
            </CardContent>
          </Card>

          {/* Top Contractors */}
          <Card>
            <CardHeader className="flex flex-row items-center justify-between">
              <div>
                <CardTitle className="text-lg">Top Contractors</CardTitle>
                <CardDescription>By total awarded value</CardDescription>
              </div>
              <Link href="/contractors">
                <Button variant="ghost" size="sm" className="gap-1">
                  View all <ArrowRight className="h-4 w-4" />
                </Button>
              </Link>
            </CardHeader>
            <CardContent>
              {loading ? (
                <div className="space-y-4">
                  {[1, 2, 3, 4].map((i) => (
                    <Skeleton key={i} className="h-16" />
                  ))}
                </div>
              ) : contractorSummary.length > 0 ? (
                <div className="space-y-4">
                  {contractorSummary.slice(0, 5).map((contractor, index) => (
                    <div
                      key={contractor.contractor_name}
                      className="flex items-center gap-4 pb-4 border-b border-border last:border-0 last:pb-0"
                    >
                      <div className="flex items-center justify-center w-8 h-8 rounded-full bg-muted font-semibold text-sm">
                        {index + 1}
                      </div>
                      <div className="flex-1 min-w-0">
                        <p className="font-medium text-sm truncate">{contractor.contractor_name}</p>
                        <p className="text-xs text-muted-foreground">
                          {contractor.contract_count} contracts
                        </p>
                      </div>
                      <div className="text-right">
                        <p className="font-semibold text-sm">{formatCurrency(contractor.total_awarded)}</p>
                        <div className="flex items-center gap-1 text-xs text-muted-foreground">
                          <TrendingUp className="h-3 w-3 text-amber-500" />
                          {contractor.avg_rating.toFixed(1)}
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              ) : (
                <p className="text-sm text-muted-foreground py-8 text-center">No contractor data found</p>
              )}
            </CardContent>
          </Card>
        </div>

        {/* Alerts and Milestones */}
        <div className="grid gap-6 lg:grid-cols-2">
          {/* Overdue Milestones */}
          <Card className="border-orange-200 bg-orange-50/30">
            <CardHeader className="flex flex-row items-center gap-2">
              <Clock className="h-5 w-5 text-orange-600" />
              <div>
                <CardTitle className="text-lg">Overdue Milestones</CardTitle>
                <CardDescription>Milestones requiring immediate attention</CardDescription>
              </div>
            </CardHeader>
            <CardContent>
              {loading ? (
                <div className="space-y-3">
                  {[1, 2, 3].map((i) => (
                    <Skeleton key={i} className="h-20" />
                  ))}
                </div>
              ) : overdueMilestones.length > 0 ? (
                <div className="space-y-3">
                  {overdueMilestones.slice(0, 5).map((milestone) => {
                    const contract = contracts.find((c) => c.id === milestone.contract_award_id);
                    return (
                      <div
                        key={milestone.id}
                        className="flex items-start justify-between gap-4 p-3 rounded-lg bg-white border border-orange-100"
                      >
                        <div className="space-y-1">
                          <p className="font-medium text-sm">{milestone.milestone_name}</p>
                          <p className="text-xs text-muted-foreground">
                            {(contract as any)?.contractor?.trading_name || (contract as any)?.contractor?.legal_name || 'Unknown contractor'}
                          </p>
                        </div>
                        <div className="text-right">
                          <StatusBadge status={milestone.status} size="sm" />
                          <p className="text-xs text-muted-foreground mt-1">Due: {milestone.due_date}</p>
                        </div>
                      </div>
                    );
                  })}
                </div>
              ) : (
                <p className="text-sm text-muted-foreground">No overdue milestones</p>
              )}
            </CardContent>
          </Card>

          {/* High Risk Issues */}
          <Card className="border-red-200 bg-red-50/30">
            <CardHeader className="flex flex-row items-center gap-2">
              <AlertTriangle className="h-5 w-5 text-red-600" />
              <div>
                <CardTitle className="text-lg">High Priority Issues</CardTitle>
                <CardDescription>Critical and high severity issues</CardDescription>
              </div>
            </CardHeader>
            <CardContent>
              {loading ? (
                <div className="space-y-3">
                  {[1, 2, 3].map((i) => (
                    <Skeleton key={i} className="h-20" />
                  ))}
                </div>
              ) : highRiskIssues.length > 0 ? (
                <div className="space-y-3">
                  {highRiskIssues.slice(0, 5).map((issue) => {
                    const contract = contracts.find((c) => c.id === issue.contract_award_id);
                    return (
                      <div
                        key={issue.id}
                        className="flex items-start justify-between gap-4 p-3 rounded-lg bg-white border border-red-100"
                      >
                        <div className="space-y-1 flex-1">
                          <p className="font-medium text-sm line-clamp-2">{issue.description}</p>
                          <p className="text-xs text-muted-foreground">
                            {(contract as any)?.contractor?.trading_name || (contract as any)?.contractor?.legal_name || 'Unknown contractor'}
                          </p>
                        </div>
                        <StatusBadge status={issue.severity} size="sm" />
                      </div>
                    );
                  })}
                </div>
              ) : (
                <p className="text-sm text-muted-foreground">No high priority issues</p>
              )}
            </CardContent>
          </Card>
        </div>

        {/* Contract Progress */}
        {loading ? (
          <LoadingCard />
        ) : contracts.length > 0 ? (
          <Card>
            <CardHeader>
              <CardTitle className="text-lg">Active Contract Progress</CardTitle>
              <CardDescription>Milestone completion status for active contracts</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-6">
                {contracts.slice(0, 4).map((contract) => {
                  const contractMilestones = milestones.filter(
                    (m) => m.contract_award_id === contract.id
                  );
                  const completedCount = contractMilestones.filter((m) => m.status === 'Completed').length;
                  const progress = contractMilestones.length > 0 ? (completedCount / contractMilestones.length) * 100 : 0;

                  return (
                    <div key={contract.id} className="space-y-2">
                      <div className="flex items-center justify-between">
                        <div>
                          <p className="font-medium text-sm">
                            {(contract as any).tender?.project_title || contract.contract_no}
                          </p>
                          <p className="text-xs text-muted-foreground">
                            {(contract as any).contractor?.trading_name || (contract as any).contractor?.legal_name}
                          </p>
                        </div>
                        <div className="flex items-center gap-3">
                          <StatusBadge status={contract.status} size="sm" />
                          <span className="text-sm font-medium">{progress.toFixed(0)}%</span>
                        </div>
                      </div>
                      <Progress value={progress} className="h-2" />
                      <div className="flex justify-between text-xs text-muted-foreground">
                        <span>
                          {completedCount} of {contractMilestones.length} milestones completed
                        </span>
                        <span>End: {contract.end_date}</span>
                      </div>
                    </div>
                  );
                })}
              </div>
            </CardContent>
          </Card>
        ) : null}
      </div>
    </MainLayout>
  );
}
