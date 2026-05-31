import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tabler_icons/tabler_icons.dart';

/// Family setup page - create or join a family group.
/// Following PRD.md section 3.2 - Family group requirements.
class FamilySetupPage extends StatelessWidget {
  const FamilySetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text(
                'Grup Keluarga',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Buat grup keluarga baru atau bergabung dengan yang sudah ada',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),

              // Create new family option
              _FamilyOptionCard(
                icon: TablerIcons.home_plus,
                title: 'Buat Grup Baru',
                subtitle: 'Buat grup keluarga baru dan undang pasangan Anda',
                onTap: () => _showCreateFamilyDialog(context),
              ),
              const SizedBox(height: 16),

              // Join existing family option
              _FamilyOptionCard(
                icon: TablerIcons.user_plus,
                title: 'Gabung dengan Kode',
                subtitle: 'Masukkan kode undangan untuk bergabung',
                onTap: () => _showJoinFamilyDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCreateFamilyDialog(BuildContext context) {
    final nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Buat Grup Keluarga'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Nama Grup',
            hintText: 'Contoh: Keluarga Saya',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                // TODO: Create family group
                Navigator.pop(context);
                context.go('/');
              }
            },
            child: const Text('Buat'),
          ),
        ],
      ),
    );
  }

  void _showJoinFamilyDialog(BuildContext context) {
    final codeController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Gabung Grup Keluarga'),
        content: TextField(
          controller: codeController,
          decoration: const InputDecoration(
            labelText: 'Kode Undangan',
            hintText: 'Masukkan 6 karakter kode',
          ),
          maxLength: 6,
          textCapitalization: TextCapitalization.characters,
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () {
              if (codeController.text.length == 6) {
                // TODO: Join family group
                Navigator.pop(context);
                context.go('/');
              }
            },
            child: const Text('Gabung'),
          ),
        ],
      ),
    );
  }
}

/// Family option card widget.
class _FamilyOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _FamilyOptionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const Icon(TablerIcons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}