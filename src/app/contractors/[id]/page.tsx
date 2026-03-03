'use client';

import { useState, useEffect } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { MainLayout } from '@/components/layout/main-layout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Badge } from '@/components/ui/badge';
import { Skeleton } from '@/components/ui/skeleton';
import { Textarea } from '@/components/ui/textarea';
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select';
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog';
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table';
import {
  ArrowLeft,
  Building2,
  MapPin,
  Phone,
  Mail,
  User,
  FileText,
  Edit,
  Save,
  X,
  Calendar,
  DollarSign,
  Star,
  AlertTriangle,
  CheckCircle2,
} from 'lucide-react';
import { getContractorById, getContractAwards } from '@/lib/data-service';
import { supabase } from '@/lib/supabase/client';
import type { Contractor, ContractAward } from '@/lib/types';
import Link from 'next/link';

const formatCurrency = (value: number) => {
  if (value >= 1000000) {
    return `K${(value / 1000000).toFixed(1)}M`;
  }
  return `K${(value / 1000).toFixed(0)}K`;
};

const formatDate = (date: string | null | undefined) => {
  if (!date) return '-';
  return new Date(date).toLocaleDateString('en-GB', {
    day: '2-digit',
    month: 'short',
    year: 'numeric',
  });
};

const getStatusColor = (status: string) => {
  switch (status) {
    case 'Active':
      return 'bg-green-100 text-green-700 border-green-200';
    case 'Suspended':
      return 'bg-orange-100 text-orange-700 border-orange-200';
    case 'Blacklisted':
      return 'bg-red-100 text-red-700 border-red-200';
    default:
      return 'bg-gray-100 text-gray-700 border-gray-200';
  }
};

const getCategoryColor = (category: string) => {
  switch (category) {
    case 'Works':
      return 'bg-blue-100 text-blue-700';
    case 'Goods':
      return 'bg-purple-100 text-purple-700';
    case 'Services':
      return 'bg-amber-100 text-amber-700';
    case 'Consulting':
      return 'bg-teal-100 text-teal-700';
    default:
      return 'bg-gray-100 text-gray-700';
  }
};

// Check if value is placeholder
const isPlaceholder = (value: string | undefined | null): boolean => {
  if (!value) return true;
  const placeholders = ['675 300 0000', 'info@contractor.com.pg', 'Contact Person', 'Port Moresby'];
  return placeholders.includes(value.trim());
};

export default function ContractorDetailPage() {
  const params = useParams();
  const router = useRouter();
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [contractor, setContractor] = useState<Contractor | null>(null);
  const [contracts, setContracts] = useState<ContractAward[]>([]);
  const [isEditing, setIsEditing] = useState(false);
  const [editForm, setEditForm] = useState({
    contact_person: '',
    phone: '',
    email: '',
    address: '',
    province: '',
    district: '',
    ipa_registration_no: '',
    tax_id: '',
  });

  useEffect(() => {
    async function fetchData() {
      try {
        const contractorData = await getContractorById(params.id as string);
        if (contractorData) {
          setContractor(contractorData);
          setEditForm({
            contact_person: isPlaceholder(contractorData.contact_person) ? '' : contractorData.contact_person || '',
            phone: isPlaceholder(contractorData.phone) ? '' : contractorData.phone || '',
            email: isPlaceholder(contractorData.email) ? '' : contractorData.email || '',
            address: isPlaceholder(contractorData.address) ? '' : contractorData.address || '',
            province: contractorData.province || '',
            district: contractorData.district || '',
            ipa_registration_no: contractorData.ipa_registration_no || '',
            tax_id: contractorData.tax_id || '',
          });
        }

        const allContracts = await getContractAwards();
        const contractorContracts = allContracts.filter(
          (c) => c.contractor_id === params.id
        );
        setContracts(contractorContracts);
      } catch (error) {
        console.error('Error fetching contractor:', error);
      } finally {
        setLoading(false);
      }
    }
    fetchData();
  }, [params.id]);

  const handleSave = async () => {
    if (!contractor) return;
    setSaving(true);

    try {
      const { error } = await supabase
        .from('contractors')
        .update({
          contact_person: editForm.contact_person || 'Contact Person',
          phone: editForm.phone || '675 300 0000',
          email: editForm.email || 'info@contractor.com.pg',
          address: editForm.address || 'Port Moresby',
          province: editForm.province || 'NCD',
          district: editForm.district || null,
          ipa_registration_no: editForm.ipa_registration_no || null,
          tax_id: editForm.tax_id || null,
        })
        .eq('id', contractor.id);

      if (error) {
        console.error('Error updating contractor:', error);
        alert('Failed to update contractor. Please try again.');
      } else {
        // Refresh contractor data
        const updatedContractor = await getContractorById(contractor.id);
        if (updatedContractor) {
          setContractor(updatedContractor);
        }
        setIsEditing(false);
        alert('Contractor updated successfully!');
      }
    } catch (error) {
      console.error('Error saving:', error);
      alert('Failed to save changes.');
    } finally {
      setSaving(false);
    }
  };

  const totalAwarded = contracts.reduce((sum, c) => sum + (Number(c.contract_value) || 0), 0);
  const activeContracts = contracts.filter((c) => c.status === 'Active' || c.status === 'Under Implementation').length;

  if (loading) {
    return (
      <MainLayout>
        <div className="space-y-6">
          <Skeleton className="h-10 w-64" />
          <div className="grid lg:grid-cols-3 gap-6">
            <Skeleton className="h-96 lg:col-span-1" />
            <Skeleton className="h-96 lg:col-span-2" />
          </div>
        </div>
      </MainLayout>
    );
  }

  if (!contractor) {
    return (
      <MainLayout>
        <div className="text-center py-12">
          <h2 className="text-xl font-semibold mb-2">Contractor not found</h2>
          <p className="text-muted-foreground mb-4">The contractor you're looking for doesn't exist.</p>
          <Link href="/contractors">
            <Button>
              <ArrowLeft className="h-4 w-4 mr-2" />
              Back to Contractors
            </Button>
          </Link>
        </div>
      </MainLayout>
    );
  }

  return (
    <MainLayout>
      <div className="space-y-6">
        {/* Header */}
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-4">
            <Link href="/contractors">
              <Button variant="ghost" size="icon">
                <ArrowLeft className="h-5 w-5" />
              </Button>
            </Link>
            <div>
              <h1 className="text-2xl font-bold">
                {contractor.trading_name || contractor.legal_name}
              </h1>
              {contractor.trading_name && contractor.trading_name !== contractor.legal_name && (
                <p className="text-muted-foreground">{contractor.legal_name}</p>
              )}
            </div>
          </div>
          <Badge className={getStatusColor(contractor.status)}>{contractor.status}</Badge>
        </div>

        <div className="grid lg:grid-cols-3 gap-6">
          {/* Profile Card */}
          <Card className="lg:col-span-1">
            <CardHeader className="flex flex-row items-center justify-between">
              <CardTitle className="text-lg">Profile</CardTitle>
              <Button
                variant="outline"
                size="sm"
                onClick={() => setIsEditing(!isEditing)}
              >
                {isEditing ? (
                  <>
                    <X className="h-4 w-4 mr-2" />
                    Cancel
                  </>
                ) : (
                  <>
                    <Edit className="h-4 w-4 mr-2" />
                    Edit
                  </>
                )}
              </Button>
            </CardHeader>
            <CardContent className="space-y-4">
              {isEditing ? (
                /* Edit Form */
                <div className="space-y-4">
                  <div>
                    <Label htmlFor="contact_person">Contact Person</Label>
                    <Input
                      id="contact_person"
                      value={editForm.contact_person}
                      onChange={(e) => setEditForm({ ...editForm, contact_person: e.target.value })}
                      placeholder="Enter contact person name"
                    />
                  </div>
                  <div>
                    <Label htmlFor="phone">Phone</Label>
                    <Input
                      id="phone"
                      value={editForm.phone}
                      onChange={(e) => setEditForm({ ...editForm, phone: e.target.value })}
                      placeholder="e.g., 675 123 4567"
                    />
                  </div>
                  <div>
                    <Label htmlFor="email">Email</Label>
                    <Input
                      id="email"
                      type="email"
                      value={editForm.email}
                      onChange={(e) => setEditForm({ ...editForm, email: e.target.value })}
                      placeholder="e.g., contact@company.com.pg"
                    />
                  </div>
                  <div>
                    <Label htmlFor="address">Address</Label>
                    <Textarea
                      id="address"
                      value={editForm.address}
                      onChange={(e) => setEditForm({ ...editForm, address: e.target.value })}
                      placeholder="Enter full address"
                      rows={2}
                    />
                  </div>
                  <div className="grid grid-cols-2 gap-2">
                    <div>
                      <Label htmlFor="province">Province</Label>
                      <Input
                        id="province"
                        value={editForm.province}
                        onChange={(e) => setEditForm({ ...editForm, province: e.target.value })}
                        placeholder="e.g., NCD"
                      />
                    </div>
                    <div>
                      <Label htmlFor="district">District</Label>
                      <Input
                        id="district"
                        value={editForm.district}
                        onChange={(e) => setEditForm({ ...editForm, district: e.target.value })}
                        placeholder="Optional"
                      />
                    </div>
                  </div>
                  <div>
                    <Label htmlFor="ipa_registration_no">IPA Registration No.</Label>
                    <Input
                      id="ipa_registration_no"
                      value={editForm.ipa_registration_no}
                      onChange={(e) => setEditForm({ ...editForm, ipa_registration_no: e.target.value })}
                      placeholder="e.g., IPA-123456"
                    />
                  </div>
                  <div>
                    <Label htmlFor="tax_id">Tax ID</Label>
                    <Input
                      id="tax_id"
                      value={editForm.tax_id}
                      onChange={(e) => setEditForm({ ...editForm, tax_id: e.target.value })}
                      placeholder="e.g., TIN-123456"
                    />
                  </div>
                  <Button
                    className="w-full"
                    onClick={handleSave}
                    disabled={saving}
                  >
                    {saving ? (
                      'Saving...'
                    ) : (
                      <>
                        <Save className="h-4 w-4 mr-2" />
                        Save Changes
                      </>
                    )}
                  </Button>
                </div>
              ) : (
                /* View Mode */
                <div className="space-y-4">
                  <div className="flex items-start gap-3">
                    <User className="h-5 w-5 text-muted-foreground mt-0.5" />
                    <div>
                      <p className="text-sm text-muted-foreground">Contact Person</p>
                      <p className="font-medium">
                        {isPlaceholder(contractor.contact_person) ? 'Not provided' : contractor.contact_person}
                      </p>
                    </div>
                  </div>
                  <div className="flex items-start gap-3">
                    <Phone className="h-5 w-5 text-muted-foreground mt-0.5" />
                    <div>
                      <p className="text-sm text-muted-foreground">Phone</p>
                      <p className="font-medium">
                        {isPlaceholder(contractor.phone) ? 'Not provided' : contractor.phone}
                      </p>
                    </div>
                  </div>
                  <div className="flex items-start gap-3">
                    <Mail className="h-5 w-5 text-muted-foreground mt-0.5" />
                    <div>
                      <p className="text-sm text-muted-foreground">Email</p>
                      <p className="font-medium">
                        {isPlaceholder(contractor.email) ? 'Not provided' : contractor.email}
                      </p>
                    </div>
                  </div>
                  <div className="flex items-start gap-3">
                    <MapPin className="h-5 w-5 text-muted-foreground mt-0.5" />
                    <div>
                      <p className="text-sm text-muted-foreground">Location</p>
                      <p className="font-medium">
                        {contractor.district ? `${contractor.district}, ` : ''}
                        {contractor.province}
                      </p>
                      {!isPlaceholder(contractor.address) && (
                        <p className="text-sm text-muted-foreground">{contractor.address}</p>
                      )}
                    </div>
                  </div>
                  <div className="flex items-start gap-3">
                    <FileText className="h-5 w-5 text-muted-foreground mt-0.5" />
                    <div>
                      <p className="text-sm text-muted-foreground">Registration</p>
                      <p className="font-medium">
                        {contractor.ipa_registration_no || 'Not provided'}
                      </p>
                      {contractor.tax_id && (
                        <p className="text-sm text-muted-foreground">Tax ID: {contractor.tax_id}</p>
                      )}
                    </div>
                  </div>
                  <div className="pt-2">
                    <p className="text-sm text-muted-foreground mb-2">Categories</p>
                    <div className="flex flex-wrap gap-1">
                      {(contractor.categories || []).map((category) => (
                        <span
                          key={category}
                          className={`text-xs px-2 py-1 rounded-full ${getCategoryColor(category)}`}
                        >
                          {category}
                        </span>
                      ))}
                    </div>
                  </div>
                </div>
              )}
            </CardContent>
          </Card>

          {/* Performance & Contracts */}
          <div className="lg:col-span-2 space-y-6">
            {/* Stats */}
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
              <Card>
                <CardContent className="pt-6 text-center">
                  <DollarSign className="h-8 w-8 mx-auto text-emerald-600 mb-2" />
                  <p className="text-2xl font-bold">{formatCurrency(totalAwarded)}</p>
                  <p className="text-sm text-muted-foreground">Total Awarded</p>
                </CardContent>
              </Card>
              <Card>
                <CardContent className="pt-6 text-center">
                  <FileText className="h-8 w-8 mx-auto text-blue-600 mb-2" />
                  <p className="text-2xl font-bold">{contracts.length}</p>
                  <p className="text-sm text-muted-foreground">Total Contracts</p>
                </CardContent>
              </Card>
              <Card>
                <CardContent className="pt-6 text-center">
                  <CheckCircle2 className="h-8 w-8 mx-auto text-green-600 mb-2" />
                  <p className="text-2xl font-bold">{activeContracts}</p>
                  <p className="text-sm text-muted-foreground">Active</p>
                </CardContent>
              </Card>
              <Card>
                <CardContent className="pt-6 text-center">
                  <Star className="h-8 w-8 mx-auto text-amber-500 mb-2" />
                  <p className="text-2xl font-bold">-</p>
                  <p className="text-sm text-muted-foreground">Rating</p>
                </CardContent>
              </Card>
            </div>

            {/* Contract History */}
            <Card>
              <CardHeader>
                <CardTitle className="text-lg">Contract History</CardTitle>
                <CardDescription>All contracts awarded to this contractor</CardDescription>
              </CardHeader>
              <CardContent>
                {contracts.length > 0 ? (
                  <div className="rounded-lg border overflow-hidden">
                    <Table>
                      <TableHeader>
                        <TableRow className="bg-muted/50">
                          <TableHead>Contract</TableHead>
                          <TableHead>Project</TableHead>
                          <TableHead>Value</TableHead>
                          <TableHead>Period</TableHead>
                          <TableHead>Status</TableHead>
                        </TableRow>
                      </TableHeader>
                      <TableBody>
                        {contracts.map((contract) => (
                          <TableRow key={contract.id}>
                            <TableCell className="font-medium">
                              <Link
                                href={`/contracts/${contract.id}`}
                                className="text-primary hover:underline"
                              >
                                {contract.contract_no || 'N/A'}
                              </Link>
                            </TableCell>
                            <TableCell className="max-w-[200px] truncate">
                              {(contract as any).tender?.project_title || 'N/A'}
                            </TableCell>
                            <TableCell className="font-semibold">
                              {formatCurrency(Number(contract.contract_value) || 0)}
                            </TableCell>
                            <TableCell className="text-sm">
                              {formatDate(contract.commencement_date)} - {formatDate(contract.end_date)}
                            </TableCell>
                            <TableCell>
                              <Badge variant="outline" className={getStatusColor(contract.status)}>
                                {contract.status}
                              </Badge>
                            </TableCell>
                          </TableRow>
                        ))}
                      </TableBody>
                    </Table>
                  </div>
                ) : (
                  <div className="text-center py-8 text-muted-foreground">
                    <FileText className="h-12 w-12 mx-auto mb-3 opacity-50" />
                    <p>No contracts found for this contractor</p>
                  </div>
                )}
              </CardContent>
            </Card>
          </div>
        </div>
      </div>
    </MainLayout>
  );
}
