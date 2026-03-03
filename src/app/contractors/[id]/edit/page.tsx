'use client';

import { useState, useEffect } from 'react';
import { useRouter, useParams } from 'next/navigation';
import { MainLayout } from '@/components/layout/main-layout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Checkbox } from '@/components/ui/checkbox';
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
import { ArrowLeft, Save, Loader2, Building2, Trash2 } from 'lucide-react';
import Link from 'next/link';
import { supabase } from '@/lib/supabase/client';
import { getContractorById } from '@/lib/data-service';
import type { Contractor } from '@/lib/types';

const provinces = [
  'NCD', 'Central', 'Gulf', 'Milne Bay', 'Oro (Northern)', 'Western',
  'Bougainville', 'East New Britain', 'West New Britain', 'New Ireland', 'Manus',
  'Eastern Highlands', 'Chimbu (Simbu)', 'Western Highlands', 'Enga',
  'Southern Highlands', 'Hela', 'Jiwaka', 'Morobe', 'Madang',
  'East Sepik', 'Sandaun (West Sepik)', 'Overseas',
];

const categoriesList = [
  { id: 'Works', label: 'Works (Construction)' },
  { id: 'Goods', label: 'Goods (Supply)' },
  { id: 'Services', label: 'Services' },
  { id: 'Consulting', label: 'Consulting' },
];

export default function EditContractorPage() {
  const router = useRouter();
  const params = useParams();
  const contractorId = params.id as string;

  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [contractor, setContractor] = useState<Contractor | null>(null);
  const [selectedCategories, setSelectedCategories] = useState<string[]>([]);

  const [formData, setFormData] = useState({
    legal_name: '',
    trading_name: '',
    ipa_registration_no: '',
    tax_id: '',
    address: '',
    province: 'NCD',
    contact_person: '',
    phone: '',
    email: '',
    status: 'Active',
  });

  useEffect(() => {
    async function fetchData() {
      try {
        const contractorData = await getContractorById(contractorId);
        setContractor(contractorData);

        if (contractorData) {
          setFormData({
            legal_name: contractorData.legal_name || '',
            trading_name: contractorData.trading_name || '',
            ipa_registration_no: contractorData.ipa_registration_no || '',
            tax_id: contractorData.tax_id || '',
            address: contractorData.address || '',
            province: contractorData.province || 'NCD',
            contact_person: contractorData.contact_person || '',
            phone: contractorData.phone || '',
            email: contractorData.email || '',
            status: contractorData.status || 'Active',
          });
          setSelectedCategories(contractorData.categories || []);
        }
      } catch (error) {
        console.error('Error fetching data:', error);
      } finally {
        setLoading(false);
      }
    }
    fetchData();
  }, [contractorId]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);

    try {
      const { error } = await supabase
        .from('contractors')
        .update({
          legal_name: formData.legal_name,
          trading_name: formData.trading_name || formData.legal_name,
          ipa_registration_no: formData.ipa_registration_no || null,
          tax_id: formData.tax_id || null,
          address: formData.address || null,
          province: formData.province,
          contact_person: formData.contact_person || null,
          phone: formData.phone || null,
          email: formData.email || null,
          status: formData.status,
          categories: selectedCategories,
          updated_at: new Date().toISOString(),
        })
        .eq('id', contractorId);

      if (error) {
        console.error('Error updating contractor:', error);
        alert('Error updating contractor: ' + error.message);
        setSaving(false);
        return;
      }

      alert('Contractor updated successfully!');
      router.push('/contractors/' + contractorId);
    } catch (error) {
      console.error('Error:', error);
      alert('Failed to update contractor.');
    } finally {
      setSaving(false);
    }
  };

  const handleChange = (field: string, value: string) => {
    setFormData((prev) => ({ ...prev, [field]: value }));
  };

  const toggleCategory = (categoryId: string) => {
    setSelectedCategories((prev) =>
      prev.includes(categoryId)
        ? prev.filter((c) => c !== categoryId)
        : [...prev, categoryId]
    );
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

  if (!contractor) {
    return (
      <MainLayout>
        <div className="flex flex-col items-center justify-center h-96 gap-4">
          <p className="text-lg text-muted-foreground">Contractor not found</p>
          <Link href="/contractors">
            <Button>Back to Contractors</Button>
          </Link>
        </div>
      </MainLayout>
    );
  }

  return (
    <MainLayout>
      <div className="space-y-6 max-w-4xl mx-auto">
        <Breadcrumb>
          <BreadcrumbList>
            <BreadcrumbItem>
              <BreadcrumbLink href="/">Dashboard</BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbLink href="/contractors">Contractors</BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>Edit</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        <div className="flex items-center gap-4">
          <Link href={'/contractors/' + contractorId}>
            <Button variant="ghost" size="icon">
              <ArrowLeft className="h-5 w-5" />
            </Button>
          </Link>
          <div className="flex items-center gap-3">
            <div className="p-2 bg-primary/10 rounded-lg">
              <Building2 className="h-6 w-6 text-primary" />
            </div>
            <div>
              <h1 className="text-2xl font-bold">Edit Contractor</h1>
              <p className="text-muted-foreground">{contractor.trading_name || contractor.legal_name}</p>
            </div>
          </div>
        </div>

        <form onSubmit={handleSubmit} className="space-y-6">
          <Card>
            <CardHeader>
              <CardTitle>Company Information</CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="legal_name">Legal Name *</Label>
                  <Input id="legal_name" value={formData.legal_name} onChange={(e) => handleChange('legal_name', e.target.value)} required />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="trading_name">Trading Name</Label>
                  <Input id="trading_name" value={formData.trading_name} onChange={(e) => handleChange('trading_name', e.target.value)} />
                </div>
              </div>
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="ipa_registration_no">IPA Number</Label>
                  <Input id="ipa_registration_no" value={formData.ipa_registration_no} onChange={(e) => handleChange('ipa_registration_no', e.target.value)} />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="tax_id">TIN Number</Label>
                  <Input id="tax_id" value={formData.tax_id} onChange={(e) => handleChange('tax_id', e.target.value)} />
                </div>
              </div>
              <div className="space-y-2">
                <Label>Status</Label>
                <Select value={formData.status} onValueChange={(v) => handleChange('status', v)}>
                  <SelectTrigger className="w-48"><SelectValue /></SelectTrigger>
                  <SelectContent>
                    <SelectItem value="Active">Active</SelectItem>
                    <SelectItem value="Inactive">Inactive</SelectItem>
                    <SelectItem value="Suspended">Suspended</SelectItem>
                    <SelectItem value="Blacklisted">Blacklisted</SelectItem>
                  </SelectContent>
                </Select>
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <CardTitle>Categories</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid md:grid-cols-2 gap-4">
                {categoriesList.map((cat) => (
                  <div key={cat.id} className="flex items-center space-x-3 p-3 border rounded-lg">
                    <Checkbox id={cat.id} checked={selectedCategories.includes(cat.id)} onCheckedChange={() => toggleCategory(cat.id)} />
                    <Label htmlFor={cat.id} className="cursor-pointer">{cat.label}</Label>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <CardTitle>Contact & Location</CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="space-y-2">
                <Label htmlFor="contact_person">Contact Person</Label>
                <Input id="contact_person" value={formData.contact_person} onChange={(e) => handleChange('contact_person', e.target.value)} />
              </div>
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="phone">Phone</Label>
                  <Input id="phone" value={formData.phone} onChange={(e) => handleChange('phone', e.target.value)} />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="email">Email</Label>
                  <Input id="email" type="email" value={formData.email} onChange={(e) => handleChange('email', e.target.value)} />
                </div>
              </div>
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label>Province</Label>
                  <Select value={formData.province} onValueChange={(v) => handleChange('province', v)}>
                    <SelectTrigger><SelectValue /></SelectTrigger>
                    <SelectContent>
                      {provinces.map((p) => (<SelectItem key={p} value={p}>{p}</SelectItem>))}
                    </SelectContent>
                  </Select>
                </div>
                <div className="space-y-2">
                  <Label htmlFor="address">Address</Label>
                  <Input id="address" value={formData.address} onChange={(e) => handleChange('address', e.target.value)} />
                </div>
              </div>
            </CardContent>
          </Card>

          <div className="flex justify-between">
            <Button type="button" variant="destructive" className="gap-2">
              <Trash2 className="h-4 w-4" /> Delete
            </Button>
            <div className="flex gap-4">
              <Link href={'/contractors/' + contractorId}>
                <Button type="button" variant="outline">Cancel</Button>
              </Link>
              <Button type="submit" disabled={saving}>
                {saving ? <><Loader2 className="h-4 w-4 mr-2 animate-spin" />Saving...</> : <><Save className="h-4 w-4 mr-2" />Save Changes</>}
              </Button>
            </div>
          </div>
        </form>
      </div>
    </MainLayout>
  );
}
