import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tabler_icons/tabler_icons.dart';

/// Shell page with bottom navigation bar.
/// Following PRD.md section 5.1 navigation structure.
class ShellPage extends StatelessWidget {
  final Widget child;

  const ShellPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (index) => _onItemTapped(index, context),
        destinations: const [
          NavigationDestination(
            icon: Icon(TablerIcons.dashboard),
            selectedIcon: Icon(TablerIcons.dashboard),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(TablerIcons.package),
            selectedIcon: Icon(TablerIcons.package),
            label: 'Aset',
          ),
          NavigationDestination(
            icon: Icon(TablerIcons.calendar),
            selectedIcon: Icon(TablerIcons.calendar),
            label: 'Kalender',
          ),
          NavigationDestination(
            icon: Icon(TablerIcons.settings),
            selectedIcon: Icon(TablerIcons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/assets')) return 1;
    if (location.startsWith('/calendar')) return 2;
    if (location.startsWith('/settings')) return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/assets');
        break;
      case 2:
        context.go('/calendar');
        break;
      case 3:
        context.go('/settings');
        break;
    }
  }
}