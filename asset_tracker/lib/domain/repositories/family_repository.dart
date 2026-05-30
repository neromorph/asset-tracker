import 'package:fpdart/fpdart.dart';

import '../../core/errors/app_exceptions.dart';
import '../entities/family_group.dart';

/// Abstract repository interface for family group operations.
abstract class FamilyRepository {
  /// Get the current user's family group.
  Future<Either<AppException, FamilyGroup?>> getFamilyGroup();

  /// Watch the current user's family group.
  Stream<FamilyGroup?> watchFamilyGroup();

  /// Create a new family group.
  Future<Either<AppException, FamilyGroup>> createFamily(String name);

  /// Update family group details.
  Future<Either<AppException, FamilyGroup>> updateFamily(
    String id,
    String name,
  );

  /// Generate an invite code for joining the family group.
  Future<Either<AppException, String>> generateInviteCode();

  /// Join a family group using an invite code.
  Future<Either<AppException, FamilyGroup>> joinFamily(String inviteCode);

  /// Leave the current family group.
  Future<Either<AppException, Unit>> leaveFamily();

  /// Get all members of a family group.
  Future<Either<AppException, List<FamilyMember>>> getMembers(String familyGroupId);

  /// Watch members of a family group.
  Stream<List<FamilyMember>> watchMembers(String familyGroupId);

  /// Remove a member from the family group (owner only).
  Future<Either<AppException, Unit>> removeMember(String memberId);
}