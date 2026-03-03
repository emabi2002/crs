'use client';

import { useState, useEffect } from 'react';
import { useRouter, useParams } from 'next/navigation';
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
import { ArrowLeft, Save, Loader2, FileText, Trash2 } from 'lucide-react';
import Link from 'next/link';
import { supabase } from '@/lib/supabase/client';
import { getAgencies, getFundingSources, getOfficers, getTenderById } from '@/lib/data-service';
import type { Agency, FundingSource, Officer, Tender } from '@/lib/types';

export default function EditTenderPage() {
  const router = useRouter();
  const params = useParams();
  const tenderId = params.id as string;

  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [agencies, setAgencies] = useState<Agency[]>([]);
  const [fundingSources, setFundingSources] = useState<FundingSource[]>([]);
  const [officers, setOfficers] = useState<Officer[]>([]);
  const [tender, setTender] = useState<Tender | null>(null);

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
        const [agenciesData, fundingData, officersData, tenderData] = await Promise.all([
          getAgencies(),
          getFundingSources(),
          getOfficers(),
          getTenderById(tenderId),
        ]);

        setAgencies(agenciesData);
        setFundingSources(fundingData);
        setOfficers(officersData);
        setTender(tenderData);

        if (tenderData) {
          setFormData({
            tender_no: tenderData.tender_no || '',
            project_title: tenderData.project_title || '',
            project_description: tenderData.project_description || '',
            agency_id: tenderData.agency_id || '',
            procurement_method: tenderData.procurement_method || 'Open Tender',
            estimated_value: tenderData.estimated_value?.toString() || '',
            funding_source_id: tenderData.funding_source_id || '',
            officer_id: tenderData.officer_id || '',
            status_code: tenderData.status_code || 'Draft',
            issued_date: tenderData.issued_date || '',
            closing_datetime: tenderData.closing_datetime?.split('+')[0] || '',
            category: (tenderData as any).category || 'Works',
          });
        }
      } catch (error) {
        console.error('Error fetching data:', error);
      } finally {
        setLoading(false);
      }
    }
    fetchData();
  }, [tenderId]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);

    try {
      const { error } = await supabase
        .from('tenders')
        .update({
          tender_no: formData.tender_no,
          agency_id: formData.agency_id,
          project_title: formData.project_title,
          project_description: formData.project_description,
          procurement_method: formData.procurement_method,
          estimated_value: formData.estimated_value ? parseFloat(formData.estimated_value) : null,
          funding_source_id: formData.funding_source_id || null,
          officer_id: formData.officer_id || null,
          status_code: formData.status_code,
          issued_date: formData.issued_date || null,
          closing_datetime: formData.closing_datetime || null,
          category: formData.category,
          updated_at: new Date().toISOString(),
        })
        .eq('id', tenderId);

      if (error) {
        console.error('Error updating tender:', error);
        alert(`Error updating tender: ${error.message}`);
        setSaving(false);
        return;
      }

      alert('Tender updated successfully!');
      router.push(`/tenders/${tenderId}`);
    } catch (error) {
      console.error('Error:', error);
      alert('Failed to update tender. Please try again.');
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

  if (!tender) {
    return (
      <MainLayout>
        <div className="flex flex-col items-center justify-center h-96 gap-4">
          <p className="text-lg text-muted-foreground">Tender not found</p>
          <Link href="/tenders">
            <Button>Back to Tenders</Button>
          </Link>
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
              <BreadcrumbLink href={`/tenders/${tenderId}`}>{tender.tender_no}</BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>Edit</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-4">
            <Link href={`/tenders/${tenderId}`}>
              <Button variant="ghost" size="icon">
                <ArrowLeft className="h-5 w-5" />
              </Button>
            </Link>
            <div className="flex items-center gap-3">
              <div className="p-2 bg-primary/10 rounded-lg">
                <FileText className="h-6 w-6 text-primary" />
              </div>
              <div>
                <h1 className="text-2xl font-bold">Edit Tender</h1>
                <p className="text-muted-foreground">{tender.tender_no}</p>
              </div>
            </div>
          </div>
        </div>

        <form onSubmit={handleSubmit} className="space-y-6">
          {/* Basic Information */}
          <Card>
            <CardHeader>
              <CardTitle>Basic Information</CardTitle>
              <CardDescription>Tender identification and project details</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="tender_no">Tender Number *</Label>
                  <Input
                    id="tender_no"
                    value={formData.tender_no}
                    onChange={(e) => handleChange('tender_no', e.target.value)}
                    required
                  />
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
                      <SelectItem value="Cancelled">Cancelled</SelectItem>
                    </SelectContent>
                  </Select>
                </div>
              </div>

              <div className="space-y-2">
                <Label htmlFor="project_title">Project Title *</Label>
                <Input
                  id="project_title"
                  value={formData.project_title}
                  onChange={(e) => handleChange('project_title', e.target.value)}
                  required
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="project_description">Project Description</Label>
                <Textarea
                  id="project_description"
                  value={formData.project_description}
                  onChange={(e) => handleChange('project_description', e.target.value)}
                  rows={4}
                />
              </div>

              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="category">Category</Label>
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
              <CardTitle>Agency & Assignment</CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="agency_id">Procuring Agency *</Label>
                  <Select
                    value={formData.agency_id}
                    onValueChange={(value) => handleChange('agency_id', value)}
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

          {/* Financial & Timeline */}
          <Card>
            <CardHeader>
              <CardTitle>Financial & Timeline</CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="estimated_value">Estimated Value (PGK)</Label>
                  <Input
                    id="estimated_value"
                    type="number"
                    step="0.01"
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

              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="issued_date">Issue Date</Label>
                  <Input
                    id="issued_date"
                    type="date"
                    value={formData.issued_date}
                    onChange={(e) => handleChange('issued_date', e.target.value)}
                  />
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
          <div className="flex justify-between">
            <Button type="button" variant="destructive" className="gap-2">
              <Trash2 className="h-4 w-4" />
              Delete Tender
            </Button>
            <div className="flex gap-4">
              <Link href={`/tenders/${tenderId}`}>
                <Button type="button" variant="outline">
                  Cancel
                </Button>
              </Link>
              <Button type="submit" disabled={saving}>
                {saving ? (
                  <>
                    <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                    Saving...
                  </>
                ) : (
                  <>
                    <Save className="h-4 w-4 mr-2" />
                    Save Changes
                  </>
                )}
              </Button>
            </div>
          </div>
        </form>
      </div>
    </MainLayout>
  );
}
