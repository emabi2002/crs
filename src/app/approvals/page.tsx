'use client';

import { useState, useEffect } from 'react';
import { MainLayout } from '@/components/layout/main-layout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Badge } from '@/components/ui/badge';
import { Skeleton } from '@/components/ui/skeleton';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table';
import {
  Search,
  Download,
  CheckCircle2,
  XCircle,
  Clock,
  AlertCircle,
  FileText,
  Eye,
  Calendar,
} from 'lucide-react';
import { getApprovals, getTenders } from '@/lib/data-service';
import type { Approval, ApprovalDecision, Tender } from '@/lib/types';

const formatDate = (date: string | null | undefined) => {
  if (!date) return '-';
  return new Date(date).toLocaleDateString('en-GB', {
    day: '2-digit',
    month: 'short',
    year: 'numeric',
  });
};

const getDecisionIcon = (decision: ApprovalDecision) => {
  switch (decision) {
    case 'Approved':
      return <CheckCircle2 className="h-4 w-4 text-green-600" />;
    case 'Rejected':
      return <XCircle className="h-4 w-4 text-red-600" />;
    case 'Deferred':
      return <Clock className="h-4 w-4 text-amber-600" />;
    case 'Noted':
      return <AlertCircle className="h-4 w-4 text-blue-600" />;
    default:
      return null;
  }
};

const getDecisionColor = (decision: ApprovalDecision) => {
  switch (decision) {
    case 'Approved':
      return 'bg-green-100 text-green-700 border-green-200';
    case 'Rejected':
      return 'bg-red-100 text-red-700 border-red-200';
    case 'Deferred':
      return 'bg-amber-100 text-amber-700 border-amber-200';
    case 'Noted':
      return 'bg-blue-100 text-blue-700 border-blue-200';
    default:
      return 'bg-gray-100 text-gray-700 border-gray-200';
  }
};

interface EnrichedApproval extends Approval {
  tender?: Tender;
}

export default function ApprovalsPage() {
  const [loading, setLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState('');
  const [activeTab, setActiveTab] = useState<string>('all');
  const [approvals, setApprovals] = useState<EnrichedApproval[]>([]);
  const [pendingTenders, setPendingTenders] = useState<Tender[]>([]);

  useEffect(() => {
    async function fetchData() {
      try {
        const [approvalsData, tendersData] = await Promise.all([
          getApprovals(),
          getTenders(),
        ]);

        // Enrich approvals with tender info
        const enriched = approvalsData.map((approval) => {
          const tender = tendersData.find((t) => t.id === approval.tender_id);
          return { ...approval, tender };
        });

        setApprovals(enriched);
        setPendingTenders(tendersData.filter((t) => t.status_code === 'Submitted for Approval'));
      } catch (error) {
        console.error('Error fetching approvals data:', error);
      } finally {
        setLoading(false);
      }
    }
    fetchData();
  }, []);

  const filteredApprovals = approvals.filter((approval) => {
    const matchesSearch =
      searchQuery === '' ||
      approval.reference_no?.toLowerCase().includes(searchQuery.toLowerCase()) ||
      approval.tender?.tender_no?.toLowerCase().includes(searchQuery.toLowerCase()) ||
      approval.tender?.project_title?.toLowerCase().includes(searchQuery.toLowerCase());

    const matchesTab =
      activeTab === 'all' ||
      (activeTab === 'pending' && approval.decision === 'Deferred') ||
      (activeTab === 'tfec' && approval.approval_type === 'TFEC') ||
      (activeTab === 'board' && approval.approval_type === 'NPC Board') ||
      (activeTab === 'nec' && approval.approval_type === 'NEC');

    return matchesSearch && matchesTab;
  });

  const stats = {
    total: approvals.length,
    approved: approvals.filter((a) => a.decision === 'Approved').length,
    deferred: approvals.filter((a) => a.decision === 'Deferred').length,
    pending: pendingTenders.length,
  };

  return (
    <MainLayout>
      <div className="space-y-6">
        {/* Page Header */}
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
          <div>
            <h1 className="text-2xl font-bold tracking-tight">Approvals</h1>
            <p className="text-muted-foreground">TFEC, NPC Board, and NEC approval tracking</p>
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
                    <div className="p-3 rounded-lg bg-blue-100">
                      <FileText className="h-6 w-6 text-blue-600" />
                    </div>
                    <div>
                      <p className="text-2xl font-bold">{stats.pending}</p>
                      <p className="text-sm text-muted-foreground">Pending</p>
                    </div>
                  </div>
                </CardContent>
              </Card>
              <Card>
                <CardContent className="pt-6">
                  <div className="flex items-center gap-4">
                    <div className="p-3 rounded-lg bg-green-100">
                      <CheckCircle2 className="h-6 w-6 text-green-600" />
                    </div>
                    <div>
                      <p className="text-2xl font-bold">{stats.approved}</p>
                      <p className="text-sm text-muted-foreground">Approved</p>
                    </div>
                  </div>
                </CardContent>
              </Card>
              <Card>
                <CardContent className="pt-6">
                  <div className="flex items-center gap-4">
                    <div className="p-3 rounded-lg bg-amber-100">
                      <Clock className="h-6 w-6 text-amber-600" />
                    </div>
                    <div>
                      <p className="text-2xl font-bold">{stats.deferred}</p>
                      <p className="text-sm text-muted-foreground">Deferred</p>
                    </div>
                  </div>
                </CardContent>
              </Card>
              <Card>
                <CardContent className="pt-6">
                  <div className="flex items-center gap-4">
                    <div className="p-3 rounded-lg bg-primary/10">
                      <Calendar className="h-6 w-6 text-primary" />
                    </div>
                    <div>
                      <p className="text-2xl font-bold">{stats.total}</p>
                      <p className="text-sm text-muted-foreground">Total Records</p>
                    </div>
                  </div>
                </CardContent>
              </Card>
            </>
          )}
        </div>

        {/* Pending Approvals */}
        {!loading && pendingTenders.length > 0 && (
          <Card className="border-amber-200 bg-amber-50/30">
            <CardHeader>
              <CardTitle className="text-lg flex items-center gap-2">
                <Clock className="h-5 w-5 text-amber-600" />
                Awaiting Approval
              </CardTitle>
              <CardDescription>
                Tenders submitted for TFEC/Board approval
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-3">
                {pendingTenders.map((tender) => (
                  <div
                    key={tender.id}
                    className="flex items-center justify-between p-4 rounded-lg bg-white border border-amber-100"
                  >
                    <div className="flex-1">
                      <p className="font-medium">{tender.project_title || tender.project_description?.substring(0, 50)}</p>
                      <p className="text-sm text-muted-foreground">
                        {tender.tender_no} | {(tender as any).agency?.abbreviation || 'N/A'} |{' '}
                        {tender.procurement_method}
                      </p>
                    </div>
                    <div className="flex items-center gap-3">
                      <Badge variant="outline" className="bg-amber-100 text-amber-700 border-amber-200">
                        Pending
                      </Badge>
                      <Button size="sm" variant="outline">
                        <Eye className="h-4 w-4 mr-2" />
                        Review
                      </Button>
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>
        )}

        {/* Approval History */}
        <Card>
          <CardHeader>
            <CardTitle className="text-lg">Approval History</CardTitle>
            <CardDescription>Record of all approval decisions</CardDescription>
          </CardHeader>
          <CardContent>
            {/* Tabs */}
            <Tabs value={activeTab} onValueChange={setActiveTab} className="mb-4">
              <div className="flex flex-col md:flex-row md:items-center gap-4 mb-4">
                <TabsList>
                  <TabsTrigger value="all">All</TabsTrigger>
                  <TabsTrigger value="tfec">TFEC</TabsTrigger>
                  <TabsTrigger value="board">NPC Board</TabsTrigger>
                  <TabsTrigger value="nec">NEC</TabsTrigger>
                </TabsList>
                <div className="relative flex-1 max-w-sm">
                  <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                  <Input
                    placeholder="Search approvals..."
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                    className="pl-10"
                  />
                </div>
              </div>
            </Tabs>

            {/* Table */}
            <div className="rounded-lg border border-border overflow-hidden">
              <Table>
                <TableHeader>
                  <TableRow className="bg-muted/50">
                    <TableHead>Reference</TableHead>
                    <TableHead>Tender</TableHead>
                    <TableHead>Type</TableHead>
                    <TableHead>Date</TableHead>
                    <TableHead>Decision</TableHead>
                    <TableHead>Notes</TableHead>
                    <TableHead className="w-[50px]"></TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {loading ? (
                    Array.from({ length: 5 }).map((_, i) => (
                      <TableRow key={i}>
                        <TableCell><Skeleton className="h-4 w-24" /></TableCell>
                        <TableCell><Skeleton className="h-4 w-48" /></TableCell>
                        <TableCell><Skeleton className="h-4 w-16" /></TableCell>
                        <TableCell><Skeleton className="h-4 w-20" /></TableCell>
                        <TableCell><Skeleton className="h-4 w-20" /></TableCell>
                        <TableCell><Skeleton className="h-4 w-24" /></TableCell>
                        <TableCell><Skeleton className="h-4 w-8" /></TableCell>
                      </TableRow>
                    ))
                  ) : filteredApprovals.length > 0 ? (
                    filteredApprovals.map((approval) => (
                      <TableRow key={approval.id} className="hover:bg-muted/30">
                        <TableCell className="font-medium">
                          {approval.reference_no || '-'}
                        </TableCell>
                        <TableCell>
                          <div>
                            <p className="font-medium text-sm truncate max-w-[200px]">
                              {approval.tender?.project_title || approval.tender?.project_description?.substring(0, 30)}
                            </p>
                            <p className="text-xs text-muted-foreground">
                              {approval.tender?.tender_no}
                            </p>
                          </div>
                        </TableCell>
                        <TableCell>
                          <Badge variant="outline">{approval.approval_type}</Badge>
                        </TableCell>
                        <TableCell className="text-sm">
                          {formatDate(approval.approval_date)}
                        </TableCell>
                        <TableCell>
                          <div className="flex items-center gap-2">
                            {getDecisionIcon(approval.decision)}
                            <Badge className={getDecisionColor(approval.decision)}>
                              {approval.decision}
                            </Badge>
                          </div>
                        </TableCell>
                        <TableCell>
                          <p className="text-sm text-muted-foreground truncate max-w-[150px]">
                            {approval.notes || '-'}
                          </p>
                        </TableCell>
                        <TableCell>
                          <Button variant="ghost" size="icon" className="h-8 w-8">
                            <Eye className="h-4 w-4" />
                          </Button>
                        </TableCell>
                      </TableRow>
                    ))
                  ) : (
                    <TableRow>
                      <TableCell colSpan={7} className="text-center py-8 text-muted-foreground">
                        No approval records found
                      </TableCell>
                    </TableRow>
                  )}
                </TableBody>
              </Table>
            </div>
          </CardContent>
        </Card>
      </div>
    </MainLayout>
  );
}
