import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide StorageException;

import '../../core/errors/app_exceptions.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/asset_repository.dart';
import '../../domain/repositories/extension_record_repository.dart';
import '../../domain/repositories/asset_template_repository.dart';
import '../../domain/repositories/family_repository.dart';
import '../../services/auth_service.dart';

/// Supabase client provider.
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

/// Auth service provider.
final authServiceProvider = Provider<AuthService>((ref) {
  return authService;
});

/// Auth repository provider - returns the AuthService as AuthRepository.
/// This is a simple wrapper that delegates AuthService methods.
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authService = ref.watch(authServiceProvider);
  return _AuthRepositoryWrapper(authService);
});

/// Auth repository wrapper around AuthService.
class _AuthRepositoryWrapper implements AuthRepository {
  final AuthService _authService;

  _AuthRepositoryWrapper(this._authService);

  @override
  Stream<User?> get authStateChanges => 
      Supabase.instance.client.auth.onAuthStateChange.map((event) => event.session?.user);

  @override
  Future<Either<AppException, UserProfile?>> getCurrentUser() async {
    final user = await _authService.getCurrentUser();
    if (user == null) {
      return const Right(null);
    }
    return Right(user);
  }

  @override
  Stream<UserProfile?> watchAuthState() {
    return _authService.authStateChanges;
  }

  @override
  Future<Either<AppException, UserProfile>> signIn(String email, String password) {
    return _authService.signIn(email, password);
  }

  @override
  Future<Either<AppException, UserProfile>> signUp(String email, String password, String fullName) {
    return _authService.signUp(email, password, fullName);
  }

  @override
  Future<Either<AppException, UserProfile>> signInWithGoogle() {
    return _authService.signInWithGoogle();
  }

  @override
  Future<Either<AppException, Unit>> sendPasswordResetEmail(String email) {
    return _authService.sendPasswordResetEmail(email);
  }

  @override
  Future<Either<AppException, Unit>> signOut() {
    return _authService.signOut();
  }

  @override
  Future<Either<AppException, UserProfile>> updateProfile(UserProfile profile) {
    // TODO: Implement profile update
    return Future.value(const Left(StorageException('Not implemented')));
  }

  @override
  Future<Either<AppException, bool>> hasFamilyGroup() {
    // TODO: Check if user has family group
    return Future.value(const Right(false));
  }
}

/// Asset repository provider.
final assetRepositoryProvider = Provider<AssetRepository>((ref) {
  // TODO: Replace with AssetRepositoryImpl when database is set up
  throw UnimplementedError('AssetRepositoryImpl not yet implemented');
});

/// Extension record repository provider.
final extensionRecordRepositoryProvider = Provider<ExtensionRecordRepository>((ref) {
  // TODO: Implement ExtensionRecordRepositoryImpl
  throw UnimplementedError('ExtensionRecordRepositoryImpl not yet implemented');
});

/// Asset template repository provider.
final assetTemplateRepositoryProvider = Provider<AssetTemplateRepository>((ref) {
  // TODO: Implement AssetTemplateRepositoryImpl
  throw UnimplementedError('AssetTemplateRepositoryImpl not yet implemented');
});

/// Family repository provider.
final familyRepositoryProvider = Provider<FamilyRepository>((ref) {
  // TODO: Implement FamilyRepositoryImpl
  throw UnimplementedError('FamilyRepositoryImpl not yet implemented');
});

/// Current user provider (from Supabase auth).
final currentUserProvider = FutureProvider<User?>((ref) async {
  return Supabase.instance.client.auth.currentUser;
});

/// Is authenticated provider.
final isAuthenticatedProvider = Provider<bool>((ref) {
  final user = ref.watch(currentUserProvider).valueOrNull;
  return user != null;
});