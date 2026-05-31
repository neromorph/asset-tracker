import 'package:fpdart/fpdart.dart';

import '../../core/errors/app_exceptions.dart';
import '../../domain/entities/asset.dart';
import '../../domain/entities/sync_status.dart';
import '../../domain/repositories/asset_repository.dart';
import '../datasources/local/app_database.dart';

/// Implementation of AssetRepository following offline-first approach.
/// All writes go to local DB first, then sync to Supabase.
class AssetRepositoryImpl implements AssetRepository {
  final AppDatabase _database;

  AssetRepositoryImpl(this._database);

  @override
  Future<Either<AppException, List<Asset>>> getAssets(String familyGroupId) async {
    try {
      final assets = await _database.getAssets(familyGroupId);
      return Right(assets);
    } catch (e) {
      return Left(StorageException('Failed to get assets: $e'));
    }
  }

  @override
  Stream<List<Asset>> watchAssets(String familyGroupId) {
    return _database.watchAssets(familyGroupId);
  }

  @override
  Stream<List<Asset>> watchArchivedAssets(String familyGroupId) {
    return _database.watchArchivedAssets(familyGroupId);
  }

  @override
  Future<Either<AppException, Asset>> getAsset(String id) async {
    try {
      final asset = await _database.getAsset(id);
      if (asset == null) {
        return const Left(NotFoundException('Asset not found'));
      }
      return Right(asset);
    } catch (e) {
      return Left(StorageException('Failed to get asset: $e'));
    }
  }

  @override
  Future<Either<AppException, Asset>> createAsset(Asset asset) async {
    try {
      // Ensure sync status is pending_create
      final assetToSave = asset.copyWith(
        syncStatus: SyncStatus.pendingCreate,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _database.upsertAsset(assetToSave);
      return Right(assetToSave);
    } catch (e) {
      return Left(StorageException('Failed to create asset: $e'));
    }
  }

  @override
  Future<Either<AppException, Asset>> updateAsset(Asset asset) async {
    try {
      // Ensure sync status is pending_update
      final assetToSave = asset.copyWith(
        syncStatus: SyncStatus.pendingUpdate,
        updatedAt: DateTime.now(),
      );

      await _database.upsertAsset(assetToSave);
      return Right(assetToSave);
    } catch (e) {
      return Left(StorageException('Failed to update asset: $e'));
    }
  }

  @override
  Future<Either<AppException, Unit>> archiveAsset(String id) async {
    try {
      await _database.archiveAsset(id);
      return const Right(unit);
    } catch (e) {
      return Left(StorageException('Failed to archive asset: $e'));
    }
  }

  @override
  Future<Either<AppException, Unit>> restoreAsset(String id) async {
    try {
      await _database.restoreAsset(id);
      return const Right(unit);
    } catch (e) {
      return Left(StorageException('Failed to restore asset: $e'));
    }
  }

  @override
  Future<Either<AppException, Unit>> deleteAsset(String id) async {
    try {
      await _database.deleteAsset(id);
      return const Right(unit);
    } catch (e) {
      return Left(StorageException('Failed to delete asset: $e'));
    }
  }

  @override
  Future<Either<AppException, List<Asset>>> getAssetsByCategory(
    String familyGroupId,
    String category,
  ) async {
    try {
      final assets = await _database.getAssetsByCategory(familyGroupId, category);
      return Right(assets);
    } catch (e) {
      return Left(StorageException('Failed to get assets by category: $e'));
    }
  }

  @override
  Future<Either<AppException, List<Asset>>> searchAssets(
    String familyGroupId,
    String query,
  ) async {
    try {
      final assets = await _database.searchAssets(familyGroupId, query);
      return Right(assets);
    } catch (e) {
      return Left(StorageException('Failed to search assets: $e'));
    }
  }

  @override
  Future<Either<AppException, int>> getAssetCount(String familyGroupId) async {
    try {
      final count = await _database.getAssetCount(familyGroupId);
      return Right(count);
    } catch (e) {
      return Left(StorageException('Failed to get asset count: $e'));
    }
  }
}