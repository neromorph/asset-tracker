-- Family Groups, Memberships, and Invite Codes
-- ===========================================

-- Create family_groups table
create table if not exists family_groups (
  id uuid primary key default gen_random_uuid(),
  name text not null check (length(name) >= 1 and length(name) <= 100),
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz default now() not null
);

-- Create family_memberships table
create table if not exists family_memberships (
  id uuid primary key default gen_random_uuid(),
  family_group_id uuid references family_groups(id) on delete cascade not null,
  user_id uuid references auth.users(id) on delete cascade not null,
  role text not null default 'member' check (role in ('owner', 'member')),
  joined_at timestamptz default now() not null,
  unique(family_group_id, user_id)
);

-- Create invite_codes table
create table if not exists invite_codes (
  id uuid primary key default gen_random_uuid(),
  family_group_id uuid references family_groups(id) on delete cascade not null,
  code text not null unique check (length(code) = 6),
  created_by uuid references auth.users(id) on delete set null,
  expires_at timestamptz not null,
  used_at timestamptz,
  used_by uuid references auth.users(id) on delete set null
);

-- Indexes for performance
create index if not exists idx_family_memberships_user on family_memberships(user_id);
create index if not exists idx_family_memberships_family on family_memberships(family_group_id);
create index if not exists idx_invite_codes_code on invite_codes(code);
create index if not exists idx_invite_codes_family on invite_codes(family_group_id);

-- Row Level Security
alter table family_groups enable row level security;
alter table family_memberships enable row level security;
alter table invite_codes enable row level security;

-- RLS Policies for family_groups
create policy "Users can view their own family groups"
  on family_groups for select
  using (
    id in (
      select family_group_id from family_memberships where user_id = auth.uid()
    )
  );

create policy "Users can insert their own family groups"
  on family_groups for insert
  with check (created_by = auth.uid());

create policy "Only owners can update family groups"
  on family_groups for update
  using (
    created_by = auth.uid()
  );

-- RLS Policies for family_memberships
create policy "Users can view their own memberships"
  on family_memberships for select
  using (
    user_id = auth.uid()
    or family_group_id in (
      select family_group_id from family_memberships where user_id = auth.uid()
    )
  );

create policy "Users can insert their own memberships"
  on family_memberships for insert
  with check (user_id = auth.uid());

create policy "Only owners can manage other members"
  on family_memberships for update
  using (
    exists (
      select 1 from family_memberships
      where family_group_id = family_memberships.family_group_id
      and user_id = auth.uid()
      and role = 'owner'
    )
  );

create policy "Members can delete their own membership"
  on family_memberships for delete
  using (user_id = auth.uid());

-- RLS Policies for invite_codes
create policy "Family members can view invite codes"
  on invite_codes for select
  using (
    family_group_id in (
      select family_group_id from family_memberships where user_id = auth.uid()
    )
  );

create policy "Owners can create invite codes"
  on invite_codes for insert
  with check (
    family_group_id in (
      select family_group_id from family_memberships
      where user_id = auth.uid() and role = 'owner'
    )
  );

create policy "Owners can delete invite codes"
  on invite_codes for delete
  using (
    family_group_id in (
      select family_group_id from family_memberships
      where user_id = auth.uid() and role = 'owner'
    )
  );

-- Comments for documentation
comment on table family_groups is 'Family groups for sharing assets between family members';
comment on column family_groups.name is 'Display name of the family group';
comment on table family_memberships is 'Links users to family groups with role assignments';
comment on table invite_codes is 'Temporary codes for joining a family group';

-- ROLLBACK: drop tables in reverse order of creation
-- DROP TABLE invite_codes;
-- DROP TABLE family_memberships;
-- DROP TABLE family_groups;