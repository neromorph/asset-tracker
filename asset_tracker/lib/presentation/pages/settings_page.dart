import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabler_icons/tabler_icons.dart';

/// Settings page.
/// Following PRD.md section 3.9 - Settings requirements.
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
      ),
      body: ListView(
        children: [
          // Profile section
          _SectionHeader(title: 'Profil'),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(TablerIcons.user),
            ),
            title: const Text('Nama Pengguna'),
            subtitle: const Text('email@example.com'),
            trailing: const Icon(TablerIcons.chevron_right),
            onTap: () {
              // TODO: Edit profile
            },
          ),

          const Divider(),

          // Keluarga section
          _SectionHeader(title: 'Keluarga'),
          ListTile(
            leading: const Icon(TablerIcons.users),
            title: const Text('Grup Keluarga'),
            subtitle: const Text('Keluarga Saya'),
            trailing: const Icon(TablerIcons.chevron_right),
            onTap: () {
              // TODO: Edit family group
            },
          ),
          ListTile(
            leading: const Icon(TablerIcons.user_plus),
            title: const Text('Undang Anggota'),
            subtitle: const Text('Bagikan kode undangan'),
            trailing: const Icon(TablerIcons.chevron_right),
            onTap: () {
              // TODO: Generate invite code
            },
          ),

          const Divider(),

          // Notifikasi section
          _SectionHeader(title: 'Notifikasi'),
          SwitchListTile(
            secondary: const Icon(TablerIcons.bell),
            title: const Text('Notifikasi expiry'),
            subtitle: const Text('Aktifkan pengingat expiry'),
            value: true,
            onChanged: (value) {
              // TODO: Toggle notifications
            },
          ),

          const Divider(),

          // Tampilan section
          _SectionHeader(title: 'Tampilan'),
          SwitchListTile(
            secondary: const Icon(TablerIcons.moon),
            title: const Text('Mode gelap'),
            subtitle: const Text('Aktifkan tema gelap'),
            value: theme.brightness == Brightness.dark,
            onChanged: (value) {
              // TODO: Toggle dark mode
            },
          ),

          const Divider(),

          // Keamanan section
          _SectionHeader(title: 'Keamanan'),
          SwitchListTile(
            secondary: const Icon(TablerIcons.fingerprint),
            title: const Text('Kunci biometrik'),
            subtitle: const Text('Gunakan sidik jari/Face ID'),
            value: false,
            onChanged: (value) {
              // TODO: Toggle biometric
            },
          ),

          const Divider(),

          // Info section
          _SectionHeader(title: 'Info'),
          ListTile(
            leading: const Icon(TablerIcons.info_circle),
            title: const Text('Tentang'),
            subtitle: const Text('Versi 1.0.0'),
            trailing: const Icon(TablerIcons.chevron_right),
            onTap: () {
              // TODO: Show about
            },
          ),
          ListTile(
            leading: const Icon(TablerIcons.file_text),
            title: const Text('Kebijakan Privasi'),
            trailing: const Icon(TablerIcons.chevron_right),
            onTap: () {
              // TODO: Show privacy policy
            },
          ),

          const Divider(),

          // Logout button
          Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton.tonal(
              onPressed: () {
                // TODO: Sign out
              },
              style: FilledButton.styleFrom(
                backgroundColor: theme.colorScheme.errorContainer,
                foregroundColor: theme.colorScheme.onErrorContainer,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(TablerIcons.logout),
                  SizedBox(width: 8),
                  Text('Keluar'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}