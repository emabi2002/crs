'use client';

import { useState, useEffect } from 'react';
import { MainLayout } from '@/components/layout/main-layout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Badge } from '@/components/ui/badge';
import { Skeleton } from '@/components/ui/skeleton';
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
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';
import {
  Search,
  Plus,
  Download,
  MoreHorizontal,
  Eye,
  Edit,
  Building2,
  MapPin,
  Phone,
  Mail,
  Star,
  AlertTriangle,
  FileCheck,
  Briefcase,
} from 'lucide-react';
import { getContractors, getContractAwards } from '@/lib/data-service';
import type { Contractor, ContractAward } from '@/lib/types';
import Link from 'next/link';

const formatCurrency = (value: number) => {
  if (value >= 1000000) {
    return `K${(value / 1000000).toFixed(1)}M`;
  }
  return `K${(value / 1000).toFixed(0)}K`;
};

// Helper function to check if a value is placeholder data
const isPlaceholder = (value: string | undefined | null): boolean => {
  if (!value) return true;
  const placeholders = [
    '675 300 0000',
    'info@contractor.com.pg',
    'Contact Person',
    'Port Moresby',
  ];
  return placeholders.includes(value.trim());
};

// Helper function to check if phone is real
const isRealPhone = (phone: string | undefined | null): boolean => {
  if (!phone) return false;
  return !isPlaceholder(phone) && phone !== '675 300 0000';
};

// Helper function to check if email is real
const isRealEmail = (email: string | undefined | null): boolean => {
  if (!email) return false;
  return !isPlaceholder(email) && email !== 'info@contractor.com.pg';
};

const getStatusColor = (status: Contractor['status']) => {
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

interface EnrichedContractor extends Contractor {
  contract_count: number;
  total_awarded: number;
  avg_rating: number;
}

export default function ContractorsPage() {
  const [loading, setLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState('');
  const [statusFilter, setStatusFilter] = useState<string>('all');
  const [categoryFilter, setCategoryFilter] = useState<string>('all');
  const [viewMode, setViewMode] = useState<'table' | 'cards'>('cards');
  const [contractors, setContractors] = useState<EnrichedContractor[]>([]);

  useEffect(() => {
    async function fetchData() {
      try {
        const [contractorsData, contractsData] = await Promise.all([
          getContractors(),
          getContractAwards(),
        ]);

        // Enrich contractors with contract data
        const enrichedContractors = contractorsData.map((contractor) => {
          const contractorContracts = contractsData.filter((c) => c.contractor_id === contractor.id);
          const totalValue = contractorContracts.reduce((sum, c) => sum + (Number(c.contract_value) || 0), 0);

          return {
            ...contractor,
            contract_count: contractorContracts.length,
            total_awarded: totalValue,
            avg_rating: contractorContracts.length > 0 ? 4.0 : 0, // Default rating
          };
        });

        setContractors(enrichedContractors);
      } catch (error) {
        console.error('Error fetching contractors data:', error);
      } finally {
        setLoading(false);
      }
    }
    fetchData();
  }, []);

  const filteredContractors = contractors.filter((contractor) => {
    const matchesSearch =
      searchQuery === '' ||
      contractor.legal_name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      contractor.trading_name?.toLowerCase().includes(searchQuery.toLowerCase()) ||
      contractor.province.toLowerCase().includes(searchQuery.toLowerCase());

    const matchesStatus = statusFilter === 'all' || contractor.status === statusFilter;
    const matchesCategory =
      categoryFilter === 'all' || (contractor.categories || []).includes(categoryFilter as never);

    return matchesSearch && matchesStatus && matchesCategory;
  });

  const activeCount = contractors.filter((c) => c.status === 'Active').length;
  const suspendedCount = contractors.filter((c) => c.status === 'Suspended').length;
  const contractorsWithContracts = contractors.filter((c) => c.contract_count > 0).length;

  return (
    <MainLayout>
      <div className="space-y-6">
        {/* Page Header */}
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
          <div>
            <h1 className="text-2xl font-bold tracking-tight">Contractors Registry</h1>
            <p className="text-muted-foreground">
              National supplier registry and performance tracking
            </p>
          </div>
          <div className="flex items-center gap-2">
            <Button variant="outline" size="sm">
              <Download className="h-4 w-4 mr-2" />
              Export
            </Button>
            <Button size="sm">
              <Plus className="h-4 w-4 mr-2" />
              Add Contractor
            </Button>
          </div>
        </div>

        {/* Summary Stats */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          {loading ? (
            <>
              <Skeleton className="h-24" />
              <Skeleton className="h-24" />
              <Skeleton className="h-24" />
              <Skeleton className="h-24" />
            </>
          ) : (
            <>
              <Card>
                <CardContent className="pt-6">
                  <div className="flex items-center gap-4">
                    <div className="p-3 rounded-lg bg-primary/10">
                      <Building2 className="h-6 w-6 text-primary" />
                    </div>
                    <div>
                      <p className="text-2xl font-bold">{contractors.length}</p>
                      <p className="text-sm text-muted-foreground">Total Registered</p>
                    </div>
                  </div>
                </CardContent>
              </Card>
              <Card>
                <CardContent className="pt-6">
                  <div className="flex items-center gap-4">
                    <div className="p-3 rounded-lg bg-green-100">
                      <FileCheck className="h-6 w-6 text-green-600" />
                    </div>
                    <div>
                      <p className="text-2xl font-bold">{activeCount}</p>
                      <p className="text-sm text-muted-foreground">Active</p>
                    </div>
                  </div>
                </CardContent>
              </Card>
              <Card>
                <CardContent className="pt-6">
                  <div className="flex items-center gap-4">
                    <div className="p-3 rounded-lg bg-blue-100">
                      <Briefcase className="h-6 w-6 text-blue-600" />
                    </div>
                    <div>
                      <p className="text-2xl font-bold">{contractorsWithContracts}</p>
                      <p className="text-sm text-muted-foreground">With Contracts</p>
                    </div>
                  </div>
                </CardContent>
              </Card>
              <Card>
                <CardContent className="pt-6">
                  <div className="flex items-center gap-4">
                    <div className="p-3 rounded-lg bg-orange-100">
                      <AlertTriangle className="h-6 w-6 text-orange-600" />
                    </div>
                    <div>
                      <p className="text-2xl font-bold">{suspendedCount}</p>
                      <p className="text-sm text-muted-foreground">Suspended</p>
                    </div>
                  </div>
                </CardContent>
              </Card>
            </>
          )}
        </div>

        {/* Filters */}
        <Card>
          <CardContent className="pt-6">
            <div className="flex flex-col md:flex-row gap-4">
              <div className="relative flex-1">
                <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                <Input
                  placeholder="Search by name or location..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="pl-10"
                />
              </div>
              <Select value={statusFilter} onValueChange={setStatusFilter}>
                <SelectTrigger className="w-full md:w-[150px]">
                  <SelectValue placeholder="All Status" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Status</SelectItem>
                  <SelectItem value="Active">Active</SelectItem>
                  <SelectItem value="Suspended">Suspended</SelectItem>
                  <SelectItem value="Blacklisted">Blacklisted</SelectItem>
                </SelectContent>
              </Select>
              <Select value={categoryFilter} onValueChange={setCategoryFilter}>
                <SelectTrigger className="w-full md:w-[150px]">
                  <SelectValue placeholder="All Categories" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Categories</SelectItem>
                  <SelectItem value="Works">Works</SelectItem>
                  <SelectItem value="Goods">Goods</SelectItem>
                  <SelectItem value="Services">Services</SelectItem>
                  <SelectItem value="Consulting">Consulting</SelectItem>
                </SelectContent>
              </Select>
              <div className="flex border rounded-lg overflow-hidden">
                <Button
                  variant={viewMode === 'cards' ? 'default' : 'ghost'}
                  size="sm"
                  onClick={() => setViewMode('cards')}
                  className="rounded-none"
                >
                  Cards
                </Button>
                <Button
                  variant={viewMode === 'table' ? 'default' : 'ghost'}
                  size="sm"
                  onClick={() => setViewMode('table')}
                  className="rounded-none"
                >
                  Table
                </Button>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Loading State */}
        {loading && (
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
            {Array.from({ length: 6 }).map((_, i) => (
              <Card key={i}>
                <CardContent className="p-6">
                  <Skeleton className="h-48" />
                </CardContent>
              </Card>
            ))}
          </div>
        )}

        {/* Contractors List - Cards View */}
        {!loading && viewMode === 'cards' && (
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
            {filteredContractors.map((contractor) => (
              <Card key={contractor.id} className="hover:shadow-md transition-shadow">
                <CardContent className="p-6">
                  <div className="flex items-start justify-between mb-4">
                    <div className="flex-1 min-w-0">
                      <h3 className="font-semibold truncate">
                        {contractor.trading_name || contractor.legal_name}
                      </h3>
                      {contractor.trading_name && contractor.trading_name !== contractor.legal_name && (
                        <p className="text-xs text-muted-foreground truncate">{contractor.legal_name}</p>
                      )}
                    </div>
                    <Badge className={getStatusColor(contractor.status)}>{contractor.status}</Badge>
                  </div>

                  {/* Only show location if it's real data */}
                  <div className="space-y-2 mb-4">
                    <div className="flex items-center gap-2 text-sm text-muted-foreground">
                      <MapPin className="h-4 w-4 flex-shrink-0" />
                      <span>{contractor.province || 'PNG'}</span>
                    </div>
                    {/* Only show phone if it's real data */}
                    {isRealPhone(contractor.phone) && (
                      <div className="flex items-center gap-2 text-sm text-muted-foreground">
                        <Phone className="h-4 w-4 flex-shrink-0" />
                        <span>{contractor.phone}</span>
                      </div>
                    )}
                    {/* Only show email if it's real data */}
                    {isRealEmail(contractor.email) && (
                      <div className="flex items-center gap-2 text-sm text-muted-foreground">
                        <Mail className="h-4 w-4 flex-shrink-0" />
                        <span className="truncate">{contractor.email}</span>
                      </div>
                    )}
                  </div>

                  <div className="flex flex-wrap gap-1 mb-4">
                    {(contractor.categories || []).map((category) => (
                      <span
                        key={category}
                        className={`text-xs px-2 py-0.5 rounded-full ${getCategoryColor(category)}`}
                      >
                        {category}
                      </span>
                    ))}
                  </div>

                  <div className="grid grid-cols-3 gap-2 pt-4 border-t border-border">
                    <div className="text-center">
                      <p className="text-lg font-bold">{contractor.contract_count}</p>
                      <p className="text-xs text-muted-foreground">Contracts</p>
                    </div>
                    <div className="text-center">
                      <p className="text-lg font-bold">
                        {contractor.total_awarded > 0 ? formatCurrency(contractor.total_awarded) : '-'}
                      </p>
                      <p className="text-xs text-muted-foreground">Awarded</p>
                    </div>
                    <div className="text-center">
                      <div className="flex items-center justify-center gap-1">
                        {contractor.contract_count > 0 && (
                          <Star className="h-4 w-4 text-amber-500 fill-amber-500" />
                        )}
                        <p className="text-lg font-bold">
                          {contractor.contract_count > 0 ? '-' : '-'}
                        </p>
                      </div>
                      <p className="text-xs text-muted-foreground">Rating</p>
                    </div>
                  </div>

                  <Link href={`/contractors/${contractor.id}`}>
                    <Button variant="outline" className="w-full mt-4" size="sm">
                      <Eye className="h-4 w-4 mr-2" />
                      View Profile
                    </Button>
                  </Link>
                </CardContent>
              </Card>
            ))}
          </div>
        )}

        {/* Contractors List - Table View */}
        {!loading && viewMode === 'table' && (
          <Card>
            <CardContent className="p-0">
              <div className="rounded-lg border border-border overflow-hidden">
                <Table>
                  <TableHeader>
                    <TableRow className="bg-muted/50">
                      <TableHead>Contractor</TableHead>
                      <TableHead>Location</TableHead>
                      <TableHead>Categories</TableHead>
                      <TableHead>Contracts</TableHead>
                      <TableHead>Total Awarded</TableHead>
                      <TableHead>Status</TableHead>
                      <TableHead className="w-[50px]"></TableHead>
                    </TableRow>
                  </TableHeader>
                  <TableBody>
                    {filteredContractors.map((contractor) => (
                      <TableRow key={contractor.id} className="hover:bg-muted/30">
                        <TableCell>
                          <div>
                            <p className="font-medium">
                              {contractor.trading_name || contractor.legal_name}
                            </p>
                            {contractor.trading_name && contractor.trading_name !== contractor.legal_name && (
                              <p className="text-xs text-muted-foreground">
                                {contractor.legal_name}
                              </p>
                            )}
                          </div>
                        </TableCell>
                        <TableCell className="text-sm">{contractor.province || 'PNG'}</TableCell>
                        <TableCell>
                          <div className="flex flex-wrap gap-1">
                            {(contractor.categories || []).map((category) => (
                              <span
                                key={category}
                                className={`text-xs px-2 py-0.5 rounded-full ${getCategoryColor(category)}`}
                              >
                                {category}
                              </span>
                            ))}
                          </div>
                        </TableCell>
                        <TableCell className="font-medium">{contractor.contract_count}</TableCell>
                        <TableCell className="font-medium">
                          {contractor.total_awarded > 0
                            ? formatCurrency(contractor.total_awarded)
                            : '-'}
                        </TableCell>
                        <TableCell>
                          <Badge className={getStatusColor(contractor.status)}>
                            {contractor.status}
                          </Badge>
                        </TableCell>
                        <TableCell>
                          <DropdownMenu>
                            <DropdownMenuTrigger asChild>
                              <Button variant="ghost" size="icon" className="h-8 w-8">
                                <MoreHorizontal className="h-4 w-4" />
                              </Button>
                            </DropdownMenuTrigger>
                            <DropdownMenuContent align="end">
                              <DropdownMenuItem asChild>
                                <Link href={`/contractors/${contractor.id}`}>
                                  <Eye className="h-4 w-4 mr-2" />
                                  View Profile
                                </Link>
                              </DropdownMenuItem>
                              <DropdownMenuItem asChild>
                                <Link href={`/contractors/${contractor.id}`}>
                                  <Edit className="h-4 w-4 mr-2" />
                                  Edit
                                </Link>
                              </DropdownMenuItem>
                            </DropdownMenuContent>
                          </DropdownMenu>
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </div>
            </CardContent>
          </Card>
        )}

        {!loading && filteredContractors.length === 0 && (
          <Card>
            <CardContent className="py-12 text-center text-muted-foreground">
              No contractors found matching your criteria
            </CardContent>
          </Card>
        )}
      </div>
    </MainLayout>
  );
}
