import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabler_icons/tabler_icons.dart';

import '../../core/theme/app_colors.dart';

/// Splash screen - entry point that determines auth state and redirects.
/// This is a placeholder implementation.
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    // TODO: Check auth state via AuthService
    // For now, navigate to login after a brief delay
    await Future.delayed(const Duration(milliseconds: 1500));

    if (!mounted) return;

    // TODO: Replace with actual auth check
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              TablerIcons.package,
              size: 80,
              color: AppColors.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Asset Tracker',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Family Edition',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(
              color: AppColors.primaryContainer,
            ),
          ],
        ),
      ),
    );
  }
}
