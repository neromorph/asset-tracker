-- Asset Templates - Pre-built templates for common Indonesian household assets
-- =============================================================================

create table if not exists asset_templates (
  id uuid primary key default gen_random_uuid(),
  name text not null check (length(name) >= 1 and length(name) <= 50),
  category text not null check (category in ('property', 'vehicle', 'subscription', 'utility', 'insurance', 'loan', 'custom')),
  icon_name text not null,
  default_fields jsonb not null default '[]',
  is_system boolean default true,
  created_at timestamptz default now() not null
);

-- Index for category lookups
create index if not exists idx_asset_templates_category on asset_templates(category);

-- Row Level Security
alter table asset_templates enable row level security;

-- Public read for all authenticated users (templates are shared)
create policy "Authenticated users can read templates"
  on asset_templates for select
  to authenticated
  using (true);

create policy "System templates cannot be modified"
  on asset_templates for update
  using (is_system = false);

create policy "System templates cannot be deleted"
  on asset_templates for delete
  using (is_system = false);

-- Seed the 10 pre-built templates
insert into asset_templates (id, name, category, icon_name, default_fields, is_system) values
(
  gen_random_uuid(),
  'Rumah',
  'property',
  'tabler-home',
  '[
    {"key": "address", "label": "Alamat", "type": "text", "required": true, "placeholder": "Jl. ... RT/RW ..."},
    {"key": "certificate_type", "label": "Tipe Sertifikat", "type": "dropdown", "options": ["Sertifikat Hak Milik (SHM)", "Sertifikat Hak Guna Bangunan (SHGB)", "Hak Pakai"]},
    {"key": "certificate_number", "label": "Nomor Sertifikat", "type": "text"},
    {"key": "imb_number", "label": "Nomor IMB", "type": "text"},
    {"key": "pbb_due_date", "label": "Jatuh Tempo PBB", "type": "date"}
  ]'::jsonb,
  true
),
(
  gen_random_uuid(),
  'Kendaraan Roda 4',
  'vehicle',
  'tabler-car',
  '[
    {"key": "plate_number", "label": "Plat Nomor", "type": "text", "required": true},
    {"key": "merk", "label": "Merek", "type": "text", "required": true},
    {"key": "model", "label": "Model/Tipe", "type": "text"},
    {"key": "year", "label": "Tahun", "type": "number"},
    {"key": "bpkb_number", "label": "Nomor BPKB", "type": "text"},
    {"key": "stnk_expiry", "label": "Jatuh Tempo STNK", "type": "date"},
    {"key": "kir_expiry", "label": "Jatuh Tempo KIR", "type": "date"}
  ]'::jsonb,
  true
),
(
  gen_random_uuid(),
  'Kendaraan Roda 2',
  'vehicle',
  'tabler-motorbike',
  '[
    {"key": "plate_number", "label": "Plat Nomor", "type": "text", "required": true},
    {"key": "merk", "label": "Merek", "type": "text", "required": true},
    {"key": "model", "label": "Model/Tipe", "type": "text"},
    {"key": "year", "label": "Tahun", "type": "number"},
    {"key": "bpkb_number", "label": "Nomor BPKB", "type": "text"},
    {"key": "stnk_expiry", "label": "Jatuh Tempo STNK", "type": "date"}
  ]'::jsonb,
  true
),
(
  gen_random_uuid(),
  'Internet / ISP',
  'subscription',
  'tabler-wifi',
  '[
    {"key": "provider", "label": "Provider", "type": "dropdown", "options": ["Telkomsel", "Indosat", "XL Axiata", "Tri", "Biznet", "MyRepublic", "CBN", "First Media", "Lainnya"]},
    {"key": "package_name", "label": "Nama Paket", "type": "text"},
    {"key": "account_number", "label": "Nomor Akun", "type": "text"},
    {"key": "billing_date", "label": "Tanggal Tagihan", "type": "date"}
  ]'::jsonb,
  true
),
(
  gen_random_uuid(),
  'Listrik (PLN)',
  'utility',
  'tabler-bolt',
  '[
    {"key": "customer_id", "label": "ID Pelanggan", "type": "text", "required": true},
    {"key": "tariff_class", "label": "Kelas Tarif", "type": "dropdown", "options": ["R-1/900 VA", "R-1/1300 VA", "R-1/2200 VA", "R-2/3500 VA", "R-3/6600 VA"]},
    {"key": "billing_date", "label": "Tanggal Tagihan", "type": "date"}
  ]'::jsonb,
  true
),
(
  gen_random_uuid(),
  'BPJS Kesehatan',
  'insurance',
  'tabler-heartbeat',
  '[
    {"key": "member_id", "label": "Nomor Kartu", "type": "text", "required": true},
    {"key": "class_type", "label": "Kelas", "type": "dropdown", "options": ["Kelas 1", "Kelas 2", "Kelas 3"]},
    {"key": "billing_date", "label": "Tanggal Jatuh Tempo", "type": "date", "required": true},
    {"key": "monthly_premium", "label": "Iuran Bulanan", "type": "number"}
  ]'::jsonb,
  true
),
(
  gen_random_uuid(),
  'BPJS Ketenagakerjaan',
  'insurance',
  'tabler-briefcase',
  '[
    {"key": "member_id", "label": "Nomor KPJ", "type": "text", "required": true},
    {"key": "company_name", "label": "Nama Perusahaan", "type": "text"},
    {"key": "billing_date", "label": "Tanggal Jatuh Tempo", "type": "date", "required": true}
  ]'::jsonb,
  true
),
(
  gen_random_uuid(),
  'Asuransi Jiwa',
  'insurance',
  'tabler-shield-check',
  '[
    {"key": "policy_number", "label": "Nomor Polis", "type": "text", "required": true},
    {"key": "provider", "label": "Asuransi", "type": "text", "required": true},
    {"key": "premium_amount", "label": "Besaran Premi", "type": "number"},
    {"key": "premium_due_date", "label": "Jatuh Tempo Premi", "type": "date"},
    {"key": "expiry_date", "label": "Tanggal Berakhir Polis", "type": "date"}
  ]'::jsonb,
  true
),
(
  gen_random_uuid(),
  'Asuransi Kendaraan',
  'insurance',
  'tabler-shield',
  '[
    {"key": "policy_number", "label": "Nomor Polis", "type": "text", "required": true},
    {"key": "provider", "label": "Asuransi", "type": "text", "required": true},
    {"key": "vehicle_ref", "label": "Kendaraan", "type": "text"},
    {"key": "expiry_date", "label": "Jatuh Tempo Asuransi", "type": "date", "required": true},
    {"key": "premium_due_date", "label": "Jatuh Tempo Premi", "type": "date"}
  ]'::jsonb,
  true
),
(
  gen_random_uuid(),
  'KPR / Cicilan',
  'loan',
  'tabler-building-bank',
  '[
    {"key": "bank_name", "label": "Nama Bank", "type": "text", "required": true},
    {"key": "account_number", "label": "Nomor Rekening", "type": "text"},
    {"key": "monthly_installment", "label": "Cicilan Bulanan", "type": "number"},
    {"key": "due_date", "label": "Tanggal Jatuh Tempo", "type": "date"},
    {"key": "remaining_months", "label": "Sisa Bulan", "type": "number"}
  ]'::jsonb,
  true
),
(
  gen_random_uuid(),
  'Custom',
  'custom',
  'tabler-plus',
  '[]'::jsonb,
  true
);

-- Comments
comment on table asset_templates is 'Pre-built and custom asset templates';
comment on column asset_templates.default_fields is 'JSON array of TemplateField objects defining editable fields';

-- ROLLBACK:
-- DROP TABLE asset_templates;