# Contract Registry System

**National Procurement Commission - Papua New Guinea**

A comprehensive procurement and contract management system for tracking tenders, contracts, and contractor performance across government agencies.

## Features

### Core Modules

1. **Dashboard**
   - Real-time portfolio overview with KPI cards
   - Tender pipeline visualization
   - Agency spend distribution
   - Monthly activity trends
   - Overdue milestones and high-priority issues alerts

2. **Tender Pipeline**
   - Full tender lifecycle tracking
   - Status-based filtering (Draft, Issued, Active, Closed, Evaluation, Approval, Awarded)
   - Agency and procurement method filters
   - Tender detail view with workflow timeline

3. **Awards & Contracts**
   - Contract monitoring dashboard
   - Milestone progress tracking
   - Variation management
   - Issue and risk register

4. **Contractors Registry**
   - National supplier registry
   - Performance history tracking
   - Category-based filtering (Works, Goods, Services, Consulting)
   - Contractor status management (Active, Suspended, Blacklisted)

5. **Approvals**
   - TFEC, NPC Board, and NEC approval tracking
   - Pending approvals queue
   - Decision history

6. **Monitoring**
   - Milestone tracking with due date management
   - Issues and risks register with severity levels
   - Contract variation log

7. **Reports & Administration**
   - Management reporting pack
   - User and role management
   - System settings and reference data

## Technology Stack

- **Frontend**: Next.js 15, React 19, TypeScript
- **Styling**: Tailwind CSS, Shadcn/UI
- **Charts**: Recharts
- **Icons**: Lucide React
- **Backend Ready**: Supabase (PostgreSQL)

## Getting Started

### Prerequisites

- Node.js 18+ or Bun
- Supabase account (for production)

### Installation

```bash
# Install dependencies
bun install

# Start development server
bun run dev
```

### Database Setup (Supabase)

1. Create a new Supabase project
2. Run the SQL schema from `supabase/schema.sql`
3. Configure environment variables:

```env
NEXT_PUBLIC_SUPABASE_URL=your-project-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
```

## Project Structure

```
contract-registry/
├── src/
│   ├── app/                    # Next.js App Router pages
│   │   ├── page.tsx            # Dashboard
│   │   ├── tenders/            # Tender management
│   │   ├── contracts/          # Contract monitoring
│   │   ├── contractors/        # Contractor registry
│   │   ├── approvals/          # Approval tracking
│   │   ├── monitoring/         # Milestones & Issues
│   │   ├── reports/            # Reports & Analytics
│   │   └── admin/              # Administration
│   ├── components/
│   │   ├── layout/             # Sidebar, Header, MainLayout
│   │   └── ui/                 # Shadcn components
│   └── lib/
│       ├── types.ts            # TypeScript interfaces
│       ├── mock-data.ts        # Demo data
│       └── utils.ts            # Utilities
├── supabase/
│   └── schema.sql              # Database schema
└── public/                     # Static assets
```

## Database Schema

### Master Tables
- `agencies` - Government agencies
- `officers` - System users/procurement officers
- `funding_sources` - Funding categories
- `contractors` - Supplier registry

### Tender Lifecycle
- `tenders` - Main tender records
- `tender_workflow_events` - Audit trail
- `tender_documents` - Document attachments
- `approvals` - Approval decisions
- `bids` - Submitted bids
- `evaluations` - Bid evaluations

### Contract Management
- `contract_awards` - Awarded contracts
- `contract_milestones` - Deliverables
- `contract_variations` - Scope changes
- `contract_issues_risks` - Issue register
- `contractor_performance_reviews` - Performance ratings

## Role-Based Access Control

| Role | Permissions |
|------|-------------|
| Admin | Full system access |
| Management | View all, approve actions |
| Procurement Officer | CRUD within assigned agency |
| Viewer | Read-only access |
| Auditor | Read + export rights |

## Management Reports

### Pipeline & Governance
- Tender pipeline by stage
- Average cycle time analysis
- Aging report (stuck tenders)
- Approvals register
- Single source register

### Financial & Portfolio
- Awarded value by agency/sector
- Funding source breakdown
- Top contractors by value
- Concentration risk analysis

### Delivery & Performance
- Project delivery status
- Milestone compliance
- Variation analysis
- Issue/risk heatmap
- Contract completion performance

### Compliance & Integrity
- Non-compliance register
- Contractor watchlist
- Suspension/blacklist report
- Audit trail export

## Deployment

### Netlify (Recommended)

The project includes `netlify.toml` for easy deployment:

```bash
# Build command
bun run build

# Publish directory
.next
```

### Environment Variables

```env
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
```

## Future Enhancements

- [ ] Document upload with Supabase Storage
- [ ] Email notifications for approvals
- [ ] PDF report generation
- [ ] Mobile responsive improvements
- [ ] Advanced analytics dashboard
- [ ] Integration with government financial systems

## Support

For technical support, contact:
- **NPC IT Department**: ict@npc.gov.pg
- **System Administrator**: admin@npc.gov.pg

## License

Government of Papua New Guinea - Internal Use Only
