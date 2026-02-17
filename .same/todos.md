# Contract Registry System - Development Tracker

## Project Status: COMPLETE ✅

The Contract Registry System is fully operational with real procurement data.

---

## SQL Migration Files Available

| File | Description | Records |
|------|-------------|---------|
| `schema.sql` | Database schema (run first) | Tables, views, RLS |
| `migrate-2018-2019-transition-data.sql` | Transition period data | ~16 tenders |
| `migrate-2019-data.sql` | 2019 procurement data | 66 tenders |
| `migrate-2020-data.sql` | 2020 procurement data | ~50 tenders |
| `migrate-2021-data.sql` | 2021 procurement data | ~15 tenders |
| `migrate-2022-data.sql` | 2022 procurement data | ~60 tenders |
| `migrate-2023-data.sql` | 2023 procurement data | ~50 tenders |
| `migrate-2024-data.sql` | 2024 procurement data | ~30 tenders |
| `migrate-2025-data.sql` | 2025 procurement data | ~20 tenders |
| `enable-public-access.sql` | RLS policies for testing | Required |

---

## How to Run Migrations

1. Go to Supabase Dashboard: https://supabase.com/dashboard/project/kirvkdetpwaanhdkvjal/sql/new

2. Run files IN ORDER:
   1. `schema.sql` (FIRST)
   2. `migrate-2018-2019-transition-data.sql`
   3. `migrate-2019-data.sql`
   4. `migrate-2020-data.sql`
   5. `migrate-2021-data.sql`
   6. `migrate-2022-data.sql`
   7. `migrate-2023-data.sql`
   8. `migrate-2024-data.sql`
   9. `migrate-2025-data.sql`
   10. `enable-public-access.sql` (LAST)

3. (Optional) Run `enable-write-access.sql` to allow editing

---

## Deployment

- **GitHub:** https://github.com/emabi2002/crs.git
- **Live Site:** https://same-w3cnjkp24ja-latest.netlify.app

---

## Current Version: 20

---

## Technical Stack
- **Frontend:** Next.js 15, React 19, TypeScript
- **UI:** Shadcn UI, Tailwind CSS
- **Charts:** Recharts
- **Backend:** Supabase (PostgreSQL)
- **Hosting:** Netlify (dynamic deployment)
- **Package Manager:** Bun
