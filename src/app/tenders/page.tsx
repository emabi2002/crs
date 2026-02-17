'use client';

import { useState, useEffect } from 'react';
import { MainLayout } from '@/components/layout/main-layout';
import { StatusBadge } from '@/components/ui/status-badge';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Skeleton } from '@/components/ui/skeleton';
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select';
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table';
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';
import {
  Search,
  Plus,
  Filter,
  Download,
  MoreHorizontal,
  Eye,
  Edit,
  FileText,
} from 'lucide-react';
import { getTenders, getAgencies, getPipelineStats } from '@/lib/data-service';
import type { Tender, Agency, TenderStatusCode, PipelineStats } from '@/lib/types';
import Link from 'next/link';

const formatCurrency = (value: number | undefined) => {
  if (!value) return '-';
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

const statusFilters: TenderStatusCode[] = [
  'Draft',
  'Issued',
  'Active',
  'Closed',
  'Evaluation',
  'Submitted for Approval',
  'Approved',
  'Awarded',
  'Cancelled',
  'On Hold',
];

export default function TendersPage() {
  const [loading, setLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState('');
  const [statusFilter, setStatusFilter] = useState<string>('all');
  const [agencyFilter, setAgencyFilter] = useState<string>('all');
  const [tenders, setTenders] = useState<Tender[]>([]);
  const [agencies, setAgencies] = useState<Agency[]>([]);
  const [pipelineStats, setPipelineStats] = useState<PipelineStats | null>(null);

  useEffect(() => {
    async function fetchData() {
      try {
        const [tendersData, agenciesData, statsData] = await Promise.all([
          getTenders(),
          getAgencies(),
          getPipelineStats(),
        ]);
        setTenders(tendersData);
        setAgencies(agenciesData);
        setPipelineStats(statsData);
      } catch (error) {
        console.error('Error fetching tenders data:', error);
      } finally {
        setLoading(false);
      }
    }
    fetchData();
  }, []);

  const filteredTenders = tenders.filter((tender) => {
    const matchesSearch =
      searchQuery === '' ||
      tender.tender_no.toLowerCase().includes(searchQuery.toLowerCase()) ||
      tender.project_title?.toLowerCase().includes(searchQuery.toLowerCase()) ||
      tender.project_description.toLowerCase().includes(searchQuery.toLowerCase());

    const matchesStatus = statusFilter === 'all' || tender.status_code === statusFilter;
    const matchesAgency = agencyFilter === 'all' || tender.agency_id === agencyFilter;

    return matchesSearch && matchesStatus && matchesAgency;
  });

  return (
    <MainLayout>
      <div className="space-y-6">
        {/* Page Header */}
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
          <div>
            <h1 className="text-2xl font-bold tracking-tight">Tender Pipeline</h1>
            <p className="text-muted-foreground">
              Manage and track all procurement tenders
            </p>
          </div>
          <div className="flex items-center gap-2">
            <Button variant="outline" size="sm">
              <Download className="h-4 w-4 mr-2" />
              Export
            </Button>
            <Button size="sm">
              <Plus className="h-4 w-4 mr-2" />
              New Tender
            </Button>
          </div>
        </div>

        {/* Pipeline Stats */}
        <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-8 gap-3">
          {loading ? (
            Array.from({ length: 8 }).map((_, i) => (
              <Skeleton key={i} className="h-20" />
            ))
          ) : (
            [
              { label: 'Draft', count: pipelineStats?.draft || 0, color: 'bg-gray-100' },
              { label: 'Issued', count: pipelineStats?.issued || 0, color: 'bg-sky-100' },
              { label: 'Active', count: pipelineStats?.active || 0, color: 'bg-emerald-100' },
              { label: 'Closed', count: pipelineStats?.closed || 0, color: 'bg-amber-100' },
              { label: 'Evaluation', count: pipelineStats?.evaluation || 0, color: 'bg-purple-100' },
              { label: 'Approval', count: pipelineStats?.approval || 0, color: 'bg-indigo-100' },
              { label: 'Approved', count: pipelineStats?.approved || 0, color: 'bg-teal-100' },
              { label: 'Awarded', count: pipelineStats?.awarded || 0, color: 'bg-green-100' },
            ].map((stat) => (
              <button
                key={stat.label}
                onClick={() => setStatusFilter(stat.label === 'Approval' ? 'Submitted for Approval' : stat.label)}
                className={`p-3 rounded-lg border border-border hover:border-primary/50 transition-colors ${
                  (statusFilter === stat.label || (statusFilter === 'Submitted for Approval' && stat.label === 'Approval'))
                    ? 'ring-2 ring-primary/30'
                    : ''
                }`}
              >
                <div className={`w-8 h-8 rounded-full ${stat.color} flex items-center justify-center mx-auto mb-1`}>
                  <span className="font-bold text-sm">{stat.count}</span>
                </div>
                <p className="text-xs text-muted-foreground text-center">{stat.label}</p>
              </button>
            ))
          )}
        </div>

        {/* Filters */}
        <Card>
          <CardContent className="pt-6">
            <div className="flex flex-col md:flex-row gap-4">
              <div className="relative flex-1">
                <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                <Input
                  placeholder="Search by tender no, title, or description..."
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
              <Select value={agencyFilter} onValueChange={setAgencyFilter}>
                <SelectTrigger className="w-full md:w-[200px]">
                  <SelectValue placeholder="All Agencies" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Agencies</SelectItem>
                  {agencies.map((agency) => (
                    <SelectItem key={agency.id} value={agency.id}>
                      {agency.abbreviation || agency.name}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
              <Button variant="outline" size="icon">
                <Filter className="h-4 w-4" />
              </Button>
            </div>
          </CardContent>
        </Card>

        {/* Tenders Table */}
        <Card>
          <CardHeader>
            <CardTitle className="text-lg">
              Tenders ({filteredTenders.length})
            </CardTitle>
            <CardDescription>
              {statusFilter !== 'all' ? `Showing ${statusFilter} tenders` : 'Showing all tenders'}
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="rounded-lg border border-border overflow-hidden">
              <Table>
                <TableHeader>
                  <TableRow className="bg-muted/50">
                    <TableHead className="w-[130px]">Tender No</TableHead>
                    <TableHead>Project Title</TableHead>
                    <TableHead className="w-[100px]">Agency</TableHead>
                    <TableHead className="w-[100px]">Issued</TableHead>
                    <TableHead className="w-[100px]">Closing</TableHead>
                    <TableHead className="w-[100px] text-right">Est. Value</TableHead>
                    <TableHead className="w-[140px]">Status</TableHead>
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
                        <TableCell><Skeleton className="h-4 w-16" /></TableCell>
                        <TableCell><Skeleton className="h-4 w-20" /></TableCell>
                        <TableCell><Skeleton className="h-4 w-8" /></TableCell>
                      </TableRow>
                    ))
                  ) : filteredTenders.length > 0 ? (
                    filteredTenders.map((tender) => (
                      <TableRow key={tender.id} className="hover:bg-muted/30">
                        <TableCell className="font-medium">
                          <Link
                            href={`/tenders/${tender.id}`}
                            className="text-primary hover:underline"
                          >
                            {tender.tender_no}
                          </Link>
                        </TableCell>
                        <TableCell>
                          <div className="max-w-[300px]">
                            <p className="font-medium truncate">{tender.project_title || tender.project_description?.substring(0, 50)}</p>
                            <p className="text-xs text-muted-foreground truncate">
                              {tender.procurement_method}
                            </p>
                          </div>
                        </TableCell>
                        <TableCell>
                          <span className="text-sm">{(tender as any).agency?.abbreviation || (tender as any).agency?.name?.substring(0, 10)}</span>
                        </TableCell>
                        <TableCell className="text-sm">
                          {formatDate(tender.issued_date)}
                        </TableCell>
                        <TableCell className="text-sm">
                          {formatDate(tender.closing_datetime)}
                        </TableCell>
                        <TableCell className="text-right font-medium">
                          {formatCurrency(tender.estimated_value)}
                        </TableCell>
                        <TableCell>
                          <StatusBadge status={tender.status_code} size="sm" />
                        </TableCell>
                        <TableCell>
                          <DropdownMenu>
                            <DropdownMenuTrigger asChild>
                              <Button variant="ghost" size="icon" className="h-8 w-8">
                                <MoreHorizontal className="h-4 w-4" />
                              </Button>
                            </DropdownMenuTrigger>
                            <DropdownMenuContent align="end">
                              <DropdownMenuItem asChild>
                                <Link href={`/tenders/${tender.id}`}>
                                  <Eye className="h-4 w-4 mr-2" />
                                  View Details
                                </Link>
                              </DropdownMenuItem>
                              <DropdownMenuItem>
                                <Edit className="h-4 w-4 mr-2" />
                                Edit Tender
                              </DropdownMenuItem>
                              <DropdownMenuItem>
                                <FileText className="h-4 w-4 mr-2" />
                                Documents
                              </DropdownMenuItem>
                            </DropdownMenuContent>
                          </DropdownMenu>
                        </TableCell>
                      </TableRow>
                    ))
                  ) : (
                    <TableRow>
                      <TableCell colSpan={8} className="text-center py-8 text-muted-foreground">
                        No tenders found matching your criteria
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
