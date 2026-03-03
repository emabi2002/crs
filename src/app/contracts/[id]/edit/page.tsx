'use client';

import { useState, useEffect } from 'react';
import { useRouter, useParams } from 'next/navigation';
import { MainLayout } from '@/components/layout/main-layout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
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
import { ArrowLeft, Save, Loader2, FileCheck, Trash2 } from 'lucide-react';
import Link from 'next/link';
import { supabase } from '@/lib/supabase/client';
import { getContractors, getContractAwardById } from '@/lib/data-service';
import type { Contractor, ContractAward } from '@/lib/types';

export default function EditContractPage() {
  const router = useRouter();
  const params = useParams();
  const contractId = params.id as string;

  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [contractors, setContractors] = useState<Contractor[]>([]);
  const [contract, setContract] = useState<ContractAward | null>(null);

  const [formData, setFormData] = useState({
    contractor_id: '',
    contract_no: '',
    contract_value: '',
    award_date: '',
    commencement_date: '',
    end_date: '',
    status: 'Active',
  });

  useEffect(() => {
    async function fetchData() {
      try {
        const [contractorsData, contractData] = await Promise.all([
          getContractors(),
          getContractAwardById(contractId),
        ]);

        setContractors(contractorsData);
        setContract(contractData);

        if (contractData) {
          setFormData({
            contractor_id: contractData.contractor_id || '',
            contract_no: contractData.contract_no || '',
            contract_value: contractData.contract_value?.toString() || '',
            award_date: contractData.award_date || '',
            commencement_date: contractData.commencement_date || '',
            end_date: contractData.end_date || '',
            status: contractData.status || 'Active',
          });
        }
      } catch (error) {
        console.error('Error fetching data:', error);
      } finally {
        setLoading(false);
      }
    }
    fetchData();
  }, [contractId]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);

    try {
      const { error } = await supabase
        .from('contract_awards')
        .update({
          contractor_id: formData.contractor_id,
          contract_no: formData.contract_no,
          contract_value: formData.contract_value ? parseFloat(formData.contract_value) : null,
          award_date: formData.award_date || null,
          commencement_date: formData.commencement_date || null,
          end_date: formData.end_date || null,
          status: formData.status,
          updated_at: new Date().toISOString(),
        })
        .eq('id', contractId);

      if (error) {
        console.error('Error updating contract:', error);
        alert(`Error updating contract: ${error.message}`);
        setSaving(false);
        return;
      }

      alert('Contract updated successfully!');
      router.push(`/contracts/${contractId}`);
    } catch (error) {
      console.error('Error:', error);
      alert('Failed to update contract. Please try again.');
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

  if (!contract) {
    return (
      <MainLayout>
        <div className="flex flex-col items-center justify-center h-96 gap-4">
          <p className="text-lg text-muted-foreground">Contract not found</p>
          <Link href="/contracts">
            <Button>Back to Contracts</Button>
          </Link>
        </div>
      </MainLayout>
    );
  }

  const tender = (contract as any).tender;

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
              <BreadcrumbLink href={`/contracts/${contractId}`}>
                {contract.contract_no || 'Contract'}
              </BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>Edit</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="flex items-center gap-4">
          <Link href={`/contracts/${contractId}`}>
            <Button variant="ghost" size="icon">
              <ArrowLeft className="h-5 w-5" />
            </Button>
          </Link>
          <div className="flex items-center gap-3">
            <div className="p-2 bg-primary/10 rounded-lg">
              <FileCheck className="h-6 w-6 text-primary" />
            </div>
            <div>
              <h1 className="text-2xl font-bold">Edit Contract</h1>
              <p className="text-muted-foreground">{contract.contract_no}</p>
            </div>
          </div>
        </div>

        {/* Project Info (Read Only) */}
        {tender && (
          <Card className="bg-muted/30">
            <CardHeader>
              <CardTitle className="text-base">Project Information</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid md:grid-cols-2 gap-4 text-sm">
                <div>
                  <p className="text-muted-foreground">Tender Number</p>
                  <p className="font-medium">{tender.tender_no}</p>
                </div>
                <div>
                  <p className="text-muted-foreground">Agency</p>
                  <p className="font-medium">{tender.agency?.abbreviation || tender.agency?.name}</p>
                </div>
                <div className="md:col-span-2">
                  <p className="text-muted-foreground">Project Title</p>
                  <p className="font-medium">{tender.project_title}</p>
                </div>
              </div>
            </CardContent>
          </Card>
        )}

        <form onSubmit={handleSubmit} className="space-y-6">
          {/* Contract Details */}
          <Card>
            <CardHeader>
              <CardTitle>Contract Details</CardTitle>
              <CardDescription>Update contract award information</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="contract_no">Contract Number</Label>
                  <Input
                    id="contract_no"
                    value={formData.contract_no}
                    onChange={(e) => handleChange('contract_no', e.target.value)}
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="status">Status *</Label>
                  <Select
                    value={formData.status}
                    onValueChange={(value) => handleChange('status', value)}
                  >
                    <SelectTrigger>
                      <SelectValue placeholder="Select status" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="Active">Active</SelectItem>
                      <SelectItem value="Under Implementation">Under Implementation</SelectItem>
                      <SelectItem value="Delayed">Delayed</SelectItem>
                      <SelectItem value="Completed">Completed</SelectItem>
                      <SelectItem value="Terminated">Terminated</SelectItem>
                      <SelectItem value="Suspended">Suspended</SelectItem>
                    </SelectContent>
                  </Select>
                </div>
              </div>

              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="contractor_id">Contractor *</Label>
                  <Select
                    value={formData.contractor_id}
                    onValueChange={(value) => handleChange('contractor_id', value)}
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
                  <Label htmlFor="contract_value">Contract Value (PGK) *</Label>
                  <Input
                    id="contract_value"
                    type="number"
                    step="0.01"
                    value={formData.contract_value}
                    onChange={(e) => handleChange('contract_value', e.target.value)}
                    required
                  />
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Dates */}
          <Card>
            <CardHeader>
              <CardTitle>Key Dates</CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid md:grid-cols-3 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="award_date">Award Date</Label>
                  <Input
                    id="award_date"
                    type="date"
                    value={formData.award_date}
                    onChange={(e) => handleChange('award_date', e.target.value)}
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="commencement_date">Commencement Date</Label>
                  <Input
                    id="commencement_date"
                    type="date"
                    value={formData.commencement_date}
                    onChange={(e) => handleChange('commencement_date', e.target.value)}
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="end_date">End Date</Label>
                  <Input
                    id="end_date"
                    type="date"
                    value={formData.end_date}
                    onChange={(e) => handleChange('end_date', e.target.value)}
                  />
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Actions */}
          <div className="flex justify-between">
            <Button type="button" variant="destructive" className="gap-2">
              <Trash2 className="h-4 w-4" />
              Delete Contract
            </Button>
            <div className="flex gap-4">
              <Link href={`/contracts/${contractId}`}>
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
