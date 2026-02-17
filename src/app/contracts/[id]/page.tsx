'use client';

import { useState, useEffect } from 'react';
import { useParams } from 'next/navigation';
import { MainLayout } from '@/components/layout/main-layout';
import { StatusBadge } from '@/components/ui/status-badge';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Progress } from '@/components/ui/progress';
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
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table';
import {
  ArrowLeft,
  Calendar,
  Building2,
  User,
  DollarSign,
  Clock,
  FileText,
  CheckCircle2,
  AlertTriangle,
  TrendingUp,
  Plus,
  Edit,
  Mail,
  Phone,
  MapPin,
} from 'lucide-react';
import Link from 'next/link';
import {
  getContractAwardById,
  getMilestonesByContractId,
  getVariationsByContractId,
  getIssuesByContractId,
} from '@/lib/data-service';
import type { ContractAward, ContractMilestone, ContractVariation, ContractIssueRisk } from '@/lib/types';

const formatDate = (date: string | null | undefined) => {
  if (!date) return '-';
  return new Date(date).toLocaleDateString('en-GB', {
    day: '2-digit',
    month: 'short',
    year: 'numeric',
  });
};

const formatCurrency = (value: number | undefined | null) => {
  if (!value) return '-';
  const num = Number(value);
  if (num >= 1000000) {
    return `K${(num / 1000000).toFixed(1)}M`;
  }
  return `K${num.toLocaleString()}`;
};

// Check if value is placeholder
const isPlaceholder = (value: string | undefined | null): boolean => {
  if (!value) return true;
  const placeholders = ['675 300 0000', 'info@contractor.com.pg', 'Contact Person', 'Port Moresby'];
  return placeholders.includes(value.trim());
};

export default function ContractDetailPage() {
  const params = useParams();
  const contractId = params.id as string;

  const [loading, setLoading] = useState(true);
  const [contract, setContract] = useState<ContractAward | null>(null);
  const [milestones, setMilestones] = useState<ContractMilestone[]>([]);
  const [variations, setVariations] = useState<ContractVariation[]>([]);
  const [issues, setIssues] = useState<ContractIssueRisk[]>([]);

  useEffect(() => {
    async function fetchData() {
      try {
        const [contractData, milestonesData, variationsData, issuesData] = await Promise.all([
          getContractAwardById(contractId),
          getMilestonesByContractId(contractId),
          getVariationsByContractId(contractId),
          getIssuesByContractId(contractId),
        ]);

        setContract(contractData);
        setMilestones(milestonesData);
        setVariations(variationsData);
        setIssues(issuesData);
      } catch (error) {
        console.error('Error fetching contract:', error);
      } finally {
        setLoading(false);
      }
    }
    fetchData();
  }, [contractId]);

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

  if (!contract) {
    return (
      <MainLayout>
        <div className="flex items-center justify-center h-96">
          <div className="text-center">
            <h2 className="text-xl font-semibold mb-2">Contract not found</h2>
            <p className="text-muted-foreground mb-4">
              The contract you're looking for doesn't exist.
            </p>
            <Link href="/contracts">
              <Button>
                <ArrowLeft className="h-4 w-4 mr-2" />
                Back to Contracts
              </Button>
            </Link>
          </div>
        </div>
      </MainLayout>
    );
  }

  const tender = (contract as any).tender;
  const contractor = (contract as any).contractor;
  const agency = tender?.agency;

  const completedMilestones = milestones.filter((m) => m.status === 'Completed').length;
  const progress = milestones.length > 0 ? (completedMilestones / milestones.length) * 100 : 0;
  const totalVariationValue = variations.reduce((sum, v) => sum + (Number(v.value_delta) || 0), 0);
  const openIssues = issues.filter((i) => !i.closed_date).length;

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
              <BreadcrumbLink href="/contracts">Contracts</BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>{contract.contract_no || 'Contract'}</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="flex flex-col md:flex-row md:items-start md:justify-between gap-4">
          <div className="flex items-start gap-4">
            <Link href="/contracts">
              <Button variant="ghost" size="icon">
                <ArrowLeft className="h-5 w-5" />
              </Button>
            </Link>
            <div>
              <div className="flex items-center gap-3 mb-2">
                <h1 className="text-2xl font-bold">{contract.contract_no || 'Contract'}</h1>
                <StatusBadge status={contract.status} />
              </div>
              <p className="text-lg text-muted-foreground max-w-2xl">
                {tender?.project_title || tender?.project_description?.substring(0, 100) || 'No title'}
              </p>
            </div>
          </div>
          <div className="flex gap-2">
            <Button variant="outline" size="sm">
              <Edit className="h-4 w-4 mr-2" />
              Edit
            </Button>
          </div>
        </div>

        <div className="grid lg:grid-cols-3 gap-6">
          {/* Main Content */}
          <div className="lg:col-span-2 space-y-6">
            {/* Contract Overview */}
            <Card>
              <CardHeader>
                <CardTitle className="text-lg">Contract Overview</CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div className="grid md:grid-cols-2 gap-4">
                  <div>
                    <p className="text-sm text-muted-foreground">Contract Value</p>
                    <p className="text-2xl font-bold text-primary">
                      {formatCurrency(Number(contract.contract_value))}
                    </p>
                  </div>
                  <div>
                    <p className="text-sm text-muted-foreground">Variations</p>
                    <p className={`text-2xl font-bold ${totalVariationValue > 0 ? 'text-amber-600' : ''}`}>
                      {totalVariationValue !== 0 ? `${totalVariationValue > 0 ? '+' : ''}${formatCurrency(totalVariationValue)}` : '-'}
                    </p>
                  </div>
                </div>
                <Separator />
                <div className="grid md:grid-cols-3 gap-4">
                  <div>
                    <p className="text-sm text-muted-foreground">Start Date</p>
                    <p className="font-medium">{formatDate(contract.commencement_date)}</p>
                  </div>
                  <div>
                    <p className="text-sm text-muted-foreground">End Date</p>
                    <p className="font-medium">{formatDate(contract.end_date)}</p>
                  </div>
                  <div>
                    <p className="text-sm text-muted-foreground">Award Date</p>
                    <p className="font-medium">{formatDate(contract.award_date)}</p>
                  </div>
                </div>
                <Separator />
                <div>
                  <div className="flex justify-between mb-2">
                    <p className="text-sm text-muted-foreground">Milestone Progress</p>
                    <p className="text-sm font-medium">{progress.toFixed(0)}%</p>
                  </div>
                  <Progress value={progress} className="h-2" />
                  <p className="text-xs text-muted-foreground mt-1">
                    {completedMilestones} of {milestones.length} milestones completed
                  </p>
                </div>
              </CardContent>
            </Card>

            {/* Tabs */}
            <Tabs defaultValue="milestones">
              <TabsList className="w-full justify-start">
                <TabsTrigger value="milestones">Milestones ({milestones.length})</TabsTrigger>
                <TabsTrigger value="variations">Variations ({variations.length})</TabsTrigger>
                <TabsTrigger value="issues">Issues ({openIssues})</TabsTrigger>
              </TabsList>

              <TabsContent value="milestones" className="mt-4">
                <Card>
                  <CardContent className="pt-6">
                    {milestones.length > 0 ? (
                      <div className="rounded-lg border overflow-hidden">
                        <Table>
                          <TableHeader>
                            <TableRow className="bg-muted/50">
                              <TableHead className="w-12">#</TableHead>
                              <TableHead>Milestone</TableHead>
                              <TableHead>Due Date</TableHead>
                              <TableHead>Status</TableHead>
                              <TableHead className="text-right">Payment %</TableHead>
                            </TableRow>
                          </TableHeader>
                          <TableBody>
                            {milestones.map((milestone) => (
                              <TableRow key={milestone.id}>
                                <TableCell className="font-medium">{milestone.milestone_no}</TableCell>
                                <TableCell>{milestone.milestone_name}</TableCell>
                                <TableCell>{formatDate(milestone.due_date)}</TableCell>
                                <TableCell>
                                  <StatusBadge status={milestone.status} size="sm" />
                                </TableCell>
                                <TableCell className="text-right">
                                  {milestone.payment_percentage ? `${milestone.payment_percentage}%` : '-'}
                                </TableCell>
                              </TableRow>
                            ))}
                          </TableBody>
                        </Table>
                      </div>
                    ) : (
                      <p className="text-center py-8 text-muted-foreground">
                        No milestones defined
                      </p>
                    )}
                  </CardContent>
                </Card>
              </TabsContent>

              <TabsContent value="variations" className="mt-4">
                <Card>
                  <CardContent className="pt-6">
                    {variations.length > 0 ? (
                      <div className="space-y-3">
                        {variations.map((variation) => (
                          <div
                            key={variation.id}
                            className="flex items-start justify-between p-4 rounded-lg border"
                          >
                            <div>
                              <p className="font-medium">Variation #{variation.variation_no}</p>
                              <p className="text-sm text-muted-foreground">{variation.reason}</p>
                              <p className="text-xs text-muted-foreground mt-1">
                                {formatDate(variation.variation_date)}
                              </p>
                            </div>
                            <div className="text-right">
                              <p className={`font-semibold ${Number(variation.value_delta) > 0 ? 'text-amber-600' : 'text-green-600'}`}>
                                {Number(variation.value_delta) > 0 ? '+' : ''}{formatCurrency(Number(variation.value_delta))}
                              </p>
                              {variation.time_extension_days > 0 && (
                                <p className="text-sm text-muted-foreground">
                                  +{variation.time_extension_days} days
                                </p>
                              )}
                            </div>
                          </div>
                        ))}
                      </div>
                    ) : (
                      <p className="text-center py-8 text-muted-foreground">
                        No variations recorded
                      </p>
                    )}
                  </CardContent>
                </Card>
              </TabsContent>

              <TabsContent value="issues" className="mt-4">
                <Card>
                  <CardContent className="pt-6">
                    {issues.length > 0 ? (
                      <div className="space-y-3">
                        {issues.map((issue) => (
                          <div
                            key={issue.id}
                            className={`flex items-start justify-between p-4 rounded-lg border ${
                              !issue.closed_date ? 'border-red-200 bg-red-50/30' : ''
                            }`}
                          >
                            <div className="flex-1">
                              <div className="flex items-center gap-2 mb-1">
                                <Badge variant="outline">{issue.type}</Badge>
                                <StatusBadge status={issue.severity} size="sm" />
                              </div>
                              <p className="text-sm">{issue.description}</p>
                              <p className="text-xs text-muted-foreground mt-1">
                                Opened: {formatDate(issue.opened_date)}
                                {issue.closed_date && ` | Closed: ${formatDate(issue.closed_date)}`}
                              </p>
                            </div>
                          </div>
                        ))}
                      </div>
                    ) : (
                      <p className="text-center py-8 text-muted-foreground">
                        No issues or risks recorded
                      </p>
                    )}
                  </CardContent>
                </Card>
              </TabsContent>
            </Tabs>
          </div>

          {/* Sidebar */}
          <div className="space-y-6">
            {/* Contractor Info */}
            <Card>
              <CardHeader>
                <CardTitle className="text-lg">Contractor</CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div className="flex items-start gap-3">
                  <Building2 className="h-5 w-5 text-muted-foreground mt-0.5" />
                  <div>
                    <p className="font-medium">{contractor?.trading_name || contractor?.legal_name || 'Unknown'}</p>
                    {contractor?.trading_name && contractor?.legal_name && contractor.trading_name !== contractor.legal_name && (
                      <p className="text-sm text-muted-foreground">{contractor.legal_name}</p>
                    )}
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <MapPin className="h-5 w-5 text-muted-foreground mt-0.5" />
                  <div>
                    <p className="text-sm text-muted-foreground">Location</p>
                    <p className="font-medium">{contractor?.province || 'PNG'}</p>
                  </div>
                </div>
                {!isPlaceholder(contractor?.phone) && (
                  <div className="flex items-start gap-3">
                    <Phone className="h-5 w-5 text-muted-foreground mt-0.5" />
                    <div>
                      <p className="text-sm text-muted-foreground">Phone</p>
                      <p className="font-medium">{contractor?.phone}</p>
                    </div>
                  </div>
                )}
                {!isPlaceholder(contractor?.email) && (
                  <div className="flex items-start gap-3">
                    <Mail className="h-5 w-5 text-muted-foreground mt-0.5" />
                    <div>
                      <p className="text-sm text-muted-foreground">Email</p>
                      <p className="font-medium">{contractor?.email}</p>
                    </div>
                  </div>
                )}
                <Link href={`/contractors/${contractor?.id}`}>
                  <Button variant="outline" className="w-full mt-2" size="sm">
                    View Contractor Profile
                  </Button>
                </Link>
              </CardContent>
            </Card>

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
              </CardContent>
            </Card>

            {/* Quick Stats */}
            <Card>
              <CardHeader>
                <CardTitle className="text-lg">Summary</CardTitle>
              </CardHeader>
              <CardContent className="space-y-3">
                <div className="flex justify-between">
                  <span className="text-muted-foreground">Milestones</span>
                  <span className="font-medium">{completedMilestones}/{milestones.length}</span>
                </div>
                <Separator />
                <div className="flex justify-between">
                  <span className="text-muted-foreground">Variations</span>
                  <span className="font-medium">{variations.length}</span>
                </div>
                <Separator />
                <div className="flex justify-between">
                  <span className="text-muted-foreground">Open Issues</span>
                  <span className={`font-medium ${openIssues > 0 ? 'text-red-600' : ''}`}>{openIssues}</span>
                </div>
              </CardContent>
            </Card>
          </div>
        </div>
      </div>
    </MainLayout>
  );
}
