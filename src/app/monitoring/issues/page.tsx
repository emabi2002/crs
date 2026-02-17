'use client';

import { useState } from 'react';
import { MainLayout } from '@/components/layout/main-layout';
import { StatusBadge } from '@/components/ui/status-badge';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Badge } from '@/components/ui/badge';
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
  Plus,
  AlertTriangle,
  AlertCircle,
  AlertOctagon,
  CheckCircle2,
  XCircle,
  Calendar,
  User,
} from 'lucide-react';
import { contractIssuesRisks, getEnrichedContracts, getOfficerById } from '@/lib/mock-data';
import type { IssueRiskType, Severity } from '@/lib/types';

const formatDate = (date: string) => {
  return new Date(date).toLocaleDateString('en-GB', {
    day: '2-digit',
    month: 'short',
    year: 'numeric',
  });
};

const getSeverityIcon = (severity: Severity) => {
  switch (severity) {
    case 'Critical':
      return <AlertOctagon className="h-4 w-4 text-red-600" />;
    case 'High':
      return <AlertTriangle className="h-4 w-4 text-orange-600" />;
    case 'Medium':
      return <AlertCircle className="h-4 w-4 text-amber-600" />;
    case 'Low':
      return <CheckCircle2 className="h-4 w-4 text-green-600" />;
    default:
      return null;
  }
};

const getSeverityColor = (severity: Severity) => {
  switch (severity) {
    case 'Critical':
      return 'bg-red-100 text-red-700 border-red-200';
    case 'High':
      return 'bg-orange-100 text-orange-700 border-orange-200';
    case 'Medium':
      return 'bg-amber-100 text-amber-700 border-amber-200';
    case 'Low':
      return 'bg-green-100 text-green-700 border-green-200';
    default:
      return 'bg-gray-100 text-gray-700 border-gray-200';
  }
};

export default function IssuesPage() {
  const [searchQuery, setSearchQuery] = useState('');
  const [typeFilter, setTypeFilter] = useState<string>('all');
  const [severityFilter, setSeverityFilter] = useState<string>('all');
  const [statusFilter, setStatusFilter] = useState<string>('open');

  const allContracts = getEnrichedContracts();

  // Enrich issues with contract and officer info
  const enrichedIssues = contractIssuesRisks.map((issue) => {
    const contract = allContracts.find((c) => c.id === issue.contract_award_id);
    const owner = issue.owner_officer_id ? getOfficerById(issue.owner_officer_id) : undefined;
    return { ...issue, contract, owner };
  });

  const filteredIssues = enrichedIssues.filter((issue) => {
    const matchesSearch =
      searchQuery === '' ||
      issue.description.toLowerCase().includes(searchQuery.toLowerCase()) ||
      issue.contract?.tender?.project_title?.toLowerCase().includes(searchQuery.toLowerCase()) ||
      issue.contract?.contractor?.legal_name.toLowerCase().includes(searchQuery.toLowerCase());

    const matchesType = typeFilter === 'all' || issue.type === typeFilter;
    const matchesSeverity = severityFilter === 'all' || issue.severity === severityFilter;
    const matchesStatus =
      statusFilter === 'all' ||
      (statusFilter === 'open' && !issue.closed_date) ||
      (statusFilter === 'closed' && issue.closed_date);

    return matchesSearch && matchesType && matchesSeverity && matchesStatus;
  });

  // Sort by severity and then by date
  const severityOrder: Record<Severity, number> = { Critical: 0, High: 1, Medium: 2, Low: 3 };
  const sortedIssues = [...filteredIssues].sort((a, b) => {
    const severityDiff = severityOrder[a.severity] - severityOrder[b.severity];
    if (severityDiff !== 0) return severityDiff;
    return new Date(b.opened_date).getTime() - new Date(a.opened_date).getTime();
  });

  const openIssues = contractIssuesRisks.filter((i) => !i.closed_date);
  const stats = {
    total: openIssues.length,
    critical: openIssues.filter((i) => i.severity === 'Critical').length,
    high: openIssues.filter((i) => i.severity === 'High').length,
    medium: openIssues.filter((i) => i.severity === 'Medium').length,
    low: openIssues.filter((i) => i.severity === 'Low').length,
    issues: openIssues.filter((i) => i.type === 'Issue').length,
    risks: openIssues.filter((i) => i.type === 'Risk').length,
  };

  return (
    <MainLayout>
      <div className="space-y-6">
        {/* Page Header */}
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
          <div>
            <h1 className="text-2xl font-bold tracking-tight">Issues & Risks</h1>
            <p className="text-muted-foreground">
              Track and manage contract issues and risks
            </p>
          </div>
          <div className="flex items-center gap-2">
            <Button variant="outline" size="sm">
              <Download className="h-4 w-4 mr-2" />
              Export
            </Button>
            <Button size="sm">
              <Plus className="h-4 w-4 mr-2" />
              Log Issue
            </Button>
          </div>
        </div>

        {/* Summary Stats */}
        <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-7 gap-4">
          <Card>
            <CardContent className="pt-6">
              <div className="text-center">
                <p className="text-3xl font-bold">{stats.total}</p>
                <p className="text-sm text-muted-foreground">Open</p>
              </div>
            </CardContent>
          </Card>
          <Card className="bg-red-50 border-red-200">
            <CardContent className="pt-6">
              <div className="text-center">
                <p className="text-3xl font-bold text-red-700">{stats.critical}</p>
                <p className="text-sm text-red-600">Critical</p>
              </div>
            </CardContent>
          </Card>
          <Card className="bg-orange-50 border-orange-200">
            <CardContent className="pt-6">
              <div className="text-center">
                <p className="text-3xl font-bold text-orange-700">{stats.high}</p>
                <p className="text-sm text-orange-600">High</p>
              </div>
            </CardContent>
          </Card>
          <Card className="bg-amber-50 border-amber-200">
            <CardContent className="pt-6">
              <div className="text-center">
                <p className="text-3xl font-bold text-amber-700">{stats.medium}</p>
                <p className="text-sm text-amber-600">Medium</p>
              </div>
            </CardContent>
          </Card>
          <Card className="bg-green-50 border-green-200">
            <CardContent className="pt-6">
              <div className="text-center">
                <p className="text-3xl font-bold text-green-700">{stats.low}</p>
                <p className="text-sm text-green-600">Low</p>
              </div>
            </CardContent>
          </Card>
          <Card className="bg-blue-50 border-blue-200">
            <CardContent className="pt-6">
              <div className="text-center">
                <p className="text-3xl font-bold text-blue-700">{stats.issues}</p>
                <p className="text-sm text-blue-600">Issues</p>
              </div>
            </CardContent>
          </Card>
          <Card className="bg-purple-50 border-purple-200">
            <CardContent className="pt-6">
              <div className="text-center">
                <p className="text-3xl font-bold text-purple-700">{stats.risks}</p>
                <p className="text-sm text-purple-600">Risks</p>
              </div>
            </CardContent>
          </Card>
        </div>

        {/* Filters */}
        <Card>
          <CardContent className="pt-6">
            <div className="flex flex-col md:flex-row gap-4">
              <div className="relative flex-1">
                <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                <Input
                  placeholder="Search issues, projects, or contractors..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="pl-10"
                />
              </div>
              <Select value={typeFilter} onValueChange={setTypeFilter}>
                <SelectTrigger className="w-full md:w-[130px]">
                  <SelectValue placeholder="Type" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Types</SelectItem>
                  <SelectItem value="Issue">Issues</SelectItem>
                  <SelectItem value="Risk">Risks</SelectItem>
                </SelectContent>
              </Select>
              <Select value={severityFilter} onValueChange={setSeverityFilter}>
                <SelectTrigger className="w-full md:w-[140px]">
                  <SelectValue placeholder="Severity" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Severity</SelectItem>
                  <SelectItem value="Critical">Critical</SelectItem>
                  <SelectItem value="High">High</SelectItem>
                  <SelectItem value="Medium">Medium</SelectItem>
                  <SelectItem value="Low">Low</SelectItem>
                </SelectContent>
              </Select>
              <Select value={statusFilter} onValueChange={setStatusFilter}>
                <SelectTrigger className="w-full md:w-[130px]">
                  <SelectValue placeholder="Status" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All</SelectItem>
                  <SelectItem value="open">Open</SelectItem>
                  <SelectItem value="closed">Closed</SelectItem>
                </SelectContent>
              </Select>
            </div>
          </CardContent>
        </Card>

        {/* Issues List */}
        <div className="space-y-4">
          {sortedIssues.map((issue) => (
            <Card
              key={issue.id}
              className={`transition-all hover:shadow-md ${
                issue.closed_date ? 'opacity-70' : ''
              } ${
                issue.severity === 'Critical' && !issue.closed_date
                  ? 'border-red-300 bg-red-50/30'
                  : issue.severity === 'High' && !issue.closed_date
                    ? 'border-orange-300 bg-orange-50/30'
                    : ''
              }`}
            >
              <CardContent className="p-6">
                <div className="flex flex-col md:flex-row md:items-start gap-4">
                  <div className="flex-shrink-0">
                    <div
                      className={`w-12 h-12 rounded-lg flex items-center justify-center ${
                        issue.severity === 'Critical'
                          ? 'bg-red-100'
                          : issue.severity === 'High'
                            ? 'bg-orange-100'
                            : issue.severity === 'Medium'
                              ? 'bg-amber-100'
                              : 'bg-green-100'
                      }`}
                    >
                      {getSeverityIcon(issue.severity)}
                    </div>
                  </div>

                  <div className="flex-1 space-y-3">
                    <div className="flex items-start justify-between gap-4">
                      <div>
                        <p className="font-medium text-base">{issue.description}</p>
                        <p className="text-sm text-muted-foreground mt-1">
                          {issue.contract?.tender?.project_title} |{' '}
                          {issue.contract?.contractor?.trading_name ||
                            issue.contract?.contractor?.legal_name}
                        </p>
                      </div>
                      <div className="flex items-center gap-2">
                        <Badge
                          variant="outline"
                          className={issue.type === 'Issue' ? 'bg-blue-100 text-blue-700' : 'bg-purple-100 text-purple-700'}
                        >
                          {issue.type}
                        </Badge>
                        <Badge className={getSeverityColor(issue.severity)}>{issue.severity}</Badge>
                      </div>
                    </div>

                    <div className="flex flex-wrap items-center gap-4 text-sm text-muted-foreground">
                      <div className="flex items-center gap-1">
                        <Calendar className="h-4 w-4" />
                        <span>Opened: {formatDate(issue.opened_date)}</span>
                      </div>
                      {issue.owner && (
                        <div className="flex items-center gap-1">
                          <User className="h-4 w-4" />
                          <span>{issue.owner.full_name}</span>
                        </div>
                      )}
                      {issue.closed_date && (
                        <div className="flex items-center gap-1">
                          <CheckCircle2 className="h-4 w-4 text-green-600" />
                          <span>Closed: {formatDate(issue.closed_date)}</span>
                        </div>
                      )}
                    </div>

                    {issue.resolution && (
                      <div className="p-3 rounded-lg bg-muted/50 border border-border">
                        <p className="text-sm">
                          <span className="font-medium">Resolution:</span> {issue.resolution}
                        </p>
                      </div>
                    )}
                  </div>

                  <div className="flex gap-2">
                    {!issue.closed_date && (
                      <>
                        <Button size="sm" variant="outline">
                          Update
                        </Button>
                        <Button size="sm" variant="default">
                          Resolve
                        </Button>
                      </>
                    )}
                  </div>
                </div>
              </CardContent>
            </Card>
          ))}

          {sortedIssues.length === 0 && (
            <Card>
              <CardContent className="py-12 text-center text-muted-foreground">
                No issues or risks found matching your criteria
              </CardContent>
            </Card>
          )}
        </div>
      </div>
    </MainLayout>
  );
}
