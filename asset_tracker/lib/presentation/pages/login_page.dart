import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabler_icons/tabler_icons.dart';

import '../../core/theme/app_colors.dart';

/// Login page following ui-mocks/login/code.html design.
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_validateForm()) return;

    setState(() => _isLoading = true);

    try {
      // TODO: Implement login via AuthService
      await Future.delayed(const Duration(seconds: 1));

      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/family-setup');
    } catch (e) {
      _showError('Login gagal. Silakan coba lagi.');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  bool _validateForm() {
    if (_emailController.text.isEmpty) {
      _showError('Email harus diisi');
      return false;
    }
    if (!_emailController.text.contains('@')) {
      _showError('Format email tidak valid');
      return false;
    }
    if (_passwordController.text.isEmpty) {
      _showError('Kata sandi harus diisi');
      return false;
    }
    return true;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Offline banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: AppColors.statusNeutral.withValues(alpha: 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    TablerIcons.cloud_off,
                    size: 18,
                    color: AppColors.statusNeutral,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Mode offline aktif. Sinkronisasi tertunda.',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.statusNeutral,
                        ),
                  ),
                ],
              ),
            ),
            // Main content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 48),
                    // Logo and title
                    Center(
                      child: Column(
                        children: [
                          Icon(
                            TablerIcons.package,
                            size: 64,
                            color: AppColors.primary,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Asset Tracker',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Kelola seluruh aset keluarga Anda dalam satu tempat yang aman dan terorganisir.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                    // Login form card
                    Card(
                      elevation: 0,
                      color: AppColors.surfaceContainerLowest,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                        side: BorderSide(color: AppColors.outlineVariant.withValues(alpha: 0.3)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Selamat Datang',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Silakan masuk ke akun Anda',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.onSurfaceVariant,
                                  ),
                            ),
                            const SizedBox(height: 24),
                            // Email field
                            TextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(TablerIcons.mail, color: AppColors.outline),
                                hintText: 'nama@email.com',
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Password field
                            TextField(
                              controller: _passwordController,
                              obscureText: _obscurePassword,
                              decoration: InputDecoration(
                                labelText: 'Kata Sandi',
                                prefixIcon: Icon(TablerIcons.lock, color: AppColors.outline),
                                hintText: '••••••••',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword ? TablerIcons.eye : TablerIcons.eye_off,
                                    color: AppColors.outline,
                                  ),
                                  onPressed: () {
                                    setState(() => _obscurePassword = !_obscurePassword);
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Forgot password link
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  // TODO: Navigate to forgot password
                                },
                                child: Text(
                                  'Lupa Kata Sandi?',
                                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                        color: AppColors.primary,
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Login button
                            ElevatedButton(
                              onPressed: _isLoading ? null : _handleLogin,
                              child: _isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(strokeWidth: 2),
                                    )
                                  : const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Masuk'),
                                        SizedBox(width: 8),
                                        Icon(TablerIcons.arrow_right, size: 20),
                                      ],
                                    ),
                            ),
                            const SizedBox(height: 16),
                            // Divider
                            Row(
                              children: [
                                Expanded(child: Divider(color: AppColors.outlineVariant)),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    'Atau masuk dengan',
                                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                          color: AppColors.onSurfaceVariant,
                                        ),
                                  ),
                                ),
                                Expanded(child: Divider(color: AppColors.outlineVariant)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // Google sign in
                            OutlinedButton(
                              onPressed: _isLoading ? null : () {
                                // TODO: Google sign in
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    'https://www.google.com/favicon.ico',
                                    width: 20,
                                    height: 20,
                                    errorBuilder: (_, __, ___) => Icon(
                                      TablerIcons.brand_google,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text('Masuk dengan Google'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Register link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun? ',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.onSurfaceVariant,
                              ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/register');
                          },
                          child: const Text('Daftar'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
