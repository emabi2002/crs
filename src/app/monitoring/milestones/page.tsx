'use client';

import { useState } from 'react';
import { MainLayout } from '@/components/layout/main-layout';
import { StatusBadge } from '@/components/ui/status-badge';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Progress } from '@/components/ui/progress';
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
  Search,
  Download,
  Calendar,
  CheckCircle2,
  Clock,
  AlertTriangle,
  XCircle,
} from 'lucide-react';
import { contractMilestones, getEnrichedContracts } from '@/lib/mock-data';
import type { MilestoneStatus } from '@/lib/types';

const formatDate = (date: string) => {
  return new Date(date).toLocaleDateString('en-GB', {
    day: '2-digit',
    month: 'short',
    year: 'numeric',
  });
};

const getStatusIcon = (status: MilestoneStatus) => {
  switch (status) {
    case 'Completed':
      return <CheckCircle2 className="h-4 w-4 text-green-600" />;
    case 'In Progress':
      return <Clock className="h-4 w-4 text-blue-600" />;
    case 'Overdue':
      return <AlertTriangle className="h-4 w-4 text-red-600" />;
    case 'Not Started':
      return <XCircle className="h-4 w-4 text-gray-400" />;
    default:
      return null;
  }
};

export default function MilestonesPage() {
  const [searchQuery, setSearchQuery] = useState('');
  const [statusFilter, setStatusFilter] = useState<string>('all');

  const allContracts = getEnrichedContracts();

  // Enrich milestones with contract info
  const enrichedMilestones = contractMilestones.map((milestone) => {
    const contract = allContracts.find((c) => c.id === milestone.contract_award_id);
    return { ...milestone, contract };
  });

  const filteredMilestones = enrichedMilestones.filter((milestone) => {
    const matchesSearch =
      searchQuery === '' ||
      milestone.milestone_name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      milestone.contract?.tender?.project_title?.toLowerCase().includes(searchQuery.toLowerCase()) ||
      milestone.contract?.contractor?.legal_name.toLowerCase().includes(searchQuery.toLowerCase());

    const matchesStatus = statusFilter === 'all' || milestone.status === statusFilter;

    return matchesSearch && matchesStatus;
  });

  // Sort by due date
  const sortedMilestones = [...filteredMilestones].sort(
    (a, b) => new Date(a.due_date).getTime() - new Date(b.due_date).getTime()
  );

  const stats = {
    total: contractMilestones.length,
    completed: contractMilestones.filter((m) => m.status === 'Completed').length,
    inProgress: contractMilestones.filter((m) => m.status === 'In Progress').length,
    overdue: contractMilestones.filter((m) => m.status === 'Overdue').length,
    notStarted: contractMilestones.filter((m) => m.status === 'Not Started').length,
  };

  const completionRate = stats.total > 0 ? (stats.completed / stats.total) * 100 : 0;

  return (
    <MainLayout>
      <div className="space-y-6">
        {/* Page Header */}
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
          <div>
            <h1 className="text-2xl font-bold tracking-tight">Milestone Tracking</h1>
            <p className="text-muted-foreground">
              Monitor contract milestone progress and deliverables
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
        <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
          <Card>
            <CardContent className="pt-6">
              <div className="text-center">
                <p className="text-3xl font-bold">{stats.total}</p>
                <p className="text-sm text-muted-foreground">Total</p>
              </div>
            </CardContent>
          </Card>
          <Card className="bg-green-50 border-green-200">
            <CardContent className="pt-6">
              <div className="text-center">
                <p className="text-3xl font-bold text-green-700">{stats.completed}</p>
                <p className="text-sm text-green-600">Completed</p>
              </div>
            </CardContent>
          </Card>
          <Card className="bg-blue-50 border-blue-200">
            <CardContent className="pt-6">
              <div className="text-center">
                <p className="text-3xl font-bold text-blue-700">{stats.inProgress}</p>
                <p className="text-sm text-blue-600">In Progress</p>
              </div>
            </CardContent>
          </Card>
          <Card className="bg-red-50 border-red-200">
            <CardContent className="pt-6">
              <div className="text-center">
                <p className="text-3xl font-bold text-red-700">{stats.overdue}</p>
                <p className="text-sm text-red-600">Overdue</p>
              </div>
            </CardContent>
          </Card>
          <Card className="bg-gray-50 border-gray-200">
            <CardContent className="pt-6">
              <div className="text-center">
                <p className="text-3xl font-bold text-gray-700">{stats.notStarted}</p>
                <p className="text-sm text-gray-600">Not Started</p>
              </div>
            </CardContent>
          </Card>
        </div>

        {/* Overall Progress */}
        <Card>
          <CardHeader>
            <CardTitle className="text-lg">Overall Completion</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-2">
              <div className="flex items-center justify-between">
                <span className="text-sm text-muted-foreground">
                  {stats.completed} of {stats.total} milestones completed
                </span>
                <span className="font-semibold">{completionRate.toFixed(0)}%</span>
              </div>
              <Progress value={completionRate} className="h-3" />
            </div>
          </CardContent>
        </Card>

        {/* Filters */}
        <Card>
          <CardContent className="pt-6">
            <div className="flex flex-col md:flex-row gap-4">
              <div className="relative flex-1">
                <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                <Input
                  placeholder="Search milestones, projects, or contractors..."
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
                  <SelectItem value="Not Started">Not Started</SelectItem>
                  <SelectItem value="In Progress">In Progress</SelectItem>
                  <SelectItem value="Completed">Completed</SelectItem>
                  <SelectItem value="Overdue">Overdue</SelectItem>
                </SelectContent>
              </Select>
            </div>
          </CardContent>
        </Card>

        {/* Milestones Table */}
        <Card>
          <CardHeader>
            <CardTitle className="text-lg">Milestones ({filteredMilestones.length})</CardTitle>
            <CardDescription>Sorted by due date</CardDescription>
          </CardHeader>
          <CardContent>
            <div className="rounded-lg border border-border overflow-hidden">
              <Table>
                <TableHeader>
                  <TableRow className="bg-muted/50">
                    <TableHead className="w-[50px]">#</TableHead>
                    <TableHead>Milestone</TableHead>
                    <TableHead>Contract / Project</TableHead>
                    <TableHead>Contractor</TableHead>
                    <TableHead>Due Date</TableHead>
                    <TableHead>Completion</TableHead>
                    <TableHead>Status</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {sortedMilestones.map((milestone) => (
                    <TableRow
                      key={milestone.id}
                      className={`hover:bg-muted/30 ${
                        milestone.status === 'Overdue' ? 'bg-red-50/50' : ''
                      }`}
                    >
                      <TableCell className="font-medium text-muted-foreground">
                        {milestone.milestone_no}
                      </TableCell>
                      <TableCell>
                        <div className="flex items-center gap-2">
                          {getStatusIcon(milestone.status)}
                          <span className="font-medium">{milestone.milestone_name}</span>
                        </div>
                      </TableCell>
                      <TableCell>
                        <div>
                          <p className="text-sm font-medium truncate max-w-[200px]">
                            {milestone.contract?.tender?.project_title}
                          </p>
                          <p className="text-xs text-muted-foreground">
                            {milestone.contract?.contract_no}
                          </p>
                        </div>
                      </TableCell>
                      <TableCell className="text-sm">
                        {milestone.contract?.contractor?.trading_name ||
                          milestone.contract?.contractor?.legal_name}
                      </TableCell>
                      <TableCell className="text-sm">
                        <div className="flex items-center gap-1">
                          <Calendar className="h-4 w-4 text-muted-foreground" />
                          {formatDate(milestone.due_date)}
                        </div>
                      </TableCell>
                      <TableCell className="text-sm">
                        {milestone.completion_date ? formatDate(milestone.completion_date) : '-'}
                      </TableCell>
                      <TableCell>
                        <StatusBadge status={milestone.status} size="sm" />
                      </TableCell>
                    </TableRow>
                  ))}
                  {sortedMilestones.length === 0 && (
                    <TableRow>
                      <TableCell colSpan={7} className="text-center py-8 text-muted-foreground">
                        No milestones found
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
