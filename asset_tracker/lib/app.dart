import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'l10n/app_localizations.dart';

import 'core/theme/app_theme.dart';
import 'presentation/providers/theme_provider.dart';
import 'presentation/pages/splash_page.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/register_page.dart';
import 'presentation/pages/family_setup_page.dart';
import 'presentation/pages/shell_page.dart';
import 'presentation/pages/dashboard_page.dart';
import 'presentation/pages/asset_list_page.dart';
import 'presentation/pages/calendar_page.dart';
import 'presentation/pages/settings_page.dart';
import 'presentation/pages/asset_detail_page.dart';
import 'presentation/pages/create_asset_page.dart';
import 'presentation/pages/create_extension_record_page.dart';
import 'presentation/pages/extension_record_detail_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables from .env file
  await dotenv.load();

  // Initialize Supabase with PKCE auth flow
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
    ),
  );

  // Initialize timezone database for Asia/Jakarta
  tz.initializeTimeZones();

  runApp(
    const ProviderScope(
      child: AssetTrackerApp(),
    ),
  );
}

class AssetTrackerApp extends ConsumerStatefulWidget {
  const AssetTrackerApp({super.key});

  @override
  ConsumerState<AssetTrackerApp> createState() => _AssetTrackerAppState();
}

class _AssetTrackerAppState extends ConsumerState<AssetTrackerApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _initRouter();
  }

  void _initRouter() {
    _router = GoRouter(
      initialLocation: '/splash',
      routes: [
        // Auth flow routes
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: '/family-setup',
          builder: (context, state) => const FamilySetupPage(),
        ),

        // Main app with bottom navigation
        ShellRoute(
          builder: (context, state, child) => ShellPage(child: child),
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const DashboardPage(),
            ),
            GoRoute(
              path: '/assets',
              builder: (context, state) => const AssetListPage(),
            ),
            GoRoute(
              path: '/calendar',
              builder: (context, state) => const CalendarPage(),
            ),
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsPage(),
            ),
            GoRoute(
              path: '/assets/new',
              builder: (context, state) => const CreateAssetPage(),
            ),
            GoRoute(
              path: '/assets/:id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return AssetDetailPage(assetId: id);
              },
            ),
            GoRoute(
              path: '/assets/:id/edit',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return CreateAssetPage(assetId: id);
              },
            ),
            GoRoute(
              path: '/assets/:id/records/new',
              builder: (context, state) {
                final assetId = state.pathParameters['id']!;
                return CreateExtensionRecordPage(assetId: assetId);
              },
            ),
            GoRoute(
              path: '/records/:id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return ExtensionRecordDetailPage(recordId: id);
              },
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Text('Page not found: ${state.matchedLocation}'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'Asset Tracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('id', 'ID'), // Bahasa Indonesia
        Locale('en', 'US'), // English
      ],
      locale: const Locale('id', 'ID'),
      routerConfig: _router,
    );
  }
}