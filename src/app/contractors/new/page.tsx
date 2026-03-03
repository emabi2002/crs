'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { MainLayout } from '@/components/layout/main-layout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Textarea } from '@/components/ui/textarea';
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
import { ArrowLeft, Save, Loader2, Building2, User, MapPin, Phone, Mail, FileCheck } from 'lucide-react';
import Link from 'next/link';
import { supabase } from '@/lib/supabase/client';

const provinces = [
  'NCD',
  'Central',
  'Gulf',
  'Milne Bay',
  'Oro (Northern)',
  'Western',
  'Bougainville',
  'East New Britain',
  'West New Britain',
  'New Ireland',
  'Manus',
  'Eastern Highlands',
  'Chimbu (Simbu)',
  'Western Highlands',
  'Enga',
  'Southern Highlands',
  'Hela',
  'Jiwaka',
  'Morobe',
  'Madang',
  'East Sepik',
  'Sandaun (West Sepik)',
  'Overseas',
];

const categories = [
  { id: 'Works', label: 'Works (Construction, Civil Engineering)' },
  { id: 'Goods', label: 'Goods (Supply of Materials, Equipment)' },
  { id: 'Services', label: 'Services (General Services, Maintenance)' },
  { id: 'Consulting', label: 'Consulting (Professional Advisory Services)' },
];

export default function NewContractorPage() {
  const router = useRouter();
  const [saving, setSaving] = useState(false);
  const [selectedCategories, setSelectedCategories] = useState<string[]>(['Works']);

  const [formData, setFormData] = useState({
    legal_name: '',
    trading_name: '',
    ipaNumber: '',
    tinNumber: '',
    address: '',
    province: 'NCD',
    contact_person: '',
    phone: '',
    email: '',
    status: 'Active',
    notes: '',
  });

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);

    try {
      const contractorId = crypto.randomUUID ? crypto.randomUUID() : `con-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;

      const { error } = await supabase.from('contractors').insert({
        id: contractorId,
        legal_name: formData.legal_name,
        trading_name: formData.trading_name || formData.legal_name,
        ipa_number: formData.ipaNumber || null,
        tin_number: formData.tinNumber || null,
        address: formData.address || null,
        province: formData.province,
        contact_person: formData.contact_person || null,
        phone: formData.phone || null,
        email: formData.email || null,
        status: formData.status,
        categories: selectedCategories,
      });

      if (error) {
        console.error('Error creating contractor:', error);
        alert(`Error creating contractor: ${error.message}`);
        setSaving(false);
        return;
      }

      alert('Contractor registered successfully!');
      router.push(`/contractors/${contractorId}`);
    } catch (error) {
      console.error('Error:', error);
      alert('Failed to register contractor. Please try again.');
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
              <BreadcrumbLink href="/contractors">Contractors</BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>New Contractor</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="flex items-center gap-4">
          <Link href="/contractors">
            <Button variant="ghost" size="icon">
              <ArrowLeft className="h-5 w-5" />
            </Button>
          </Link>
          <div className="flex items-center gap-3">
            <div className="p-2 bg-primary/10 rounded-lg">
              <Building2 className="h-6 w-6 text-primary" />
            </div>
            <div>
              <h1 className="text-2xl font-bold">Register New Contractor</h1>
              <p className="text-muted-foreground">Add a new contractor to the registry</p>
            </div>
          </div>
        </div>

        <form onSubmit={handleSubmit} className="space-y-6">
          {/* Company Information */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Building2 className="h-5 w-5" />
                Company Information
              </CardTitle>
              <CardDescription>Official company registration details</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="legal_name">Legal Name *</Label>
                  <Input
                    id="legal_name"
                    placeholder="e.g., ABC Construction Limited"
                    value={formData.legal_name}
                    onChange={(e) => handleChange('legal_name', e.target.value)}
                    required
                  />
                  <p className="text-xs text-muted-foreground">As registered with IPA</p>
                </div>
                <div className="space-y-2">
                  <Label htmlFor="trading_name">Trading Name</Label>
                  <Input
                    id="trading_name"
                    placeholder="e.g., ABC Builders"
                    value={formData.trading_name}
                    onChange={(e) => handleChange('trading_name', e.target.value)}
                  />
                  <p className="text-xs text-muted-foreground">Leave blank if same as legal name</p>
                </div>
              </div>

              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="ipaNumber">IPA Registration Number</Label>
                  <Input
                    id="ipaNumber"
                    placeholder="e.g., 1-12345"
                    value={formData.ipaNumber}
                    onChange={(e) => handleChange('ipaNumber', e.target.value)}
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="tinNumber">TIN Number</Label>
                  <Input
                    id="tinNumber"
                    placeholder="e.g., 500123456"
                    value={formData.tinNumber}
                    onChange={(e) => handleChange('tinNumber', e.target.value)}
                  />
                </div>
              </div>

              <div className="space-y-2">
                <Label htmlFor="status">Status *</Label>
                <Select
                  value={formData.status}
                  onValueChange={(value) => handleChange('status', value)}
                >
                  <SelectTrigger className="w-48">
                    <SelectValue placeholder="Select status" />
                  </SelectTrigger>
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

          {/* Categories */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <FileCheck className="h-5 w-5" />
                Business Categories
              </CardTitle>
              <CardDescription>Select the types of work this contractor performs</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="grid md:grid-cols-2 gap-4">
                {categories.map((category) => (
                  <div key={category.id} className="flex items-center space-x-3 p-3 border rounded-lg hover:bg-muted/50 transition-colors">
                    <Checkbox
                      id={category.id}
                      checked={selectedCategories.includes(category.id)}
                      onCheckedChange={() => toggleCategory(category.id)}
                    />
                    <Label htmlFor={category.id} className="cursor-pointer flex-1">
                      {category.label}
                    </Label>
                  </div>
                ))}
              </div>
              {selectedCategories.length === 0 && (
                <p className="text-sm text-destructive mt-2">Please select at least one category</p>
              )}
            </CardContent>
          </Card>

          {/* Contact Information */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <User className="h-5 w-5" />
                Contact Information
              </CardTitle>
              <CardDescription>Primary contact details for this contractor</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="space-y-2">
                <Label htmlFor="contact_person">Contact Person</Label>
                <Input
                  id="contact_person"
                  placeholder="e.g., John Kila"
                  value={formData.contact_person}
                  onChange={(e) => handleChange('contact_person', e.target.value)}
                />
              </div>

              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="phone" className="flex items-center gap-2">
                    <Phone className="h-4 w-4" />
                    Phone Number
                  </Label>
                  <Input
                    id="phone"
                    type="tel"
                    placeholder="e.g., +675 7123 4567"
                    value={formData.phone}
                    onChange={(e) => handleChange('phone', e.target.value)}
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="email" className="flex items-center gap-2">
                    <Mail className="h-4 w-4" />
                    Email Address
                  </Label>
                  <Input
                    id="email"
                    type="email"
                    placeholder="e.g., info@abcconstruction.com.pg"
                    value={formData.email}
                    onChange={(e) => handleChange('email', e.target.value)}
                  />
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Location */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <MapPin className="h-5 w-5" />
                Location
              </CardTitle>
              <CardDescription>Business address and province</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="province">Province *</Label>
                  <Select
                    value={formData.province}
                    onValueChange={(value) => handleChange('province', value)}
                  >
                    <SelectTrigger>
                      <SelectValue placeholder="Select province" />
                    </SelectTrigger>
                    <SelectContent>
                      {provinces.map((province) => (
                        <SelectItem key={province} value={province}>
                          {province}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                </div>
                <div className="space-y-2">
                  <Label htmlFor="address">Business Address</Label>
                  <Input
                    id="address"
                    placeholder="e.g., Section 45, Lot 12, Waigani"
                    value={formData.address}
                    onChange={(e) => handleChange('address', e.target.value)}
                  />
                </div>
              </div>

              <div className="space-y-2">
                <Label htmlFor="notes">Additional Notes</Label>
                <Textarea
                  id="notes"
                  placeholder="Any additional information about this contractor..."
                  value={formData.notes}
                  onChange={(e) => handleChange('notes', e.target.value)}
                  rows={3}
                />
              </div>
            </CardContent>
          </Card>

          {/* Actions */}
          <div className="flex justify-end gap-4">
            <Link href="/contractors">
              <Button type="button" variant="outline">
                Cancel
              </Button>
            </Link>
            <Button type="submit" disabled={saving || selectedCategories.length === 0}>
              {saving ? (
                <>
                  <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                  Registering...
                </>
              ) : (
                <>
                  <Save className="h-4 w-4 mr-2" />
                  Register Contractor
                </>
              )}
            </Button>
          </div>
        </form>
      </div>
    </MainLayout>
  );
}
