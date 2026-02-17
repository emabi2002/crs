'use client';

import { useState, useEffect } from 'react';
import { useParams } from 'next/navigation';
import { MainLayout } from '@/components/layout/main-layout';
import { StatusBadge } from '@/components/ui/status-badge';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Skeleton } from '@/components/ui/skeleton';
import { Separator } from '@/components/ui/separator';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from '@/components/ui/breadcrumb';
import {
  ArrowLeft,
  Calendar,
  Building2,
  User,
  DollarSign,
  Clock,
  FileText,
  CheckCircle2,
  AlertCircle,
  ChevronRight,
  Download,
  Edit,
  Send,
  Award,
} from 'lucide-react';
import Link from 'next/link';
import {
  getTenderById,
  getWorkflowEventsByTenderId,
  getBidsByTenderId,
  getApprovalsByTenderId,
  getContractAwardByTenderId,
} from '@/lib/data-service';
import type { Tender, Bid, Approval, ContractAward } from '@/lib/types';

const formatDate = (date: string | null | undefined) => {
  if (!date) return '-';
  return new Date(date).toLocaleDateString('en-GB', {
    day: '2-digit',
    month: 'short',
    year: 'numeric',
  });
};

const formatDateTime = (datetime: string | null | undefined) => {
  if (!datetime) return '-';
  return new Date(datetime).toLocaleString('en-GB', {
    day: '2-digit',
    month: 'short',
    year: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
  });
};

const formatCurrency = (value: number | undefined | null) => {
  if (!value) return '-';
  return `K${Number(value).toLocaleString()}`;
};

export default function TenderDetailPage() {
  const params = useParams();
  const tenderId = params.id as string;

  const [loading, setLoading] = useState(true);
  const [tender, setTender] = useState<Tender | null>(null);
  const [bids, setBids] = useState<Bid[]>([]);
  const [approvals, setApprovals] = useState<Approval[]>([]);
  const [workflowEvents, setWorkflowEvents] = useState<any[]>([]);
  const [contract, setContract] = useState<ContractAward | null>(null);

  useEffect(() => {
    async function fetchData() {
      try {
        const [tenderData, bidsData, approvalsData, eventsData, contractData] = await Promise.all([
          getTenderById(tenderId),
          getBidsByTenderId(tenderId),
          getApprovalsByTenderId(tenderId),
          getWorkflowEventsByTenderId(tenderId),
          getContractAwardByTenderId(tenderId),
        ]);

        setTender(tenderData);
        setBids(bidsData);
        setApprovals(approvalsData);
        setWorkflowEvents(eventsData);
        setContract(contractData);
      } catch (error) {
        console.error('Error fetching tender:', error);
      } finally {
        setLoading(false);
      }
    }
    fetchData();
  }, [tenderId]);

  if (loading) {
    return (
      <MainLayout>
        <div className="space-y-6">
          <Skeleton className="h-10 w-64" />
          <div className="grid lg:grid-cols-3 gap-6">
            <Skeleton className="h-96 lg:col-span-2" />
            <Skeleton className="h-96" />
          </div>
        </div>
      </MainLayout>
    );
  }

  if (!tender) {
    return (
      <MainLayout>
        <div className="flex items-center justify-center h-96">
          <div className="text-center">
            <h2 className="text-xl font-semibold mb-2">Tender not found</h2>
            <p className="text-muted-foreground mb-4">
              The tender you're looking for doesn't exist or has been removed.
            </p>
            <Link href="/tenders">
              <Button>
                <ArrowLeft className="h-4 w-4 mr-2" />
                Back to Tenders
              </Button>
            </Link>
          </div>
        </div>
      </MainLayout>
    );
  }

  const agency = (tender as any).agency;
  const officer = (tender as any).officer;
  const fundingSource = (tender as any).funding_source;

  return (
    <MainLayout>
      <div className="space-y-6">
        {/* Breadcrumb */}
        <Breadcrumb>
          <BreadcrumbList>
            <BreadcrumbItem>
              <BreadcrumbLink href="/">Dashboard</BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbLink href="/tenders">Tenders</BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>{tender.tender_no}</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="flex flex-col md:flex-row md:items-start md:justify-between gap-4">
          <div className="flex items-start gap-4">
            <Link href="/tenders">
              <Button variant="ghost" size="icon">
                <ArrowLeft className="h-5 w-5" />
              </Button>
            </Link>
            <div>
              <div className="flex items-center gap-3 mb-2">
                <h1 className="text-2xl font-bold">{tender.tender_no}</h1>
                <StatusBadge status={tender.status_code} />
              </div>
              <p className="text-lg text-muted-foreground max-w-2xl">
                {tender.project_title || tender.project_description?.substring(0, 100)}
              </p>
            </div>
          </div>
          <div className="flex gap-2">
            <Button variant="outline" size="sm">
              <Download className="h-4 w-4 mr-2" />
              Export
            </Button>
            <Button variant="outline" size="sm">
              <Edit className="h-4 w-4 mr-2" />
              Edit
            </Button>
          </div>
        </div>

        <div className="grid lg:grid-cols-3 gap-6">
          {/* Main Content */}
          <div className="lg:col-span-2 space-y-6">
            {/* Project Details */}
            <Card>
              <CardHeader>
                <CardTitle className="text-lg">Project Details</CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div>
                  <h4 className="text-sm font-medium text-muted-foreground mb-1">Description</h4>
                  <p>{tender.project_description || 'No description provided'}</p>
                </div>
                <Separator />
                <div className="grid md:grid-cols-2 gap-4">
                  <div>
                    <h4 className="text-sm font-medium text-muted-foreground mb-1">
                      Procurement Method
                    </h4>
                    <p className="font-medium">{tender.procurement_method}</p>
                  </div>
                  <div>
                    <h4 className="text-sm font-medium text-muted-foreground mb-1">
                      Estimated Value
                    </h4>
                    <p className="font-semibold text-primary">
                      {formatCurrency(tender.estimated_value)}
                    </p>
                  </div>
                  <div>
                    <h4 className="text-sm font-medium text-muted-foreground mb-1">
                      Funding Source
                    </h4>
                    <p className="font-medium">{fundingSource?.name || 'Not specified'}</p>
                  </div>
                  <div>
                    <h4 className="text-sm font-medium text-muted-foreground mb-1">
                      Closing Date
                    </h4>
                    <p className="font-medium">{formatDateTime(tender.closing_datetime)}</p>
                  </div>
                </div>
              </CardContent>
            </Card>

            {/* Tabs */}
            <Tabs defaultValue="bids">
              <TabsList className="w-full justify-start">
                <TabsTrigger value="bids">Bids ({bids.length})</TabsTrigger>
                <TabsTrigger value="approvals">Approvals ({approvals.length})</TabsTrigger>
                <TabsTrigger value="timeline">Timeline ({workflowEvents.length})</TabsTrigger>
              </TabsList>

              <TabsContent value="bids" className="mt-4">
                <Card>
                  <CardContent className="pt-6">
                    {bids.length > 0 ? (
                      <div className="space-y-3">
                        {bids.map((bid, index) => (
                          <div
                            key={bid.id}
                            className={`flex items-center justify-between p-4 rounded-lg border ${
                              index === 0 ? 'border-green-200 bg-green-50/50' : ''
                            }`}
                          >
                            <div className="flex items-center gap-4">
                              <div
                                className={`w-8 h-8 rounded-full flex items-center justify-center ${
                                  index === 0
                                    ? 'bg-green-100 text-green-700'
                                    : 'bg-muted text-muted-foreground'
                                }`}
                              >
                                {index + 1}
                              </div>
                              <div>
                                <p className="font-medium">
                                  {(bid as any).contractor?.trading_name || (bid as any).contractor?.legal_name || 'Unknown Contractor'}
                                </p>
                                <p className="text-sm text-muted-foreground">
                                  Received: {formatDateTime(bid.received_datetime)}
                                </p>
                              </div>
                            </div>
                            <div className="text-right">
                              <p className="font-semibold">{formatCurrency(bid.bid_price)}</p>
                              <Badge
                                variant="outline"
                                className={
                                  bid.is_compliant
                                    ? 'bg-green-100 text-green-700'
                                    : 'bg-red-100 text-red-700'
                                }
                              >
                                {bid.is_compliant ? 'Compliant' : 'Non-compliant'}
                              </Badge>
                            </div>
                          </div>
                        ))}
                      </div>
                    ) : (
                      <p className="text-center py-8 text-muted-foreground">
                        No bids received yet
                      </p>
                    )}
                  </CardContent>
                </Card>
              </TabsContent>

              <TabsContent value="approvals" className="mt-4">
                <Card>
                  <CardContent className="pt-6">
                    {approvals.length > 0 ? (
                      <div className="space-y-3">
                        {approvals.map((approval) => (
                          <div
                            key={approval.id}
                            className="flex items-center justify-between p-4 rounded-lg border"
                          >
                            <div className="flex items-center gap-4">
                              <CheckCircle2 className="h-5 w-5 text-green-600" />
                              <div>
                                <p className="font-medium">{approval.approval_type}</p>
                                <p className="text-sm text-muted-foreground">
                                  {approval.reference_no || 'No reference'}
                                </p>
                              </div>
                            </div>
                            <div className="text-right">
                              <Badge
                                variant="outline"
                                className={
                                  approval.decision === 'Approved'
                                    ? 'bg-green-100 text-green-700'
                                    : approval.decision === 'Deferred'
                                    ? 'bg-amber-100 text-amber-700'
                                    : 'bg-red-100 text-red-700'
                                }
                              >
                                {approval.decision}
                              </Badge>
                              <p className="text-sm text-muted-foreground mt-1">
                                {formatDate(approval.approval_date)}
                              </p>
                            </div>
                          </div>
                        ))}
                      </div>
                    ) : (
                      <p className="text-center py-8 text-muted-foreground">
                        No approvals recorded yet
                      </p>
                    )}
                  </CardContent>
                </Card>
              </TabsContent>

              <TabsContent value="timeline" className="mt-4">
                <Card>
                  <CardContent className="pt-6">
                    {workflowEvents.length > 0 ? (
                      <div className="relative pl-6 space-y-4">
                        {workflowEvents.map((event, index) => (
                          <div key={event.id} className="relative">
                            <div className="absolute -left-6 w-3 h-3 rounded-full bg-primary" />
                            {index < workflowEvents.length - 1 && (
                              <div className="absolute -left-[18px] top-3 w-0.5 h-full bg-border" />
                            )}
                            <div className="pb-4">
                              <p className="font-medium">{event.event_type}</p>
                              <p className="text-sm text-muted-foreground">
                                {formatDateTime(event.event_datetime)}
                              </p>
                              {event.notes && (
                                <p className="text-sm mt-1">{event.notes}</p>
                              )}
                            </div>
                          </div>
                        ))}
                      </div>
                    ) : (
                      <p className="text-center py-8 text-muted-foreground">
                        No workflow events recorded
                      </p>
                    )}
                  </CardContent>
                </Card>
              </TabsContent>
            </Tabs>
          </div>

          {/* Sidebar */}
          <div className="space-y-6">
            {/* Agency Info */}
            <Card>
              <CardHeader>
                <CardTitle className="text-lg">Agency</CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div className="flex items-start gap-3">
                  <Building2 className="h-5 w-5 text-muted-foreground mt-0.5" />
                  <div>
                    <p className="font-medium">{agency?.name || 'Unknown Agency'}</p>
                    {agency?.abbreviation && (
                      <p className="text-sm text-muted-foreground">{agency.abbreviation}</p>
                    )}
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <User className="h-5 w-5 text-muted-foreground mt-0.5" />
                  <div>
                    <p className="text-sm text-muted-foreground">Action Officer</p>
                    <p className="font-medium">{officer?.full_name || 'Not assigned'}</p>
                  </div>
                </div>
              </CardContent>
            </Card>

            {/* Key Dates */}
            <Card>
              <CardHeader>
                <CardTitle className="text-lg">Key Dates</CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div className="flex items-start gap-3">
                  <Calendar className="h-5 w-5 text-muted-foreground mt-0.5" />
                  <div>
                    <p className="text-sm text-muted-foreground">Issued</p>
                    <p className="font-medium">{formatDate(tender.issued_date)}</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <Clock className="h-5 w-5 text-muted-foreground mt-0.5" />
                  <div>
                    <p className="text-sm text-muted-foreground">Closing</p>
                    <p className="font-medium">{formatDateTime(tender.closing_datetime)}</p>
                  </div>
                </div>
              </CardContent>
            </Card>

            {/* Contract Award */}
            {contract && (
              <Card className="border-green-200 bg-green-50/30">
                <CardHeader>
                  <CardTitle className="text-lg flex items-center gap-2">
                    <Award className="h-5 w-5 text-green-600" />
                    Contract Awarded
                  </CardTitle>
                </CardHeader>
                <CardContent className="space-y-3">
                  <div>
                    <p className="text-sm text-muted-foreground">Contractor</p>
                    <p className="font-medium">
                      {(contract as any).contractor?.trading_name || (contract as any).contractor?.legal_name || 'Unknown'}
                    </p>
                  </div>
                  <div>
                    <p className="text-sm text-muted-foreground">Contract Value</p>
                    <p className="font-semibold text-green-700">
                      {formatCurrency(Number(contract.contract_value))}
                    </p>
                  </div>
                  <div>
                    <p className="text-sm text-muted-foreground">Contract No.</p>
                    <p className="font-medium">{contract.contract_no || 'N/A'}</p>
                  </div>
                  <Link href={`/contracts/${contract.id}`}>
                    <Button variant="outline" className="w-full mt-2" size="sm">
                      View Contract
                      <ChevronRight className="h-4 w-4 ml-2" />
                    </Button>
                  </Link>
                </CardContent>
              </Card>
            )}
          </div>
        </div>
      </div>
    </MainLayout>
  );
}
