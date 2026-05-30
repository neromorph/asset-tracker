-- Storage - Supabase Storage bucket for asset documents
-- ======================================================

-- Create storage bucket for asset documents (private)
-- Note: This is a SQL representation; actual bucket creation requires
-- Supabase Storage API. This migration documents the intended configuration.

-- The asset-documents bucket should be created with:
-- - name: asset-documents
-- - public: false (private bucket)
-- - file_size_limit: 10485760 (10MB)
-- - allowed_mime_types: ['application/pdf', 'image/jpeg', 'image/png', 'image/heic']

-- Storage RLS policies are handled separately via storage.objects RLS

-- Storage bucket metadata (stored in supabase.storage.buckets)
-- This is a placeholder for documentation; actual bucket creation
-- is typically done via Supabase Dashboard or API

-- Policy for family members to access their family group's documents
create policy "Family members can view their documents"
  on storage.objects for select
  using (
    bucket_id = 'asset-documents'
    and auth.uid() in (
      select user_id from family_memberships
      where family_group_id = (
        select family_group_id from attachments
        where storage_path = name
      )
    )
  );

create policy "Family members can upload documents"
  on storage.objects for insert
  with check (
    bucket_id = 'asset-documents'
    and auth.uid() in (
      select user_id from family_memberships
      where family_group_id = (
        select family_group_id from attachments
        where storage_path = name
      )
    )
  );

create policy "Family members can delete documents"
  on storage.objects for delete
  using (
    bucket_id = 'asset-documents'
    and auth.uid() in (
      select user_id from family_memberships
      where family_group_id = (
        select family_group_id from attachments
        where storage_path = name
      )
    )
  );

-- Note: The above policies are simplified. In production, you would
-- create the bucket via Supabase Dashboard or API with proper configuration.

-- ROLLBACK:
-- DROP POLICY "Family members can view their documents" ON storage.objects;
-- DROP POLICY "Family members can upload documents" ON storage.objects;
-- DROP POLICY "Family members can delete documents" ON storage.objects;