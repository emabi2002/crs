'use client';

import { MainLayout } from '@/components/layout/main-layout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Switch } from '@/components/ui/switch';
import { Separator } from '@/components/ui/separator';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import {
  Settings,
  Building2,
  Database,
  Bell,
  Shield,
  FileText,
  Mail,
  Globe,
  Palette,
  Save,
} from 'lucide-react';
import { agencies, fundingSources } from '@/lib/mock-data';

export default function SettingsPage() {
  return (
    <MainLayout>
      <div className="space-y-6">
        {/* Page Header */}
        <div>
          <h1 className="text-2xl font-bold tracking-tight">Settings</h1>
          <p className="text-muted-foreground">System configuration and preferences</p>
        </div>

        {/* Settings Tabs */}
        <Tabs defaultValue="general" className="space-y-6">
          <TabsList className="grid w-full grid-cols-2 lg:grid-cols-5 h-auto gap-2 bg-transparent p-0">
            <TabsTrigger
              value="general"
              className="data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
            >
              <Settings className="h-4 w-4 mr-2" />
              General
            </TabsTrigger>
            <TabsTrigger
              value="agencies"
              className="data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
            >
              <Building2 className="h-4 w-4 mr-2" />
              Agencies
            </TabsTrigger>
            <TabsTrigger
              value="reference"
              className="data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
            >
              <Database className="h-4 w-4 mr-2" />
              Reference Data
            </TabsTrigger>
            <TabsTrigger
              value="notifications"
              className="data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
            >
              <Bell className="h-4 w-4 mr-2" />
              Notifications
            </TabsTrigger>
            <TabsTrigger
              value="security"
              className="data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
            >
              <Shield className="h-4 w-4 mr-2" />
              Security
            </TabsTrigger>
          </TabsList>

          {/* General Settings */}
          <TabsContent value="general" className="space-y-6">
            <Card>
              <CardHeader>
                <CardTitle className="text-lg">Organization Settings</CardTitle>
                <CardDescription>
                  Configure your organization details
                </CardDescription>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="grid md:grid-cols-2 gap-6">
                  <div className="space-y-2">
                    <Label>Organization Name</Label>
                    <Input defaultValue="National Procurement Commission" />
                  </div>
                  <div className="space-y-2">
                    <Label>Abbreviation</Label>
                    <Input defaultValue="NPC" />
                  </div>
                  <div className="space-y-2">
                    <Label>Country</Label>
                    <Input defaultValue="Papua New Guinea" />
                  </div>
                  <div className="space-y-2">
                    <Label>Currency</Label>
                    <Input defaultValue="PGK (Kina)" />
                  </div>
                  <div className="space-y-2">
                    <Label>Contact Email</Label>
                    <Input defaultValue="info@npc.gov.pg" />
                  </div>
                  <div className="space-y-2">
                    <Label>Contact Phone</Label>
                    <Input defaultValue="+675 303 8800" />
                  </div>
                </div>
                <div className="flex justify-end">
                  <Button>
                    <Save className="h-4 w-4 mr-2" />
                    Save Changes
                  </Button>
                </div>
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <CardTitle className="text-lg">System Preferences</CardTitle>
                <CardDescription>
                  Configure default system behavior
                </CardDescription>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-medium">Default Tender Numbering</p>
                    <p className="text-sm text-muted-foreground">
                      Auto-generate tender numbers in format NPC{'{YEAR}'}-{'{SEQ}'}
                    </p>
                  </div>
                  <Switch defaultChecked />
                </div>
                <Separator />
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-medium">Require Document Upload</p>
                    <p className="text-sm text-muted-foreground">
                      Mandate document attachments for status changes
                    </p>
                  </div>
                  <Switch defaultChecked />
                </div>
                <Separator />
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-medium">Enable Audit Trail</p>
                    <p className="text-sm text-muted-foreground">
                      Log all user actions and changes
                    </p>
                  </div>
                  <Switch defaultChecked />
                </div>
              </CardContent>
            </Card>
          </TabsContent>

          {/* Agencies */}
          <TabsContent value="agencies" className="space-y-6">
            <Card>
              <CardHeader className="flex flex-row items-center justify-between">
                <div>
                  <CardTitle className="text-lg">Registered Agencies</CardTitle>
                  <CardDescription>
                    Government agencies using the system
                  </CardDescription>
                </div>
                <Button size="sm">Add Agency</Button>
              </CardHeader>
              <CardContent>
                <div className="space-y-3">
                  {agencies.map((agency) => (
                    <div
                      key={agency.id}
                      className="flex items-center justify-between p-4 rounded-lg border border-border"
                    >
                      <div className="flex items-center gap-4">
                        <div className="w-10 h-10 rounded-lg bg-primary/10 flex items-center justify-center">
                          <Building2 className="h-5 w-5 text-primary" />
                        </div>
                        <div>
                          <p className="font-medium">{agency.name}</p>
                          <p className="text-sm text-muted-foreground">
                            {agency.abbreviation} | {agency.level} | {agency.sector}
                          </p>
                        </div>
                      </div>
                      <Button variant="ghost" size="sm">
                        Edit
                      </Button>
                    </div>
                  ))}
                </div>
              </CardContent>
            </Card>
          </TabsContent>

          {/* Reference Data */}
          <TabsContent value="reference" className="space-y-6">
            <div className="grid md:grid-cols-2 gap-6">
              <Card>
                <CardHeader className="flex flex-row items-center justify-between">
                  <div>
                    <CardTitle className="text-lg">Funding Sources</CardTitle>
                    <CardDescription>Available funding categories</CardDescription>
                  </div>
                  <Button size="sm" variant="outline">
                    Add
                  </Button>
                </CardHeader>
                <CardContent>
                  <div className="space-y-2">
                    {fundingSources.map((source) => (
                      <div
                        key={source.id}
                        className="flex items-center justify-between p-3 rounded-lg border border-border"
                      >
                        <div>
                          <p className="font-medium text-sm">{source.name}</p>
                          {source.donor_name && (
                            <p className="text-xs text-muted-foreground">{source.donor_name}</p>
                          )}
                        </div>
                      </div>
                    ))}
                  </div>
                </CardContent>
              </Card>

              <Card>
                <CardHeader className="flex flex-row items-center justify-between">
                  <div>
                    <CardTitle className="text-lg">Procurement Methods</CardTitle>
                    <CardDescription>Available procurement types</CardDescription>
                  </div>
                  <Button size="sm" variant="outline">
                    Add
                  </Button>
                </CardHeader>
                <CardContent>
                  <div className="space-y-2">
                    {[
                      'Open Tender',
                      'Restricted Tender',
                      'Single Source',
                      'Request for Quotation',
                      'Framework Agreement',
                    ].map((method) => (
                      <div
                        key={method}
                        className="flex items-center justify-between p-3 rounded-lg border border-border"
                      >
                        <p className="font-medium text-sm">{method}</p>
                      </div>
                    ))}
                  </div>
                </CardContent>
              </Card>

              <Card>
                <CardHeader className="flex flex-row items-center justify-between">
                  <div>
                    <CardTitle className="text-lg">Tender Status Codes</CardTitle>
                    <CardDescription>Workflow status definitions</CardDescription>
                  </div>
                </CardHeader>
                <CardContent>
                  <div className="space-y-2">
                    {[
                      { status: 'Draft', color: 'bg-gray-100' },
                      { status: 'Issued', color: 'bg-sky-100' },
                      { status: 'Active', color: 'bg-emerald-100' },
                      { status: 'Closed', color: 'bg-amber-100' },
                      { status: 'Evaluation', color: 'bg-purple-100' },
                      { status: 'Submitted for Approval', color: 'bg-indigo-100' },
                      { status: 'Approved', color: 'bg-teal-100' },
                      { status: 'Awarded', color: 'bg-green-100' },
                    ].map((item) => (
                      <div
                        key={item.status}
                        className="flex items-center gap-3 p-3 rounded-lg border border-border"
                      >
                        <div className={`w-3 h-3 rounded-full ${item.color}`} />
                        <p className="font-medium text-sm">{item.status}</p>
                      </div>
                    ))}
                  </div>
                </CardContent>
              </Card>

              <Card>
                <CardHeader className="flex flex-row items-center justify-between">
                  <div>
                    <CardTitle className="text-lg">Approval Types</CardTitle>
                    <CardDescription>Approval authority levels</CardDescription>
                  </div>
                </CardHeader>
                <CardContent>
                  <div className="space-y-2">
                    {['TFEC', 'NPC Board', 'NEC', 'Agency Board', 'Department Head'].map((type) => (
                      <div
                        key={type}
                        className="flex items-center justify-between p-3 rounded-lg border border-border"
                      >
                        <p className="font-medium text-sm">{type}</p>
                      </div>
                    ))}
                  </div>
                </CardContent>
              </Card>
            </div>
          </TabsContent>

          {/* Notifications */}
          <TabsContent value="notifications" className="space-y-6">
            <Card>
              <CardHeader>
                <CardTitle className="text-lg">Email Notifications</CardTitle>
                <CardDescription>Configure system email alerts</CardDescription>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-medium">Tender Closing Reminders</p>
                    <p className="text-sm text-muted-foreground">
                      Send reminders 7, 3, and 1 days before closing
                    </p>
                  </div>
                  <Switch defaultChecked />
                </div>
                <Separator />
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-medium">Milestone Due Alerts</p>
                    <p className="text-sm text-muted-foreground">
                      Alert contract managers of upcoming milestones
                    </p>
                  </div>
                  <Switch defaultChecked />
                </div>
                <Separator />
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-medium">Approval Request Notifications</p>
                    <p className="text-sm text-muted-foreground">
                      Notify approvers when submissions are received
                    </p>
                  </div>
                  <Switch defaultChecked />
                </div>
                <Separator />
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-medium">Issue/Risk Alerts</p>
                    <p className="text-sm text-muted-foreground">
                      Alert owners of high severity issues
                    </p>
                  </div>
                  <Switch defaultChecked />
                </div>
              </CardContent>
            </Card>
          </TabsContent>

          {/* Security */}
          <TabsContent value="security" className="space-y-6">
            <Card>
              <CardHeader>
                <CardTitle className="text-lg">Access Control</CardTitle>
                <CardDescription>Configure system security settings</CardDescription>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-medium">Two-Factor Authentication</p>
                    <p className="text-sm text-muted-foreground">
                      Require 2FA for all admin users
                    </p>
                  </div>
                  <Switch />
                </div>
                <Separator />
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-medium">Session Timeout</p>
                    <p className="text-sm text-muted-foreground">
                      Auto logout after 30 minutes of inactivity
                    </p>
                  </div>
                  <Switch defaultChecked />
                </div>
                <Separator />
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-medium">IP Whitelist</p>
                    <p className="text-sm text-muted-foreground">
                      Restrict access to specific IP addresses
                    </p>
                  </div>
                  <Switch />
                </div>
                <Separator />
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-medium">Row Level Security (RLS)</p>
                    <p className="text-sm text-muted-foreground">
                      Enable agency-based data isolation
                    </p>
                  </div>
                  <Switch defaultChecked />
                </div>
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <CardTitle className="text-lg">Role Permissions</CardTitle>
                <CardDescription>Configure role-based access</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="space-y-4">
                  {[
                    { role: 'Admin', description: 'Full system access', color: 'bg-red-100 text-red-700' },
                    { role: 'Management', description: 'View all, approve actions', color: 'bg-purple-100 text-purple-700' },
                    { role: 'Procurement Officer', description: 'CRUD within assigned agency', color: 'bg-blue-100 text-blue-700' },
                    { role: 'Viewer', description: 'Read-only access', color: 'bg-gray-100 text-gray-700' },
                    { role: 'Auditor', description: 'Read + export rights', color: 'bg-amber-100 text-amber-700' },
                  ].map((item) => (
                    <div
                      key={item.role}
                      className="flex items-center justify-between p-4 rounded-lg border border-border"
                    >
                      <div className="flex items-center gap-4">
                        <span className={`px-3 py-1 rounded-full text-sm font-medium ${item.color}`}>
                          {item.role}
                        </span>
                        <p className="text-sm text-muted-foreground">{item.description}</p>
                      </div>
                      <Button variant="ghost" size="sm">
                        Configure
                      </Button>
                    </div>
                  ))}
                </div>
              </CardContent>
            </Card>
          </TabsContent>
        </Tabs>
      </div>
    </MainLayout>
  );
}
