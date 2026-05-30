import 'package:fpdart/fpdart.dart';

import '../../core/errors/app_exceptions.dart';
import '../entities/asset.dart';

/// Abstract repository interface for Asset operations.
/// Following AGENTS.md section 2.3 - repository pattern.
/// Implementations must follow offline-first: write to local DB first, then sync.
abstract class AssetRepository {
  /// Watch a stream of all assets for a family group.
  /// Returns non-archived assets ordered by creation date.
  Stream<List<Asset>> watchAssets(String familyGroupId);

  /// Watch a stream of archived assets for a family group.
  Stream<List<Asset>> watchArchivedAssets(String familyGroupId);

  /// Get a single asset by ID.
  Future<Either<AppException, Asset>> getAsset(String id);

  /// Create a new asset locally and queue for sync.
  Future<Either<AppException, Asset>> createAsset(Asset asset);

  /// Update an existing asset locally and queue for sync.
  Future<Either<AppException, Asset>> updateAsset(Asset asset);

  /// Archive an asset (soft delete).
  Future<Either<AppException, Unit>> archiveAsset(String id);

  /// Restore an archived asset.
  Future<Either<AppException, Unit>> restoreAsset(String id);

  /// Permanently delete an asset and all related records.
  Future<Either<AppException, Unit>> deleteAsset(String id);

  /// Get all assets by category.
  Future<Either<AppException, List<Asset>>> getAssetsByCategory(
    String familyGroupId,
    String category,
  );

  /// Search assets by name.
  Future<Either<AppException, List<Asset>>> searchAssets(
    String familyGroupId,
    String query,
  );

  /// Get total count of assets for a family group.
  Future<Either<AppException, int>> getAssetCount(String familyGroupId);
}