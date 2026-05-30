-- Assets - Family-owned records created from templates or custom
-- ============================================================

create table if not exists assets (
  id uuid primary key default gen_random_uuid(),
  family_group_id uuid references family_groups(id) on delete cascade not null,
  template_id uuid references asset_templates(id) on delete set null,
  created_by uuid references auth.users(id) on delete set null,
  name text not null check (length(name) >= 1 and length(name) <= 100),
  category text not null check (category in ('property', 'vehicle', 'subscription', 'utility', 'insurance', 'loan', 'custom')),
  icon_name text not null,
  notes text,
  custom_fields jsonb not null default '{}',
  is_archived boolean default false not null,
  sync_status text default 'synced' check (sync_status in ('synced', 'pending_create', 'pending_update', 'pending_delete')),
  created_at timestamptz default now() not null,
  updated_at timestamptz default now() not null
);

-- Indexes
create index if not exists idx_assets_family_group on assets(family_group_id);
create index if not exists idx_assets_family_archived on assets(family_group_id, is_archived);
create index if not exists idx_assets_category on assets(family_group_id, category);
create index if not exists idx_assets_created on assets(family_group_id, created_at desc);
create index if not exists idx_assets_template on assets(template_id);

-- Row Level Security
alter table assets enable row level security;

-- RLS Policies
create policy "Family members can view assets"
  on assets for select
  using (
    family_group_id in (
      select family_group_id from family_memberships where user_id = auth.uid()
    )
  );

create policy "Family members can insert assets"
  on assets for insert
  with check (
    family_group_id in (
      select family_group_id from family_memberships where user_id = auth.uid()
    )
  );

create policy "Family members can update assets"
  on assets for update
  using (
    family_group_id in (
      select family_group_id from family_memberships where user_id = auth.uid()
    )
  );

create policy "Family members can delete assets"
  on assets for delete
  using (
    family_group_id in (
      select family_group_id from family_memberships where user_id = auth.uid()
    )
  );

-- Trigger to update updated_at timestamp
create or replace function update_updated_at_column()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

create trigger update_assets_updated_at
  before update on assets
  for each row
  execute function update_updated_at_column();

-- Comments
comment on table assets is 'Family-owned asset records';
comment on column assets.name is 'Display name of the asset';
comment on column assets.custom_fields is 'JSON object storing template-specific field values';

-- ROLLBACK:
-- DROP TRIGGER update_assets_updated_at ON assets;
-- DROP FUNCTION update_updated_at_column();
-- DROP TABLE assets;