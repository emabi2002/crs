'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { MainLayout } from '@/components/layout/main-layout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Textarea } from '@/components/ui/textarea';
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select';
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from '@/components/ui/breadcrumb';
import { ArrowLeft, Save, Loader2, FileText, Calendar, DollarSign, Building2 } from 'lucide-react';
import Link from 'next/link';
import { supabase } from '@/lib/supabase/client';
import { getAgencies, getFundingSources, getOfficers } from '@/lib/data-service';
import type { Agency, FundingSource, Officer } from '@/lib/types';

export default function NewTenderPage() {
  const router = useRouter();
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [agencies, setAgencies] = useState<Agency[]>([]);
  const [fundingSources, setFundingSources] = useState<FundingSource[]>([]);
  const [officers, setOfficers] = useState<Officer[]>([]);

  const [formData, setFormData] = useState({
    tender_no: '',
    project_title: '',
    project_description: '',
    agency_id: '',
    procurement_method: 'Open Tender',
    estimated_value: '',
    funding_source_id: '',
    officer_id: '',
    status_code: 'Draft',
    issued_date: '',
    closing_datetime: '',
    category: 'Works',
  });

  useEffect(() => {
    async function fetchData() {
      try {
        const [agenciesData, fundingData, officersData] = await Promise.all([
          getAgencies(),
          getFundingSources(),
          getOfficers(),
        ]);
        setAgencies(agenciesData);
        setFundingSources(fundingData);
        setOfficers(officersData);
      } catch (error) {
        console.error('Error fetching data:', error);
      } finally {
        setLoading(false);
      }
    }
    fetchData();
  }, []);

  const generateTenderNo = () => {
    const year = new Date().getFullYear();
    const random = Math.floor(Math.random() * 900) + 100;
    return `NPC${year}-${random}`;
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);

    try {
      const tenderId = crypto.randomUUID ? crypto.randomUUID() : `t-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;
      const tenderNo = formData.tender_no || generateTenderNo();

      const { error } = await supabase.from('tenders').insert({
        id: tenderId,
        tender_no: tenderNo,
        agency_id: formData.agency_id,
        project_title: formData.project_title,
        project_description: formData.project_description,
        procurement_method: formData.procurement_method,
        estimated_value: formData.estimated_value ? parseFloat(formData.estimated_value) : null,
        funding_source_id: formData.funding_source_id || null,
        officer_id: formData.officer_id || null,
        status_code: formData.status_code,
        issued_date: formData.issued_date || new Date().toISOString().split('T')[0],
        closing_datetime: formData.closing_datetime || null,
        category: formData.category,
        created_by: formData.officer_id || null,
        updated_by: formData.officer_id || null,
      });

      if (error) {
        console.error('Error creating tender:', error);
        alert(`Error creating tender: ${error.message}`);
        setSaving(false);
        return;
      }

      alert('Tender created successfully!');
      router.push(`/tenders/${tenderId}`);
    } catch (error) {
      console.error('Error:', error);
      alert('Failed to create tender. Please try again.');
    } finally {
      setSaving(false);
    }
  };

  const handleChange = (field: string, value: string) => {
    setFormData((prev) => ({ ...prev, [field]: value }));
  };

  if (loading) {
    return (
      <MainLayout>
        <div className="flex items-center justify-center h-96">
          <Loader2 className="h-8 w-8 animate-spin text-primary" />
        </div>
      </MainLayout>
    );
  }

  return (
    <MainLayout>
      <div className="space-y-6 max-w-4xl mx-auto">
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
              <BreadcrumbPage>New Tender</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="flex items-center gap-4">
          <Link href="/tenders">
            <Button variant="ghost" size="icon">
              <ArrowLeft className="h-5 w-5" />
            </Button>
          </Link>
          <div className="flex items-center gap-3">
            <div className="p-2 bg-primary/10 rounded-lg">
              <FileText className="h-6 w-6 text-primary" />
            </div>
            <div>
              <h1 className="text-2xl font-bold">Register New Tender</h1>
              <p className="text-muted-foreground">Enter the tender details to create a new procurement record</p>
            </div>
          </div>
        </div>

        <form onSubmit={handleSubmit} className="space-y-6">
          {/* Basic Information */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <FileText className="h-5 w-5" />
                Basic Information
              </CardTitle>
              <CardDescription>Tender identification and project details</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="tender_no">Tender Number</Label>
                  <Input
                    id="tender_no"
                    placeholder="Auto-generated if left blank"
                    value={formData.tender_no}
                    onChange={(e) => handleChange('tender_no', e.target.value)}
                  />
                  <p className="text-xs text-muted-foreground">Leave blank to auto-generate (e.g., NPC2026-001)</p>
                </div>
                <div className="space-y-2">
                  <Label htmlFor="status_code">Status *</Label>
                  <Select
                    value={formData.status_code}
                    onValueChange={(value) => handleChange('status_code', value)}
                  >
                    <SelectTrigger>
                      <SelectValue placeholder="Select status" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="Draft">Draft</SelectItem>
                      <SelectItem value="Issued">Issued</SelectItem>
                      <SelectItem value="Active">Active</SelectItem>
                      <SelectItem value="Closed">Closed</SelectItem>
                      <SelectItem value="Evaluation">Evaluation</SelectItem>
                      <SelectItem value="Submitted for Approval">Submitted for Approval</SelectItem>
                      <SelectItem value="Approved">Approved</SelectItem>
                      <SelectItem value="Awarded">Awarded</SelectItem>
                    </SelectContent>
                  </Select>
                </div>
              </div>

              <div className="space-y-2">
                <Label htmlFor="project_title">Project Title *</Label>
                <Input
                  id="project_title"
                  placeholder="Enter project title"
                  value={formData.project_title}
                  onChange={(e) => handleChange('project_title', e.target.value)}
                  required
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="project_description">Project Description</Label>
                <Textarea
                  id="project_description"
                  placeholder="Enter detailed project description, scope of work, and deliverables..."
                  value={formData.project_description}
                  onChange={(e) => handleChange('project_description', e.target.value)}
                  rows={4}
                />
              </div>

              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="category">Category *</Label>
                  <Select
                    value={formData.category}
                    onValueChange={(value) => handleChange('category', value)}
                  >
                    <SelectTrigger>
                      <SelectValue placeholder="Select category" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="Works">Works</SelectItem>
                      <SelectItem value="Goods">Goods</SelectItem>
                      <SelectItem value="Services">Services</SelectItem>
                      <SelectItem value="Consulting">Consulting</SelectItem>
                    </SelectContent>
                  </Select>
                </div>
                <div className="space-y-2">
                  <Label htmlFor="procurement_method">Procurement Method</Label>
                  <Select
                    value={formData.procurement_method}
                    onValueChange={(value) => handleChange('procurement_method', value)}
                  >
                    <SelectTrigger>
                      <SelectValue placeholder="Select method" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="Open Tender">Open Tender</SelectItem>
                      <SelectItem value="Restricted Tender">Restricted Tender</SelectItem>
                      <SelectItem value="Single Source">Single Source</SelectItem>
                      <SelectItem value="Request for Quotation">Request for Quotation</SelectItem>
                      <SelectItem value="Framework Agreement">Framework Agreement</SelectItem>
                    </SelectContent>
                  </Select>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Agency & Officer */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Building2 className="h-5 w-5" />
                Agency & Assignment
              </CardTitle>
              <CardDescription>Procuring entity and responsible officer</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="agency_id">Procuring Agency *</Label>
                  <Select
                    value={formData.agency_id}
                    onValueChange={(value) => handleChange('agency_id', value)}
                    required
                  >
                    <SelectTrigger>
                      <SelectValue placeholder="Select agency" />
                    </SelectTrigger>
                    <SelectContent>
                      {agencies.map((agency) => (
                        <SelectItem key={agency.id} value={agency.id}>
                          {agency.abbreviation ? `${agency.abbreviation} - ` : ''}{agency.name}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                </div>
                <div className="space-y-2">
                  <Label htmlFor="officer_id">Action Officer</Label>
                  <Select
                    value={formData.officer_id}
                    onValueChange={(value) => handleChange('officer_id', value)}
                  >
                    <SelectTrigger>
                      <SelectValue placeholder="Select officer" />
                    </SelectTrigger>
                    <SelectContent>
                      {officers.map((officer) => (
                        <SelectItem key={officer.id} value={officer.id}>
                          {officer.full_name}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Financial Details */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <DollarSign className="h-5 w-5" />
                Financial Details
              </CardTitle>
              <CardDescription>Budget and funding information</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="estimated_value">Estimated Value (PGK)</Label>
                  <Input
                    id="estimated_value"
                    type="number"
                    step="0.01"
                    placeholder="e.g., 5000000"
                    value={formData.estimated_value}
                    onChange={(e) => handleChange('estimated_value', e.target.value)}
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="funding_source_id">Funding Source</Label>
                  <Select
                    value={formData.funding_source_id}
                    onValueChange={(value) => handleChange('funding_source_id', value)}
                  >
                    <SelectTrigger>
                      <SelectValue placeholder="Select funding source" />
                    </SelectTrigger>
                    <SelectContent>
                      {fundingSources.map((fs) => (
                        <SelectItem key={fs.id} value={fs.id}>
                          {fs.name}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Timeline */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Calendar className="h-5 w-5" />
                Timeline
              </CardTitle>
              <CardDescription>Key dates for the tender process</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="issued_date">Issue Date</Label>
                  <Input
                    id="issued_date"
                    type="date"
                    value={formData.issued_date}
                    onChange={(e) => handleChange('issued_date', e.target.value)}
                  />
                  <p className="text-xs text-muted-foreground">Defaults to today if left blank</p>
                </div>
                <div className="space-y-2">
                  <Label htmlFor="closing_datetime">Closing Date & Time</Label>
                  <Input
                    id="closing_datetime"
                    type="datetime-local"
                    value={formData.closing_datetime}
                    onChange={(e) => handleChange('closing_datetime', e.target.value)}
                  />
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Actions */}
          <div className="flex justify-end gap-4">
            <Link href="/tenders">
              <Button type="button" variant="outline">
                Cancel
              </Button>
            </Link>
            <Button type="submit" disabled={saving}>
              {saving ? (
                <>
                  <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                  Creating...
                </>
              ) : (
                <>
                  <Save className="h-4 w-4 mr-2" />
                  Create Tender
                </>
              )}
            </Button>
          </div>
        </form>
      </div>
    </MainLayout>
  );
}
