import 'package:fpdart/fpdart.dart';

import '../../core/errors/app_exceptions.dart';
import '../entities/user_profile.dart';

/// Abstract repository interface for authentication operations.
/// Uses Supabase Auth under the hood per AGENTS.md section 3.3.
abstract class AuthRepository {
  /// Get the currently authenticated user profile.
  /// Returns null if not authenticated.
  Future<Either<AppException, UserProfile?>> getCurrentUser();

  /// Watch auth state changes.
  Stream<UserProfile?> watchAuthState();

  /// Sign in with email and password.
  Future<Either<AppException, UserProfile>> signIn(
    String email,
    String password,
  );

  /// Sign up with email, password, and full name.
  Future<Either<AppException, UserProfile>> signUp(
    String email,
    String password,
    String fullName,
  );

  /// Sign in with Google OAuth.
  Future<Either<AppException, UserProfile>> signInWithGoogle();

  /// Send password reset email.
  Future<Either<AppException, Unit>> sendPasswordResetEmail(String email);

  /// Sign out and clear local data.
  Future<Either<AppException, Unit>> signOut();

  /// Update user profile.
  Future<Either<AppException, UserProfile>> updateProfile(
    UserProfile profile,
  );

  /// Check if user has a family group.
  Future<Either<AppException, bool>> hasFamilyGroup();
}