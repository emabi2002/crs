'use client';

import { useState, useEffect } from 'react';
import { MainLayout } from '@/components/layout/main-layout';
import { StatusBadge } from '@/components/ui/status-badge';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Progress } from '@/components/ui/progress';
import { Skeleton } from '@/components/ui/skeleton';
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select';
import {
  Search,
  Download,
  Eye,
  Calendar,
  Building2,
  DollarSign,
  TrendingUp,
  AlertTriangle,
  CheckCircle2,
  Clock,
} from 'lucide-react';
import {
  getContractAwards,
  getMilestonesByContractId,
  getVariationsByContractId,
  getIssuesByContractId,
} from '@/lib/data-service';
import type { ContractAward, ContractStatusCode, ContractMilestone, ContractVariation, ContractIssueRisk } from '@/lib/types';
import Link from 'next/link';

const formatCurrency = (value: number) => {
  if (value >= 1000000) {
    return `K${(value / 1000000).toFixed(1)}M`;
  }
  return `K${(value / 1000).toFixed(0)}K`;
};

const formatDate = (date: string | null | undefined) => {
  if (!date) return '-';
  return new Date(date).toLocaleDateString('en-GB', {
    day: '2-digit',
    month: 'short',
    year: 'numeric',
  });
};

const statusFilters: ContractStatusCode[] = [
  'Active',
  'Under Implementation',
  'Delayed',
  'Completed',
  'Terminated',
  'Suspended',
];

interface ContractWithDetails extends ContractAward {
  milestones: ContractMilestone[];
  variations: ContractVariation[];
  issues: ContractIssueRisk[];
}

export default function ContractsPage() {
  const [loading, setLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState('');
  const [statusFilter, setStatusFilter] = useState<string>('all');
  const [contracts, setContracts] = useState<ContractWithDetails[]>([]);

  useEffect(() => {
    async function fetchData() {
      try {
        const contractsData = await getContractAwards();

        // Fetch details for each contract
        const contractsWithDetails = await Promise.all(
          contractsData.map(async (contract) => {
            const [milestones, variations, issues] = await Promise.all([
              getMilestonesByContractId(contract.id),
              getVariationsByContractId(contract.id),
              getIssuesByContractId(contract.id),
            ]);
            return { ...contract, milestones, variations, issues };
          })
        );

        setContracts(contractsWithDetails);
      } catch (error) {
        console.error('Error fetching contracts data:', error);
      } finally {
        setLoading(false);
      }
    }
    fetchData();
  }, []);

  const filteredContracts = contracts.filter((contract) => {
    const matchesSearch =
      searchQuery === '' ||
      contract.contract_no?.toLowerCase().includes(searchQuery.toLowerCase()) ||
      (contract as any).tender?.project_title?.toLowerCase().includes(searchQuery.toLowerCase()) ||
      (contract as any).contractor?.legal_name.toLowerCase().includes(searchQuery.toLowerCase());

    const matchesStatus = statusFilter === 'all' || contract.status === statusFilter;

    return matchesSearch && matchesStatus;
  });

  const totalValue = filteredContracts.reduce((sum, c) => sum + (Number(c.contract_value) || 0), 0);
  const activeCount = contracts.filter((c) => c.status === 'Active' || c.status === 'Under Implementation').length;
  const delayedCount = contracts.filter((c) => c.status === 'Delayed').length;

  return (
    <MainLayout>
      <div className="space-y-6">
        {/* Page Header */}
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
          <div>
            <h1 className="text-2xl font-bold tracking-tight">Awards & Contracts</h1>
            <p className="text-muted-foreground">
              Track awarded contracts and monitor implementation
            </p>
          </div>
          <div className="flex items-center gap-2">
            <Button variant="outline" size="sm">
              <Download className="h-4 w-4 mr-2" />
              Export
            </Button>
          </div>
        </div>

        {/* Summary Stats */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          {loading ? (
            <>
              <Skeleton className="h-24" />
              <Skeleton className="h-24" />
              <Skeleton className="h-24" />
              <Skeleton className="h-24" />
            </>
          ) : (
            <>
              <Card>
                <CardContent className="pt-6">
                  <div className="flex items-center gap-4">
                    <div className="p-3 rounded-lg bg-primary/10">
                      <DollarSign className="h-6 w-6 text-primary" />
                    </div>
                    <div>
                      <p className="text-2xl font-bold">{formatCurrency(totalValue)}</p>
                      <p className="text-sm text-muted-foreground">Total Value</p>
                    </div>
                  </div>
                </CardContent>
              </Card>
              <Card>
                <CardContent className="pt-6">
                  <div className="flex items-center gap-4">
                    <div className="p-3 rounded-lg bg-emerald-100">
                      <CheckCircle2 className="h-6 w-6 text-emerald-600" />
                    </div>
                    <div>
                      <p className="text-2xl font-bold">{activeCount}</p>
                      <p className="text-sm text-muted-foreground">Active</p>
                    </div>
                  </div>
                </CardContent>
              </Card>
              <Card>
                <CardContent className="pt-6">
                  <div className="flex items-center gap-4">
                    <div className="p-3 rounded-lg bg-orange-100">
                      <Clock className="h-6 w-6 text-orange-600" />
                    </div>
                    <div>
                      <p className="text-2xl font-bold">{delayedCount}</p>
                      <p className="text-sm text-muted-foreground">Delayed</p>
                    </div>
                  </div>
                </CardContent>
              </Card>
              <Card>
                <CardContent className="pt-6">
                  <div className="flex items-center gap-4">
                    <div className="p-3 rounded-lg bg-blue-100">
                      <Building2 className="h-6 w-6 text-blue-600" />
                    </div>
                    <div>
                      <p className="text-2xl font-bold">{contracts.length}</p>
                      <p className="text-sm text-muted-foreground">Total Contracts</p>
                    </div>
                  </div>
                </CardContent>
              </Card>
            </>
          )}
        </div>

        {/* Filters */}
        <Card>
          <CardContent className="pt-6">
            <div className="flex flex-col md:flex-row gap-4">
              <div className="relative flex-1">
                <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                <Input
                  placeholder="Search by contract no, project, or contractor..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="pl-10"
                />
              </div>
              <Select value={statusFilter} onValueChange={setStatusFilter}>
                <SelectTrigger className="w-full md:w-[180px]">
                  <SelectValue placeholder="All Status" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Status</SelectItem>
                  {statusFilters.map((status) => (
                    <SelectItem key={status} value={status}>
                      {status}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
          </CardContent>
        </Card>

        {/* Contracts List */}
        <div className="space-y-4">
          {loading ? (
            Array.from({ length: 3 }).map((_, i) => (
              <Card key={i}>
                <CardContent className="p-6">
                  <Skeleton className="h-48" />
                </CardContent>
              </Card>
            ))
          ) : filteredContracts.length > 0 ? (
            filteredContracts.map((contract) => {
              const completedMilestones = contract.milestones.filter((m) => m.status === 'Completed').length;
              const overdueMilestones = contract.milestones.filter((m) => m.status === 'Overdue').length;
              const progress = contract.milestones.length > 0 ? (completedMilestones / contract.milestones.length) * 100 : 0;
              const totalVariationValue = contract.variations.reduce((sum, v) => sum + (Number(v.value_delta) || 0), 0);
              const highRiskIssues = contract.issues.filter((i) => i.severity === 'High' || i.severity === 'Critical').length;

              return (
                <Card key={contract.id} className="hover:shadow-md transition-shadow">
                  <CardContent className="p-6">
                    <div className="flex flex-col lg:flex-row lg:items-start gap-6">
                      {/* Main Info */}
                      <div className="flex-1 space-y-4">
                        <div className="flex items-start justify-between gap-4">
                          <div>
                            <div className="flex items-center gap-2 mb-1">
                              <h3 className="font-semibold text-lg">
                                {(contract as any).tender?.project_title || contract.contract_no}
                              </h3>
                              <StatusBadge status={contract.status} size="sm" />
                            </div>
                            <p className="text-sm text-muted-foreground">
                              {contract.contract_no} | {(contract as any).tender?.tender_no}
                            </p>
                          </div>
                          <Link href={`/contracts/${contract.id}`}>
                            <Button variant="outline" size="sm">
                              <Eye className="h-4 w-4 mr-2" />
                              View
                            </Button>
                          </Link>
                        </div>

                        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm">
                          <div>
                            <p className="text-muted-foreground">Contractor</p>
                            <p className="font-medium">
                              {(contract as any).contractor?.trading_name || (contract as any).contractor?.legal_name || 'N/A'}
                            </p>
                          </div>
                          <div>
                            <p className="text-muted-foreground">Contract Value</p>
                            <p className="font-semibold text-primary">
                              {formatCurrency(Number(contract.contract_value) || 0)}
                            </p>
                          </div>
                          <div>
                            <p className="text-muted-foreground">Start Date</p>
                            <p className="font-medium">{formatDate(contract.commencement_date)}</p>
                          </div>
                          <div>
                            <p className="text-muted-foreground">End Date</p>
                            <p className="font-medium">{formatDate(contract.end_date)}</p>
                          </div>
                        </div>

                        {/* Progress */}
                        <div className="space-y-2">
                          <div className="flex items-center justify-between text-sm">
                            <span className="text-muted-foreground">Milestone Progress</span>
                            <span className="font-medium">{progress.toFixed(0)}%</span>
                          </div>
                          <Progress value={progress} className="h-2" />
                          <div className="flex items-center gap-4 text-xs text-muted-foreground">
                            <span className="flex items-center gap-1">
                              <CheckCircle2 className="h-3 w-3 text-green-600" />
                              {completedMilestones} completed
                            </span>
                            {overdueMilestones > 0 && (
                              <span className="flex items-center gap-1 text-red-600">
                                <AlertTriangle className="h-3 w-3" />
                                {overdueMilestones} overdue
                              </span>
                            )}
                          </div>
                        </div>
                      </div>

                      {/* Stats Sidebar */}
                      <div className="lg:w-64 grid grid-cols-3 lg:grid-cols-1 gap-3">
                        <div className="p-3 rounded-lg bg-muted/50 border border-border">
                          <div className="flex items-center gap-2">
                            <Calendar className="h-4 w-4 text-muted-foreground" />
                            <span className="text-xs text-muted-foreground">Milestones</span>
                          </div>
                          <p className="mt-1 font-semibold">
                            {completedMilestones} / {contract.milestones.length}
                          </p>
                        </div>
                        <div className="p-3 rounded-lg bg-muted/50 border border-border">
                          <div className="flex items-center gap-2">
                            <TrendingUp className="h-4 w-4 text-muted-foreground" />
                            <span className="text-xs text-muted-foreground">Variations</span>
                          </div>
                          <p className="mt-1 font-semibold">
                            {contract.variations.length > 0 ? (
                              <span className={totalVariationValue > 0 ? 'text-amber-600' : ''}>
                                {totalVariationValue > 0 ? '+' : ''}
                                {formatCurrency(totalVariationValue)}
                              </span>
                            ) : (
                              'None'
                            )}
                          </p>
                        </div>
                        <div className="p-3 rounded-lg bg-muted/50 border border-border">
                          <div className="flex items-center gap-2">
                            <AlertTriangle className="h-4 w-4 text-muted-foreground" />
                            <span className="text-xs text-muted-foreground">Issues/Risks</span>
                          </div>
                          <p className="mt-1 font-semibold">
                            {contract.issues.length > 0 ? (
                              <span className={highRiskIssues > 0 ? 'text-red-600' : ''}>
                                {contract.issues.length} ({highRiskIssues} high)
                              </span>
                            ) : (
                              'None'
                            )}
                          </p>
                        </div>
                      </div>
                    </div>
                  </CardContent>
                </Card>
              );
            })
          ) : (
            <Card>
              <CardContent className="py-12 text-center text-muted-foreground">
                No contracts found matching your criteria
              </CardContent>
            </Card>
          )}
        </div>
      </div>
    </MainLayout>
  );
}
