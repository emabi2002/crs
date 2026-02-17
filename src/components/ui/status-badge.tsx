import { cn } from '@/lib/utils';
import type { TenderStatusCode, ContractStatusCode, Severity, MilestoneStatus } from '@/lib/types';

interface StatusBadgeProps {
  status: TenderStatusCode | ContractStatusCode | Severity | MilestoneStatus;
  size?: 'sm' | 'md' | 'lg';
  className?: string;
}

const tenderStatusStyles: Record<TenderStatusCode, string> = {
  Draft: 'bg-gray-100 text-gray-700 border-gray-200',
  Issued: 'bg-sky-100 text-sky-700 border-sky-200',
  Active: 'bg-emerald-100 text-emerald-700 border-emerald-200',
  Closed: 'bg-amber-100 text-amber-700 border-amber-200',
  Evaluation: 'bg-purple-100 text-purple-700 border-purple-200',
  'Submitted for Approval': 'bg-indigo-100 text-indigo-700 border-indigo-200',
  Approved: 'bg-teal-100 text-teal-700 border-teal-200',
  Awarded: 'bg-green-100 text-green-700 border-green-200',
  Cancelled: 'bg-red-100 text-red-700 border-red-200',
  'On Hold': 'bg-orange-100 text-orange-700 border-orange-200',
};

const contractStatusStyles: Record<ContractStatusCode, string> = {
  Active: 'bg-emerald-100 text-emerald-700 border-emerald-200',
  'Under Implementation': 'bg-blue-100 text-blue-700 border-blue-200',
  Delayed: 'bg-orange-100 text-orange-700 border-orange-200',
  Completed: 'bg-green-100 text-green-700 border-green-200',
  Terminated: 'bg-red-100 text-red-700 border-red-200',
  Suspended: 'bg-gray-100 text-gray-700 border-gray-200',
};

const severityStyles: Record<Severity, string> = {
  Low: 'bg-green-100 text-green-700 border-green-200',
  Medium: 'bg-amber-100 text-amber-700 border-amber-200',
  High: 'bg-orange-100 text-orange-700 border-orange-200',
  Critical: 'bg-red-100 text-red-700 border-red-200',
};

const milestoneStatusStyles: Record<MilestoneStatus, string> = {
  'Not Started': 'bg-gray-100 text-gray-700 border-gray-200',
  'In Progress': 'bg-blue-100 text-blue-700 border-blue-200',
  Completed: 'bg-green-100 text-green-700 border-green-200',
  Overdue: 'bg-red-100 text-red-700 border-red-200',
};

const sizeStyles = {
  sm: 'text-[10px] px-1.5 py-0.5',
  md: 'text-xs px-2 py-1',
  lg: 'text-sm px-3 py-1.5',
};

export function StatusBadge({ status, size = 'md', className }: StatusBadgeProps) {
  const allStyles = {
    ...tenderStatusStyles,
    ...contractStatusStyles,
    ...severityStyles,
    ...milestoneStatusStyles,
  };

  const styleClass = allStyles[status as keyof typeof allStyles] || 'bg-gray-100 text-gray-700 border-gray-200';

  return (
    <span
      className={cn(
        'inline-flex items-center font-medium rounded-full border whitespace-nowrap',
        styleClass,
        sizeStyles[size],
        className
      )}
    >
      {status}
    </span>
  );
}
