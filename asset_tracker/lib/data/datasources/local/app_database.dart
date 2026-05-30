import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../../domain/entities/asset.dart';
import '../../../domain/entities/attachment.dart';
import '../../../domain/entities/expiry_status.dart';
import '../../../domain/entities/extension_record.dart';
import '../../../domain/entities/sync_status.dart';

part 'app_database.g.dart';

/// Assets table for local SQLite storage.
class AssetsTable extends Table {
  @override
  String get tableName => 'assets';

  TextColumn get id => text()();
  TextColumn get familyGroupId => text()();
  TextColumn get templateId => text().nullable()();
  TextColumn get createdBy => text()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  TextColumn get iconName => text()();
  TextColumn get notes => text().nullable()();
  TextColumn get customFields => text().withDefault(const Constant('{}'))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Extension records table for local SQLite storage.
class ExtensionRecordsTable extends Table {
  @override
  String get tableName => 'extension_records';

  TextColumn get id => text()();
  TextColumn get assetId => text()();
  TextColumn get familyGroupId => text()();
  TextColumn get type => text()();
  TextColumn get label => text()();
  DateTimeColumn get expiryDate => dateTime()();
  IntColumn get remindDaysBefore => integer().withDefault(const Constant(30))();
  TextColumn get billingCycle => text().nullable()();
  RealColumn get amount => real().nullable()();
  TextColumn get currency => text().withDefault(const Constant('IDR'))();
  TextColumn get status => text().withDefault(const Constant('active'))();
  TextColumn get renewedFrom => text().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Attachments table for local SQLite storage.
class AttachmentsTable extends Table {
  @override
  String get tableName => 'attachments';

  TextColumn get id => text()();
  TextColumn get extensionRecordId => text()();
  TextColumn get familyGroupId => text()();
  TextColumn get uploadedBy => text().nullable()();
  TextColumn get fileName => text()();
  TextColumn get fileType => text()();
  IntColumn get fileSizeBytes => integer()();
  TextColumn get storagePath => text()();
  TextColumn get localCachePath => text().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  DateTimeColumn get uploadedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Asset templates table for local caching.
class AssetTemplatesTable extends Table {
  @override
  String get tableName => 'asset_templates';

  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  TextColumn get iconName => text()();
  TextColumn get defaultFields => text().withDefault(const Constant('[]'))();
  BoolColumn get isSystem => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Sync queue table for tracking pending operations.
class SyncQueueTable extends Table {
  @override
  String get tableName => 'sync_queue';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get tableNameColumn => text().named('table_name')();
  TextColumn get recordId => text()();
  TextColumn get operation => text()();
  TextColumn get data => text()();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  TextColumn get lastError => text().nullable()();
}

@DriftDatabase(tables: [
  AssetsTable,
  ExtensionRecordsTable,
  AttachmentsTable,
  AssetTemplatesTable,
  SyncQueueTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'asset_tracker_db');
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
    );
  }

  // ============ Assets DAO Methods ============

  /// Watch all non-archived assets for a family group.
  Stream<List<Asset>> watchAssets(String familyGroupId) {
    final query = select(assetsTable)
      ..where((t) => t.familyGroupId.equals(familyGroupId) & t.isArchived.equals(false))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

    return query.watch().map((rows) => rows.map(_mapAssetToEntity).toList());
  }

  /// Watch all archived assets for a family group.
  Stream<List<Asset>> watchArchivedAssets(String familyGroupId) {
    final query = select(assetsTable)
      ..where((t) => t.familyGroupId.equals(familyGroupId) & t.isArchived.equals(true))
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]);

    return query.watch().map((rows) => rows.map(_mapAssetToEntity).toList());
  }

  /// Get a single asset by ID.
  Future<Asset?> getAsset(String id) async {
    final query = select(assetsTable)..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _mapAssetToEntity(row) : null;
  }

  /// Get all assets for a family group.
  Future<List<Asset>> getAssets(String familyGroupId) async {
    final query = select(assetsTable)
      ..where((t) => t.familyGroupId.equals(familyGroupId))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);
    final rows = await query.get();
    return rows.map(_mapAssetToEntity).toList();
  }

  /// Get assets by category.
  Future<List<Asset>> getAssetsByCategory(String familyGroupId, String category) async {
    final query = select(assetsTable)
      ..where((t) => t.familyGroupId.equals(familyGroupId) & t.category.equals(category))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);
    final rows = await query.get();
    return rows.map(_mapAssetToEntity).toList();
  }

  /// Search assets by name.
  Future<List<Asset>> searchAssets(String familyGroupId, String query) async {
    final searchQuery = '%$query%';
    final selectQuery = select(assetsTable)
      ..where((t) => t.familyGroupId.equals(familyGroupId) & t.name.like(searchQuery))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);
    final rows = await selectQuery.get();
    return rows.map(_mapAssetToEntity).toList();
  }

  /// Get total count of assets for a family group.
  Future<int> getAssetCount(String familyGroupId) async {
    final query = selectOnly(assetsTable)
      ..where(assetsTable.familyGroupId.equals(familyGroupId) & assetsTable.isArchived.equals(false))
      ..addColumns([assetsTable.id.count()]);
    final result = await query.getSingle();
    return result.read(assetsTable.id.count()) ?? 0;
  }

  /// Insert or update an asset.
  Future<void> upsertAsset(Asset asset) async {
    await into(assetsTable).insertOnConflictUpdate(_mapAssetToCompanion(asset));
  }

  /// Insert multiple assets.
  Future<void> insertAssets(List<Asset> assets) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(assetsTable, assets.map(_mapAssetToCompanion).toList());
    });
  }

  /// Archive an asset (soft delete).
  Future<void> archiveAsset(String id) async {
    final now = DateTime.now();
    await (update(assetsTable)..where((t) => t.id.equals(id))).write(
      AssetsTableCompanion(
        isArchived: const Value(true),
        syncStatus: const Value('pending_update'),
        updatedAt: Value(now),
      ),
    );
  }

  /// Restore an archived asset.
  Future<void> restoreAsset(String id) async {
    final now = DateTime.now();
    await (update(assetsTable)..where((t) => t.id.equals(id))).write(
      AssetsTableCompanion(
        isArchived: const Value(false),
        syncStatus: const Value('pending_update'),
        updatedAt: Value(now),
      ),
    );
  }

  /// Hard delete an asset.
  Future<void> deleteAsset(String id) async {
    await (delete(assetsTable)..where((t) => t.id.equals(id))).go();
  }

  // ============ Extension Records DAO Methods ============

  /// Watch all extension records for an asset.
  Stream<List<ExtensionRecord>> watchExtensionRecords(String assetId) {
    final query = select(extensionRecordsTable)
      ..where((t) => t.assetId.equals(assetId))
      ..orderBy([(t) => OrderingTerm.asc(t.expiryDate)]);

    return query.watch().map((rows) => rows.map(_mapExtensionRecordToEntity).toList());
  }

  /// Watch all expiring records for a family group within a given number of days.
  Stream<List<ExtensionRecord>> watchExpiringExtensionRecords(
    String familyGroupId,
    int withinDays,
  ) {
    final now = DateTime.now();
    final cutoff = now.add(Duration(days: withinDays));

    final query = select(extensionRecordsTable)
      ..where((t) =>
          t.familyGroupId.equals(familyGroupId) &
          t.expiryDate.isSmallerOrEqualValue(cutoff) &
          t.status.isIn(['active', 'expiring_soon']))
      ..orderBy([(t) => OrderingTerm.asc(t.expiryDate)]);

    return query.watch().map((rows) => rows.map(_mapExtensionRecordToEntity).toList());
  }

  /// Get a single extension record by ID.
  Future<ExtensionRecord?> getExtensionRecord(String id) async {
    final query = select(extensionRecordsTable)..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _mapExtensionRecordToEntity(row) : null;
  }

  /// Get all expiring records for a family group within a given number of days.
  Future<List<ExtensionRecord>> getExpiringExtensionRecords(
    String familyGroupId,
    int withinDays,
  ) async {
    final now = DateTime.now();
    final cutoff = now.add(Duration(days: withinDays));

    final query = select(extensionRecordsTable)
      ..where((t) =>
          t.familyGroupId.equals(familyGroupId) &
          t.expiryDate.isSmallerOrEqualValue(cutoff) &
          t.status.isIn(['active', 'expiring_soon']))
      ..orderBy([(t) => OrderingTerm.asc(t.expiryDate)]);

    final rows = await query.get();
    return rows.map(_mapExtensionRecordToEntity).toList();
  }

  /// Get all expired records for a family group.
  Future<List<ExtensionRecord>> getExpiredExtensionRecords(String familyGroupId) async {
    final query = select(extensionRecordsTable)
      ..where((t) =>
          t.familyGroupId.equals(familyGroupId) &
          t.status.equals('expired'))
      ..orderBy([(t) => OrderingTerm.asc(t.expiryDate)]);

    final rows = await query.get();
    return rows.map(_mapExtensionRecordToEntity).toList();
  }

  /// Insert or update an extension record.
  Future<void> upsertExtensionRecord(ExtensionRecord record) async {
    await into(extensionRecordsTable)
        .insertOnConflictUpdate(_mapExtensionRecordToCompanion(record));
  }

  /// Delete an extension record.
  Future<void> deleteExtensionRecord(String id) async {
    await (delete(extensionRecordsTable)..where((t) => t.id.equals(id))).go();
  }

  // ============ Attachments DAO Methods ============

  /// Watch all attachments for an extension record.
  Stream<List<Attachment>> watchAttachments(String extensionRecordId) {
    final query = select(attachmentsTable)
      ..where((t) => t.extensionRecordId.equals(extensionRecordId))
      ..orderBy([(t) => OrderingTerm.desc(t.uploadedAt)]);

    return query.watch().map((rows) => rows.map(_mapAttachmentToEntity).toList());
  }

  /// Get all attachments for an extension record.
  Future<List<Attachment>> getAttachments(String extensionRecordId) async {
    final query = select(attachmentsTable)
      ..where((t) => t.extensionRecordId.equals(extensionRecordId))
      ..orderBy([(t) => OrderingTerm.desc(t.uploadedAt)]);

    final rows = await query.get();
    return rows.map(_mapAttachmentToEntity).toList();
  }

  /// Insert or update an attachment.
  Future<void> upsertAttachment(Attachment attachment) async {
    await into(attachmentsTable)
        .insertOnConflictUpdate(_mapAttachmentToCompanion(attachment));
  }

  /// Delete an attachment.
  Future<void> deleteAttachment(String id) async {
    await (delete(attachmentsTable)..where((t) => t.id.equals(id))).go();
  }

  // ============ Mappers ============

  Asset _mapAssetToEntity(AssetsTableData row) {
    return Asset(
      id: row.id,
      familyGroupId: row.familyGroupId,
      templateId: row.templateId,
      createdBy: row.createdBy,
      name: row.name,
      category: row.category,
      iconName: row.iconName,
      notes: row.notes,
      customFields: _parseJson(row.customFields),
      isArchived: row.isArchived,
      syncStatus: SyncStatus.values.firstWhere(
        (e) => e.name == row.syncStatus,
        orElse: () => SyncStatus.synced,
      ),
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  AssetsTableCompanion _mapAssetToCompanion(Asset asset) {
    return AssetsTableCompanion(
      id: Value(asset.id),
      familyGroupId: Value(asset.familyGroupId),
      templateId: Value(asset.templateId),
      createdBy: Value(asset.createdBy),
      name: Value(asset.name),
      category: Value(asset.category),
      iconName: Value(asset.iconName),
      notes: Value(asset.notes),
      customFields: Value(_encodeJson(asset.customFields)),
      isArchived: Value(asset.isArchived),
      syncStatus: Value(asset.syncStatus.name),
      createdAt: Value(asset.createdAt),
      updatedAt: Value(asset.updatedAt),
    );
  }

  ExtensionRecord _mapExtensionRecordToEntity(ExtensionRecordsTableData row) {
    return ExtensionRecord(
      id: row.id,
      assetId: row.assetId,
      familyGroupId: row.familyGroupId,
      type: ExtensionType.values.firstWhere(
        (e) => e.name == row.type,
        orElse: () => ExtensionType.document,
      ),
      label: row.label,
      expiryDate: row.expiryDate,
      remindDaysBefore: row.remindDaysBefore,
      billingCycle: row.billingCycle != null
          ? BillingCycle.values.firstWhere(
              (e) => e.name == row.billingCycle,
              orElse: () => BillingCycle.oneTime,
            )
          : null,
      amount: row.amount?.toInt(),
      currency: row.currency,
      status: ExpiryStatus.values.firstWhere(
        (e) => e.name == row.status,
        orElse: () => ExpiryStatus.active,
      ),
      renewedFrom: row.renewedFrom,
      syncStatus: SyncStatus.values.firstWhere(
        (e) => e.name == row.syncStatus,
        orElse: () => SyncStatus.synced,
      ),
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  ExtensionRecordsTableCompanion _mapExtensionRecordToCompanion(ExtensionRecord record) {
    return ExtensionRecordsTableCompanion(
      id: Value(record.id),
      assetId: Value(record.assetId),
      familyGroupId: Value(record.familyGroupId),
      type: Value(record.type.name),
      label: Value(record.label),
      expiryDate: Value(record.expiryDate),
      remindDaysBefore: Value(record.remindDaysBefore),
      billingCycle: Value(record.billingCycle?.name),
      amount: Value(record.amount?.toDouble()),
      currency: Value(record.currency),
      status: Value(record.status.name),
      renewedFrom: Value(record.renewedFrom),
      syncStatus: Value(record.syncStatus.name),
      createdAt: Value(record.createdAt),
      updatedAt: Value(record.updatedAt),
    );
  }

  Attachment _mapAttachmentToEntity(AttachmentsTableData row) {
    return Attachment(
      id: row.id,
      extensionRecordId: row.extensionRecordId,
      fileName: row.fileName,
      fileType: row.fileType,
      fileSizeBytes: row.fileSizeBytes,
      storagePath: row.storagePath,
      localCachePath: row.localCachePath,
      uploadedAt: row.uploadedAt,
      syncStatus: SyncStatus.values.firstWhere(
        (e) => e.name == row.syncStatus,
        orElse: () => SyncStatus.synced,
      ),
      createdAt: row.createdAt,
    );
  }

  AttachmentsTableCompanion _mapAttachmentToCompanion(Attachment attachment) {
    return AttachmentsTableCompanion(
      id: Value(attachment.id),
      extensionRecordId: Value(attachment.extensionRecordId),
      familyGroupId: const Value(''), // Set by caller
      uploadedBy: const Value(null),
      fileName: Value(attachment.fileName),
      fileType: Value(attachment.fileType),
      fileSizeBytes: Value(attachment.fileSizeBytes),
      storagePath: Value(attachment.storagePath ?? ''),
      localCachePath: Value(attachment.localCachePath),
      syncStatus: Value(attachment.syncStatus.name),
      uploadedAt: Value(attachment.uploadedAt),
      createdAt: Value(attachment.createdAt),
    );
  }

  Map<String, dynamic> _parseJson(String json) {
    try {
      if (json.isEmpty || json == '{}') return {};
      return jsonDecode(json) as Map<String, dynamic>;
    } catch (_) {
      return {};
    }
  }

  String _encodeJson(Map<String, dynamic> map) {
    return jsonEncode(map);
  }
}

