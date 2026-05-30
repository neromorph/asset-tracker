-- Extension Records - Tracked items for assets (documents, billing, reminders)
-- ============================================================================

create table if not exists extension_records (
  id uuid primary key default gen_random_uuid(),
  asset_id uuid references assets(id) on delete cascade not null,
  family_group_id uuid references family_groups(id) on delete cascade not null,
  type text not null check (type in ('document', 'billing', 'reminder')),
  label text not null check (length(label) >= 1 and length(label) <= 100),
  expiry_date date not null,
  remind_days_before int not null default 30 check (remind_days_before >= 0 and remind_days_before <= 365),
  billing_cycle text check (billing_cycle in ('monthly', 'quarterly', 'semi_annual', 'annual', 'one_time')),
  amount numeric(15,2),
  currency text default 'IDR' check (currency in ('IDR', 'USD', 'EUR', 'SGD')),
  status text not null default 'active' check (status in ('active', 'expiring_soon', 'expired', 'renewed')),
  renewed_from uuid references extension_records(id) on delete set null,
  sync_status text default 'synced' check (sync_status in ('synced', 'pending_create', 'pending_update', 'pending_delete')),
  created_at timestamptz default now() not null,
  updated_at timestamptz default now() not null
);

-- Indexes for common queries
create index if not exists idx_extension_records_asset on extension_records(asset_id);
create index if not exists idx_extension_records_family on extension_records(family_group_id);
create index if not exists idx_extension_records_expiry on extension_records(family_group_id, expiry_date);
create index if not exists idx_extension_records_status on extension_records(family_group_id, status, expiry_date);
create index if not exists idx_extension_records_type on extension_records(asset_id, type);

-- Row Level Security
alter table extension_records enable row level security;

-- RLS Policies
create policy "Family members can view extension records"
  on extension_records for select
  using (
    family_group_id in (
      select family_group_id from family_memberships where user_id = auth.uid()
    )
  );

create policy "Family members can insert extension records"
  on extension_records for insert
  with check (
    family_group_id in (
      select family_group_id from family_memberships where user_id = auth.uid()
    )
  );

create policy "Family members can update extension records"
  on extension_records for update
  using (
    family_group_id in (
      select family_group_id from family_memberships where user_id = auth.uid()
    )
  );

create policy "Family members can delete extension records"
  on extension_records for delete
  using (
    family_group_id in (
      select family_group_id from family_memberships where user_id = auth.uid()
    )
  );

-- Trigger to update updated_at timestamp
create trigger update_extension_records_updated_at
  before update on extension_records
  for each row
  execute function update_updated_at_column();

-- Comments
comment on table extension_records is 'Tracked documents, billing, and reminders for assets';
comment on column extension_records.expiry_date is 'Date when the document/billing/reminder is due';
comment on column extension_records.status is 'Computed status based on days remaining and remind_days_before';

-- ROLLBACK:
-- DROP TRIGGER update_extension_records_updated_at ON extension_records;
-- DROP TABLE extension_records;