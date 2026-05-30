import 'package:fpdart/fpdart.dart';

import '../../core/errors/app_exceptions.dart';
import '../entities/extension_record.dart';

/// Abstract repository interface for ExtensionRecord operations.
/// Following AGENTS.md section 2.3 - repository pattern.
abstract class ExtensionRecordRepository {
  /// Watch all extension records for an asset.
  Stream<List<ExtensionRecord>> watchRecords(String assetId);

  /// Watch all expiring records for a family group within a given number of days.
  Stream<List<ExtensionRecord>> watchExpiringRecords(
    String familyGroupId,
    int withinDays,
  );

  /// Get a single extension record by ID.
  Future<Either<AppException, ExtensionRecord>> getRecord(String id);

  /// Get all extension records for an asset.
  Future<Either<AppException, List<ExtensionRecord>>> getRecordsByAsset(
    String assetId,
  );

  /// Get all expiring records for a family group within a given number of days.
  Future<Either<AppException, List<ExtensionRecord>>> getExpiringRecords(
    String familyGroupId,
    int withinDays,
  );

  /// Get all expired records for a family group.
  Future<Either<AppException, List<ExtensionRecord>>> getExpiredRecords(
    String familyGroupId,
  );

  /// Create a new extension record locally and queue for sync.
  Future<Either<AppException, ExtensionRecord>> createRecord(
    ExtensionRecord record,
  );

  /// Update an existing extension record locally and queue for sync.
  Future<Either<AppException, ExtensionRecord>> updateRecord(
    ExtensionRecord record,
  );

  /// Renew an extension record with a new expiry date.
  /// This creates a new record referencing the old one.
  Future<Either<AppException, ExtensionRecord>> renewRecord(
    String id,
    DateTime newExpiryDate,
  );

  /// Delete an extension record.
  Future<Either<AppException, Unit>> deleteRecord(String id);

  /// Update the computed status of all records based on current date.
  Future<Either<AppException, Unit>> updateAllStatuses();
}