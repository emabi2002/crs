'use client';

import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { cn } from '@/lib/utils';
import {
  LayoutDashboard,
  FileText,
  FileCheck,
  Building2,
  ClipboardCheck,
  TrendingUp,
  Settings,
  Users,
  AlertTriangle,
  Calendar,
  ChevronLeft,
  ChevronRight,
} from 'lucide-react';
import { useState, useEffect } from 'react';
import { Button } from '@/components/ui/button';
import { Tooltip, TooltipContent, TooltipProvider, TooltipTrigger } from '@/components/ui/tooltip';
import { getSidebarCounts } from '@/lib/data-service';

interface NavItem {
  title: string;
  href: string;
  icon: React.ElementType;
  badgeKey?: 'tenders' | 'contracts' | 'pendingApprovals' | 'issues';
}

const mainNavItems: NavItem[] = [
  { title: 'Dashboard', href: '/', icon: LayoutDashboard },
  { title: 'Tender Pipeline', href: '/tenders', icon: FileText, badgeKey: 'tenders' },
  { title: 'Awards & Contracts', href: '/contracts', icon: FileCheck, badgeKey: 'contracts' },
  { title: 'Contractors Registry', href: '/contractors', icon: Building2 },
  { title: 'Approvals', href: '/approvals', icon: ClipboardCheck, badgeKey: 'pendingApprovals' },
];

const monitoringNavItems: NavItem[] = [
  { title: 'Milestones', href: '/monitoring/milestones', icon: Calendar },
  { title: 'Issues & Risks', href: '/monitoring/issues', icon: AlertTriangle, badgeKey: 'issues' },
];

const adminNavItems: NavItem[] = [
  { title: 'Reports', href: '/reports', icon: TrendingUp },
  { title: 'Users & Officers', href: '/admin/users', icon: Users },
  { title: 'Settings', href: '/admin/settings', icon: Settings },
];

interface SidebarCounts {
  tenders: number;
  contracts: number;
  pendingApprovals: number;
  issues: number;
}

function NavLink({ item, collapsed, counts }: { item: NavItem; collapsed: boolean; counts: SidebarCounts }) {
  const pathname = usePathname();
  const isActive = pathname === item.href || (item.href !== '/' && pathname.startsWith(item.href));
  const Icon = item.icon;
  const badge = item.badgeKey ? counts[item.badgeKey] : undefined;

  const linkContent = (
    <Link
      href={item.href}
      className={cn(
        'flex items-center gap-3 px-3 py-2.5 rounded-lg transition-all duration-200',
        'hover:bg-accent hover:text-accent-foreground',
        isActive && 'bg-primary text-primary-foreground shadow-sm',
        collapsed && 'justify-center px-2'
      )}
    >
      <Icon className={cn('h-5 w-5 flex-shrink-0', collapsed ? 'h-5 w-5' : 'h-4 w-4')} />
      {!collapsed && (
        <>
          <span className="flex-1 font-medium text-sm">{item.title}</span>
          {badge !== undefined && badge > 0 && (
            <span
              className={cn(
                'flex items-center justify-center min-w-[20px] h-5 px-1.5 rounded-full text-xs font-semibold',
                isActive ? 'bg-primary-foreground/20 text-primary-foreground' : 'bg-muted text-muted-foreground'
              )}
            >
              {badge}
            </span>
          )}
        </>
      )}
    </Link>
  );

  if (collapsed) {
    return (
      <Tooltip delayDuration={0}>
        <TooltipTrigger asChild>{linkContent}</TooltipTrigger>
        <TooltipContent side="right" className="flex items-center gap-2">
          {item.title}
          {badge !== undefined && badge > 0 && (
            <span className="bg-primary/10 text-primary text-xs px-1.5 py-0.5 rounded-full">
              {badge}
            </span>
          )}
        </TooltipContent>
      </Tooltip>
    );
  }

  return linkContent;
}

export function Sidebar() {
  const [collapsed, setCollapsed] = useState(false);
  const [counts, setCounts] = useState<SidebarCounts>({
    tenders: 0,
    contracts: 0,
    pendingApprovals: 0,
    issues: 0,
  });

  useEffect(() => {
    async function fetchCounts() {
      try {
        const data = await getSidebarCounts();
        setCounts(data);
      } catch (error) {
        console.error('Error fetching sidebar counts:', error);
      }
    }
    fetchCounts();
    // Refresh counts every 30 seconds
    const interval = setInterval(fetchCounts, 30000);
    return () => clearInterval(interval);
  }, []);

  return (
    <TooltipProvider>
      <aside
        className={cn(
          'fixed left-0 top-0 z-40 h-screen bg-card border-r border-border transition-all duration-300',
          collapsed ? 'w-[68px]' : 'w-64'
        )}
      >
        {/* Header / Logo */}
        <div className={cn('flex items-center gap-3 p-4 border-b border-border', collapsed && 'justify-center')}>
          <div className="flex-shrink-0 w-10 h-10 rounded-full overflow-hidden bg-primary/10 flex items-center justify-center">
            <img
              src="https://npc.gov.pg/wp-content/uploads/2023/12/npc-logo.fw_.png"
              alt="NPC Logo"
              className="w-10 h-10 object-contain"
            />
          </div>
          {!collapsed && (
            <div className="flex-1 min-w-0">
              <h1 className="font-bold text-sm truncate text-foreground">Contract Registry</h1>
              <p className="text-xs text-muted-foreground truncate">NPC Papua New Guinea</p>
            </div>
          )}
        </div>

        {/* Navigation */}
        <nav className="flex-1 overflow-y-auto p-3 space-y-6">
          {/* Main Navigation */}
          <div className="space-y-1">
            {!collapsed && (
              <h2 className="px-3 mb-2 text-xs font-semibold text-muted-foreground uppercase tracking-wider">
                Main
              </h2>
            )}
            {mainNavItems.map((item) => (
              <NavLink key={item.href} item={item} collapsed={collapsed} counts={counts} />
            ))}
          </div>

          {/* Monitoring */}
          <div className="space-y-1">
            {!collapsed && (
              <h2 className="px-3 mb-2 text-xs font-semibold text-muted-foreground uppercase tracking-wider">
                Monitoring
              </h2>
            )}
            {monitoringNavItems.map((item) => (
              <NavLink key={item.href} item={item} collapsed={collapsed} counts={counts} />
            ))}
          </div>

          {/* Administration */}
          <div className="space-y-1">
            {!collapsed && (
              <h2 className="px-3 mb-2 text-xs font-semibold text-muted-foreground uppercase tracking-wider">
                Administration
              </h2>
            )}
            {adminNavItems.map((item) => (
              <NavLink key={item.href} item={item} collapsed={collapsed} counts={counts} />
            ))}
          </div>
        </nav>

        {/* Collapse Toggle */}
        <div className="p-3 border-t border-border">
          <Button
            variant="ghost"
            size="sm"
            onClick={() => setCollapsed(!collapsed)}
            className={cn('w-full justify-center', !collapsed && 'justify-start')}
          >
            {collapsed ? <ChevronRight className="h-4 w-4" /> : <ChevronLeft className="h-4 w-4" />}
            {!collapsed && <span className="ml-2 text-sm">Collapse</span>}
          </Button>
        </div>
      </aside>
    </TooltipProvider>
  );
}
