import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';

/// Create/Edit asset page - template picker and form.
/// Following PRD.md section 3.9 - Create asset requirements.
class CreateAssetPage extends StatelessWidget {
  final String? assetId;

  const CreateAssetPage({super.key, this.assetId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(assetId == null ? 'Tambah Aset' : 'Edit Aset'),
      ),
      body: Column(
        children: [
          // Template picker
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Pilih template',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemCount: _templates.length,
              itemBuilder: (context, index) {
                final template = _templates[index];
                return _TemplateCard(
                  icon: template['icon'] as IconData,
                  label: template['label'] as String,
                  onTap: () {
                    // TODO: Select template and show form
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  static final _templates = [
    {'icon': TablerIcons.home, 'label': 'Rumah'},
    {'icon': TablerIcons.car, 'label': 'Kendaraan Roda 4'},
    {'icon': TablerIcons.motorbike, 'label': 'Kendaraan Roda 2'},
    {'icon': TablerIcons.wifi, 'label': 'Internet/ISP'},
    {'icon': TablerIcons.bolt, 'label': 'Listrik PLN'},
    {'icon': TablerIcons.heartbeat, 'label': 'BPJS Kesehatan'},
    {'icon': TablerIcons.briefcase, 'label': 'BPJS Ketenagakerjaan'},
    {'icon': TablerIcons.shield_check, 'label': 'Asuransi Jiwa'},
    {'icon': TablerIcons.shield, 'label': 'Asuransi Kendaraan'},
    {'icon': TablerIcons.building_bank, 'label': 'KPR/Cicilan'},
    {'icon': TablerIcons.plus, 'label': 'Custom'},
  ];
}

class _TemplateCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _TemplateCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32),
              const SizedBox(height: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}