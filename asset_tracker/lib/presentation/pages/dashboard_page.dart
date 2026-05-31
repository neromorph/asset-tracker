import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tabler_icons/tabler_icons.dart';

/// Dashboard page - main landing screen after login.
/// Following PRD.md section 3.8 - Dashboard requirements.
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset Tracker'),
        actions: [
          IconButton(
            icon: const Icon(TablerIcons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // TODO: Trigger sync
        },
        child: CustomScrollView(
          slivers: [
            // Offline banner
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(8),
                color: theme.colorScheme.errorContainer,
                child: Row(
                  children: [
                    Icon(
                      TablerIcons.wifi_off,
                      size: 16,
                      color: theme.colorScheme.onErrorContainer,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Mode offline — perubahan akan disinkronkan saat online',
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.colorScheme.onErrorContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Summary metrics bento grid
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ringkasan',
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _MetricCard(
                            icon: TablerIcons.package,
                            label: 'Total Aset',
                            value: '0',
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _MetricCard(
                            icon: TablerIcons.clock,
                            label: 'Segera expiry',
                            value: '0',
                            color: theme.colorScheme.tertiary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _MetricCard(
                            icon: TablerIcons.alert_triangle,
                            label: 'Sudah expired',
                            value: '0',
                            color: theme.colorScheme.error,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _MetricCard(
                            icon: TablerIcons.certificate,
                            label: 'Bulan ini',
                            value: '0',
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // "Perhatian Segera" section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Perhatian Segera',
                      style: theme.textTheme.titleMedium,
                    ),
                    TextButton(
                      onPressed: () => context.go('/calendar'),
                      child: const Text('Lihat semua'),
                    ),
                  ],
                ),
              ),
            ),

            // Expiring records list
            SliverToBoxAdapter(
              child: _buildExpiringRecordsList(context),
            ),

            // Categories section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kategori',
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    _buildCategoryGrid(context),
                  ],
                ),
              ),
            ),

            // Bottom padding
            const SliverToBoxAdapter(
              child: SizedBox(height: 80),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/assets/new'),
        icon: const Icon(TablerIcons.plus),
        label: const Text('Tambah Aset'),
      ),
    );
  }

  Widget _buildExpiringRecordsList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(
                TablerIcons.check,
                size: 48,
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
              ),
              const SizedBox(height: 8),
              Text(
                'Tidak ada yang segera expiry',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 4),
              Text(
                'Semua berjalan lancar!',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryGrid(BuildContext context) {
    final categories = [
      {'icon': TablerIcons.home, 'label': 'Properti', 'count': '0'},
      {'icon': TablerIcons.car, 'label': 'Kendaraan', 'count': '0'},
      {'icon': TablerIcons.wifi, 'label': 'Langganan', 'count': '0'},
      {'icon': TablerIcons.bolt, 'label': 'Utilitas', 'count': '0'},
      {'icon': TablerIcons.heartbeat, 'label': 'Asuransi', 'count': '0'},
      {'icon': TablerIcons.plus, 'label': 'Lainnya', 'count': '0'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.2,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return _CategoryCard(
          icon: category['icon'] as IconData,
          label: category['label'] as String,
          count: category['count'] as String,
        );
      },
    );
  }
}

/// Metric card widget for dashboard.
class _MetricCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _MetricCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

/// Category card widget.
class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String count;

  const _CategoryCard({
    required this.icon,
    required this.label,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // TODO: Navigate to filtered asset list
        },
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
              ),
              Text(
                count,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}