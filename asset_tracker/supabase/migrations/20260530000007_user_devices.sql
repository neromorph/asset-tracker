-- User Devices - FCM tokens for push notifications
-- ================================================

create table if not exists user_devices (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade not null,
  fcm_token text not null,
  platform text not null check (platform in ('ios', 'android')),
  updated_at timestamptz default now() not null,
  unique(user_id, fcm_token)
);

-- Index
create index if not exists idx_user_devices_user on user_devices(user_id);

-- Row Level Security
alter table user_devices enable row level security;

-- RLS Policies
create policy "Users can manage their own devices"
  on user_devices for all
  using (user_id = auth.uid());

-- Trigger to update updated_at
create trigger update_user_devices_updated_at
  before update on user_devices
  for each row
  execute function update_updated_at_column();

-- Comments
comment on table user_devices is 'FCM tokens for push notifications per device';

-- ROLLBACK:
-- DROP TRIGGER update_user_devices_updated_at ON user_devices;
-- DROP TABLE user_devices;