import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthException;

import '../core/errors/app_exceptions.dart';
import '../domain/entities/user_profile.dart';

/// Authentication service using Supabase Auth.
/// Following AGENTS.md section 3.3 - no custom auth logic.
class AuthService {
  final SupabaseClient _client;

  AuthService() : _client = Supabase.instance.client;

  /// Stream of auth state changes.
  Stream<UserProfile?> get authStateChanges {
    return _client.auth.onAuthStateChange.asyncMap((event) async {
      if (event.session == null) return null;
      return _getCurrentUser();
    });
  }

  /// Get the current authenticated user profile.
  Future<UserProfile?> getCurrentUser() {
    return _getCurrentUser();
  }

  /// Sign in with email and password.
  Future<Either<AppException, UserProfile>> signIn(
    String email,
    String password,
  ) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        return const Left(AuthException('Sign in failed'));
      }
      return Right(await _getCurrentUser() ?? _createUserProfile(response.user!));
    } on AuthException catch (e) {
      return Left(AuthException(e.message));
    } catch (e) {
      return Left(AuthException('Sign in failed: $e'));
    }
  }

  /// Sign up with email, password, and full name.
  Future<Either<AppException, UserProfile>> signUp(
    String email,
    String password,
    String fullName,
  ) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': fullName},
      );
      if (response.user == null) {
        return const Left(AuthException('Sign up failed'));
      }
      return Right(await _getCurrentUser() ?? _createUserProfile(response.user!));
    } on AuthException catch (e) {
      return Left(AuthException(e.message));
    } catch (e) {
      return Left(AuthException('Sign up failed: $e'));
    }
  }

  /// Sign in with Google OAuth.
  Future<Either<AppException, UserProfile>> signInWithGoogle() async {
    try {
      await _client.auth.signInWithOAuth(
        OAuthProvider.google,
      );
      final user = _client.auth.currentUser;
      if (user == null) {
        return const Left(AuthException('Google sign in failed'));
      }
      return Right(await _getCurrentUser() ?? _createUserProfile(user));
    } on AuthException catch (e) {
      return Left(AuthException(e.message));
    } catch (e) {
      return Left(AuthException('Google sign in failed: $e'));
    }
  }

  /// Send password reset email.
  Future<Either<AppException, Unit>> sendPasswordResetEmail(String email) async {
    try {
      await _client.auth.resetPasswordForEmail(email);
      return const Right(unit);
    } catch (e) {
      return Left(AuthException('Failed to send reset email: $e'));
    }
  }

  /// Sign out and clear local data.
  Future<Either<AppException, Unit>> signOut() async {
    try {
      await _client.auth.signOut();
      return const Right(unit);
    } catch (e) {
      return Left(AuthException('Sign out failed: $e'));
    }
  }

  /// Get current user profile from the users table.
  Future<UserProfile?> _getCurrentUser() async {
    final user = _client.auth.currentUser;
    if (user == null) return null;

    try {
      final response = await _client.from('user_profiles').select().eq('id', user.id).single();
      return UserProfile(
        id: response['id'] as String,
        fullName: response['full_name'] as String?,
        avatarUrl: response['avatar_url'] as String?,
        familyGroupId: response['family_group_id'] as String?,
        createdAt: DateTime.parse(response['created_at'] as String),
        updatedAt: response['updated_at'] != null 
            ? DateTime.parse(response['updated_at'] as String) 
            : null,
      );
    } catch (_) {
      // Fall back to creating from auth user
      return _createUserProfile(user);
    }
  }

  /// Create a user profile from auth user data.
  UserProfile _createUserProfile(User user) {
    final metadata = user.userMetadata;
    return UserProfile(
      id: user.id,
      fullName: metadata?['full_name'] as String?,
      avatarUrl: metadata?['avatar_url'] as String?,
      createdAt: DateTime.now(),
    );
  }
}

/// Global instance.
final authService = AuthService();