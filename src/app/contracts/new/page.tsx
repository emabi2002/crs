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
import { ArrowLeft, Save, Loader2 } from 'lucide-react';
import Link from 'next/link';
import { supabase } from '@/lib/supabase/client';
import { getAgencies, getContractors, getFundingSources, getOfficers } from '@/lib/data-service';
import type { Agency, Contractor, FundingSource, Officer } from '@/lib/types';

export default function NewContractPage() {
  const router = useRouter();
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [agencies, setAgencies] = useState<Agency[]>([]);
  const [contractors, setContractors] = useState<Contractor[]>([]);
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
    contractor_id: '',
    contract_value: '',
    contract_no: '',
    commencement_date: '',
    end_date: '',
    award_date: '',
  });

  useEffect(() => {
    async function fetchData() {
      try {
        const [agenciesData, contractorsData, fundingData, officersData] = await Promise.all([
          getAgencies(),
          getContractors(),
          getFundingSources(),
          getOfficers(),
        ]);
        setAgencies(agenciesData);
        setContractors(contractorsData);
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

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);

    try {
      // Generate UUIDs
      const tenderId = crypto.randomUUID ? crypto.randomUUID() : `t-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;
      const contractId = crypto.randomUUID ? crypto.randomUUID() : `c-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;

      // First create the tender
      const { error: tenderError } = await supabase.from('tenders').insert({
        id: tenderId,
        tender_no: formData.tender_no,
        agency_id: formData.agency_id,
        project_title: formData.project_title,
        project_description: formData.project_description,
        procurement_method: formData.procurement_method,
        estimated_value: formData.estimated_value ? parseFloat(formData.estimated_value) : null,
        funding_source_id: formData.funding_source_id || null,
        officer_id: formData.officer_id || null,
        status_code: 'Awarded',
        issued_date: new Date().toISOString().split('T')[0],
        created_by: formData.officer_id || null,
        updated_by: formData.officer_id || null,
      });

      if (tenderError) {
        console.error('Error creating tender:', tenderError);
        alert(`Error creating tender: ${tenderError.message}`);
        setSaving(false);
        return;
      }

      // Then create the contract award
      const { error: contractError } = await supabase.from('contract_awards').insert({
        id: contractId,
        tender_id: tenderId,
        contractor_id: formData.contractor_id,
        award_date: formData.award_date,
        contract_value: parseFloat(formData.contract_value),
        currency: 'PGK',
        contract_no: formData.contract_no,
        commencement_date: formData.commencement_date,
        end_date: formData.end_date,
        status: 'Active',
      });

      if (contractError) {
        console.error('Error creating contract:', contractError);
        alert(`Error creating contract: ${contractError.message}`);
        setSaving(false);
        return;
      }

      alert('Contract created successfully!');
      router.push(`/contracts/${contractId}`);
    } catch (error) {
      console.error('Error:', error);
      alert('Failed to create contract. Please try again.');
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
              <BreadcrumbLink href="/contracts">Contracts</BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>New Contract</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="flex items-center gap-4">
          <Link href="/contracts">
            <Button variant="ghost" size="icon">
              <ArrowLeft className="h-5 w-5" />
            </Button>
          </Link>
          <div>
            <h1 className="text-2xl font-bold">Create New Contract</h1>
            <p className="text-muted-foreground">Enter the contract details below</p>
          </div>
        </div>

        <form onSubmit={handleSubmit} className="space-y-6">
          {/* Tender Information */}
          <Card>
            <CardHeader>
              <CardTitle>Tender Information</CardTitle>
              <CardDescription>Basic tender and project details</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="tender_no">Tender Number *</Label>
                  <Input
                    id="tender_no"
                    placeholder="e.g., NPC2026-001"
                    value={formData.tender_no}
                    onChange={(e) => handleChange('tender_no', e.target.value)}
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="agency_id">Agency *</Label>
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
                  placeholder="Enter detailed project description"
                  value={formData.project_description}
                  onChange={(e) => handleChange('project_description', e.target.value)}
                  rows={3}
                />
              </div>

              <div className="grid md:grid-cols-2 gap-4">
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
                <div className="space-y-2">
                  <Label htmlFor="estimated_value">Estimated Value (PGK)</Label>
                  <Input
                    id="estimated_value"
                    type="number"
                    step="0.01"
                    placeholder="e.g., 1000000"
                    value={formData.estimated_value}
                    onChange={(e) => handleChange('estimated_value', e.target.value)}
                  />
                </div>
              </div>

              <div className="grid md:grid-cols-2 gap-4">
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

          {/* Contract Award Details */}
          <Card>
            <CardHeader>
              <CardTitle>Contract Award Details</CardTitle>
              <CardDescription>Contractor and contract specifics</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="contractor_id">Contractor *</Label>
                  <Select
                    value={formData.contractor_id}
                    onValueChange={(value) => handleChange('contractor_id', value)}
                    required
                  >
                    <SelectTrigger>
                      <SelectValue placeholder="Select contractor" />
                    </SelectTrigger>
                    <SelectContent>
                      {contractors.map((contractor) => (
                        <SelectItem key={contractor.id} value={contractor.id}>
                          {contractor.trading_name || contractor.legal_name}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                </div>
                <div className="space-y-2">
                  <Label htmlFor="contract_no">Contract Number</Label>
                  <Input
                    id="contract_no"
                    placeholder="e.g., CON-NPC2026-001"
                    value={formData.contract_no}
                    onChange={(e) => handleChange('contract_no', e.target.value)}
                  />
                </div>
              </div>

              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="contract_value">Contract Value (PGK) *</Label>
                  <Input
                    id="contract_value"
                    type="number"
                    step="0.01"
                    placeholder="e.g., 1000000"
                    value={formData.contract_value}
                    onChange={(e) => handleChange('contract_value', e.target.value)}
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="award_date">Award Date *</Label>
                  <Input
                    id="award_date"
                    type="date"
                    value={formData.award_date}
                    onChange={(e) => handleChange('award_date', e.target.value)}
                    required
                  />
                </div>
              </div>

              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="commencement_date">Commencement Date *</Label>
                  <Input
                    id="commencement_date"
                    type="date"
                    value={formData.commencement_date}
                    onChange={(e) => handleChange('commencement_date', e.target.value)}
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="end_date">End Date *</Label>
                  <Input
                    id="end_date"
                    type="date"
                    value={formData.end_date}
                    onChange={(e) => handleChange('end_date', e.target.value)}
                    required
                  />
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Actions */}
          <div className="flex justify-end gap-4">
            <Link href="/contracts">
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
                  Create Contract
                </>
              )}
            </Button>
          </div>
        </form>
      </div>
    </MainLayout>
  );
}
