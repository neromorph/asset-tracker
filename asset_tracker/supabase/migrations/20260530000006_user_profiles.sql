-- User Profiles - Extended user information stored in the app
-- =============================================================

create table if not exists user_profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text,
  avatar_url text,
  family_group_id uuid references family_groups(id) on delete set null,
  created_at timestamptz default now() not null,
  updated_at timestamptz default now() not null
);

-- Index
create index if not exists idx_user_profiles_family on user_profiles(family_group_id);

-- Row Level Security
alter table user_profiles enable row level security;

-- RLS Policies
create policy "Users can view their own profile"
  on user_profiles for select
  using (id = auth.uid());

create policy "Users can update their own profile"
  on user_profiles for update
  using (id = auth.uid());

create policy "Family members can view each other's profiles"
  on user_profiles for select
  using (
    family_group_id in (
      select family_group_id from family_memberships where user_id = auth.uid()
    )
  );

-- Trigger to auto-create profile on user signup
create or replace function handle_new_user()
returns trigger as $$
begin
  insert into public.user_profiles (id, full_name)
  values (new.id, new.raw_user_meta_data->>'full_name');
  return new;
end;
$$ language plpgsql security definer;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function handle_new_user();

-- Trigger to update updated_at
create trigger update_user_profiles_updated_at
  before update on user_profiles
  for each row
  execute function update_updated_at_column();

-- Comments
comment on table user_profiles is 'Extended user profile information';
comment on column user_profiles.full_name is 'Display name, synced from auth metadata';

-- ROLLBACK:
-- DROP TRIGGER on_auth_user_created ON auth.users;
-- DROP TRIGGER update_user_profiles_updated_at ON user_profiles;
-- DROP FUNCTION handle_new_user();
-- DROP TABLE user_profiles;