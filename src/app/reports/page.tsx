'use client';

import { MainLayout } from '@/components/layout/main-layout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import {
  FileText,
  Download,
  BarChart3,
  PieChart,
  TrendingUp,
  Calendar,
  Building2,
  DollarSign,
  AlertTriangle,
  CheckCircle2,
  Clock,
  Users,
  FileBarChart,
  ArrowRight,
} from 'lucide-react';

const reportCategories = [
  {
    title: 'Pipeline & Governance',
    description: 'Tender pipeline and approval tracking reports',
    icon: FileText,
    color: 'bg-blue-100 text-blue-600',
    reports: [
      { name: 'Tender Pipeline by Stage', description: 'Count and value by status', type: 'Dashboard' },
      { name: 'Tenders Issued vs Closed vs Awarded', description: 'Monthly trend analysis', type: 'Chart' },
      { name: 'Average Cycle Time Report', description: 'From issue to award', type: 'Table' },
      { name: 'Aging Report', description: 'Tenders stuck in stage > X days', type: 'Table' },
      { name: 'Approvals Register', description: 'TFEC/Board decisions', type: 'Table' },
      { name: 'Single Source Register', description: 'Justifications and outcomes', type: 'Table' },
    ],
  },
  {
    title: 'Financial & Portfolio',
    description: 'Contract values and spending analysis',
    icon: DollarSign,
    color: 'bg-emerald-100 text-emerald-600',
    reports: [
      { name: 'Awarded Value by Agency', description: 'Sector and province breakdown', type: 'Chart' },
      { name: 'Funding Source Breakdown', description: 'GoPNG vs Donor vs Own Source', type: 'Chart' },
      { name: 'Top 20 Contractors', description: 'By total awarded value', type: 'Table' },
      { name: 'Concentration Risk Analysis', description: 'Top contractors portfolio share', type: 'Chart' },
      { name: 'Monthly Spend Report', description: 'Award values over time', type: 'Chart' },
    ],
  },
  {
    title: 'Delivery & Performance',
    description: 'Contract implementation and monitoring',
    icon: TrendingUp,
    color: 'bg-amber-100 text-amber-600',
    reports: [
      { name: 'Project Delivery Status', description: 'On track, delayed, critical', type: 'Dashboard' },
      { name: 'Milestone Compliance', description: 'Due vs completed vs overdue', type: 'Table' },
      { name: 'Variation Analysis', description: 'Frequency, cost growth, extensions', type: 'Chart' },
      { name: 'Issue & Risk Heatmap', description: 'Severity distribution', type: 'Chart' },
      { name: 'Contract Completion Performance', description: 'Planned vs actual dates', type: 'Table' },
      { name: 'Contractor Performance Summary', description: 'Ratings and trends', type: 'Table' },
    ],
  },
  {
    title: 'Compliance & Integrity',
    description: 'Audit and compliance tracking',
    icon: CheckCircle2,
    color: 'bg-purple-100 text-purple-600',
    reports: [
      { name: 'Non-Compliance Register', description: 'Bid and contract compliance', type: 'Table' },
      { name: 'Contractor Watchlist', description: 'Performance concerns', type: 'Table' },
      { name: 'Suspension/Blacklist Report', description: 'Related awards and actions', type: 'Table' },
      { name: 'Audit Trail Export', description: 'Workflow events and approvals', type: 'Export' },
      { name: 'Document Completeness', description: 'Missing documentation report', type: 'Table' },
    ],
  },
];

const quickStats = [
  { label: 'Total Portfolio Value', value: 'K232M', icon: DollarSign, color: 'text-emerald-600' },
  { label: 'Active Contracts', value: '5', icon: FileText, color: 'text-blue-600' },
  { label: 'Pending Approvals', value: '2', icon: Clock, color: 'text-amber-600' },
  { label: 'Overdue Milestones', value: '1', icon: AlertTriangle, color: 'text-red-600' },
];

export default function ReportsPage() {
  return (
    <MainLayout>
      <div className="space-y-6">
        {/* Page Header */}
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
          <div>
            <h1 className="text-2xl font-bold tracking-tight">Reports & Dashboards</h1>
            <p className="text-muted-foreground">
              Management reporting pack and analytics
            </p>
          </div>
          <div className="flex items-center gap-2">
            <Button variant="outline" size="sm">
              <Calendar className="h-4 w-4 mr-2" />
              Schedule Report
            </Button>
            <Button size="sm">
              <FileBarChart className="h-4 w-4 mr-2" />
              Custom Report
            </Button>
          </div>
        </div>

        {/* Quick Stats */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          {quickStats.map((stat) => {
            const Icon = stat.icon;
            return (
              <Card key={stat.label}>
                <CardContent className="pt-6">
                  <div className="flex items-center gap-4">
                    <div className={`p-3 rounded-lg bg-muted/50 ${stat.color}`}>
                      <Icon className="h-6 w-6" />
                    </div>
                    <div>
                      <p className="text-2xl font-bold">{stat.value}</p>
                      <p className="text-sm text-muted-foreground">{stat.label}</p>
                    </div>
                  </div>
                </CardContent>
              </Card>
            );
          })}
        </div>

        {/* Executive Dashboard Card */}
        <Card className="bg-gradient-to-r from-primary/10 to-primary/5 border-primary/20">
          <CardContent className="p-6">
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
              <div className="flex items-center gap-4">
                <div className="p-4 rounded-xl bg-primary/10">
                  <BarChart3 className="h-8 w-8 text-primary" />
                </div>
                <div>
                  <h3 className="text-lg font-semibold">Executive Dashboard</h3>
                  <p className="text-sm text-muted-foreground">
                    Real-time portfolio overview with key metrics and alerts
                  </p>
                </div>
              </div>
              <Button>
                Open Dashboard
                <ArrowRight className="h-4 w-4 ml-2" />
              </Button>
            </div>
          </CardContent>
        </Card>

        {/* Report Categories */}
        <div className="grid md:grid-cols-2 gap-6">
          {reportCategories.map((category) => {
            const Icon = category.icon;
            return (
              <Card key={category.title}>
                <CardHeader>
                  <div className="flex items-center gap-3">
                    <div className={`p-2 rounded-lg ${category.color}`}>
                      <Icon className="h-5 w-5" />
                    </div>
                    <div>
                      <CardTitle className="text-lg">{category.title}</CardTitle>
                      <CardDescription>{category.description}</CardDescription>
                    </div>
                  </div>
                </CardHeader>
                <CardContent>
                  <div className="space-y-3">
                    {category.reports.map((report) => (
                      <div
                        key={report.name}
                        className="flex items-center justify-between p-3 rounded-lg border border-border hover:bg-muted/50 transition-colors cursor-pointer group"
                      >
                        <div className="flex-1">
                          <p className="font-medium text-sm group-hover:text-primary transition-colors">
                            {report.name}
                          </p>
                          <p className="text-xs text-muted-foreground">{report.description}</p>
                        </div>
                        <div className="flex items-center gap-2">
                          <Badge variant="outline" className="text-xs">
                            {report.type}
                          </Badge>
                          <Button variant="ghost" size="icon" className="h-8 w-8 opacity-0 group-hover:opacity-100 transition-opacity">
                            <Download className="h-4 w-4" />
                          </Button>
                        </div>
                      </div>
                    ))}
                  </div>
                </CardContent>
              </Card>
            );
          })}
        </div>

        {/* Recently Generated */}
        <Card>
          <CardHeader>
            <CardTitle className="text-lg">Recently Generated Reports</CardTitle>
            <CardDescription>Your recent report exports</CardDescription>
          </CardHeader>
          <CardContent>
            <div className="space-y-3">
              {[
                { name: 'Tender Pipeline Report', date: '2026-02-06 09:30', format: 'PDF', size: '245 KB' },
                { name: 'Monthly Spend Analysis - January 2026', date: '2026-02-01 14:15', format: 'Excel', size: '128 KB' },
                { name: 'Contractor Performance Summary Q4 2025', date: '2026-01-15 11:00', format: 'PDF', size: '512 KB' },
                { name: 'Approval Register Export', date: '2026-01-10 16:45', format: 'CSV', size: '45 KB' },
              ].map((report) => (
                <div
                  key={report.name}
                  className="flex items-center justify-between p-3 rounded-lg border border-border"
                >
                  <div className="flex items-center gap-3">
                    <FileText className="h-5 w-5 text-muted-foreground" />
                    <div>
                      <p className="font-medium text-sm">{report.name}</p>
                      <p className="text-xs text-muted-foreground">{report.date}</p>
                    </div>
                  </div>
                  <div className="flex items-center gap-3">
                    <Badge variant="outline">{report.format}</Badge>
                    <span className="text-xs text-muted-foreground">{report.size}</span>
                    <Button variant="ghost" size="icon" className="h-8 w-8">
                      <Download className="h-4 w-4" />
                    </Button>
                  </div>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      </div>
    </MainLayout>
  );
}
