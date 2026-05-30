-- Attachments - File attachments for extension records
-- =====================================================

create table if not exists attachments (
  id uuid primary key default gen_random_uuid(),
  extension_record_id uuid references extension_records(id) on delete cascade not null,
  family_group_id uuid references family_groups(id) on delete cascade not null,
  uploaded_by uuid references auth.users(id) on delete set null,
  file_name text not null check (length(file_name) >= 1 and length(file_name) <= 255),
  file_type text not null check (file_type in ('pdf', 'jpg', 'jpeg', 'png', 'heic')),
  file_size_bytes int not null check (file_size_bytes > 0 and file_size_bytes <= 10485760), -- max 10MB
  storage_path text not null,
  local_cache_path text,
  sync_status text default 'synced' check (sync_status in ('synced', 'pending_create', 'pending_update', 'pending_delete')),
  uploaded_at timestamptz default now() not null
);

-- Indexes
create index if not exists idx_attachments_extension on attachments(extension_record_id);
create index if not exists idx_attachments_family on attachments(family_group_id);

-- Row Level Security
alter table attachments enable row level security;

-- RLS Policies
create policy "Family members can view attachments"
  on attachments for select
  using (
    family_group_id in (
      select family_group_id from family_memberships where user_id = auth.uid()
    )
  );

create policy "Family members can insert attachments"
  on attachments for insert
  with check (
    family_group_id in (
      select family_group_id from family_memberships where user_id = auth.uid()
    )
  );

create policy "Family members can update attachments"
  on attachments for update
  using (
    family_group_id in (
      select family_group_id from family_memberships where user_id = auth.uid()
    )
  );

create policy "Family members can delete attachments"
  on attachments for delete
  using (
    family_group_id in (
      select family_group_id from family_memberships where user_id = auth.uid()
    )
  );

-- Comments
comment on table attachments is 'File attachments (PDF, images) for extension records';
comment on column attachments.file_size_bytes is 'File size in bytes, max 10MB';
comment on column attachments.storage_path is 'Path in Supabase Storage bucket';

-- ROLLBACK:
-- DROP TABLE attachments;