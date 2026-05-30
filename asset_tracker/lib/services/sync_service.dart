import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';

import '../data/datasources/local/app_database.dart';
import '../domain/entities/sync_status.dart';

/// Sync service for offline-first data synchronization.
/// Pushes local changes to Supabase and pulls remote changes.
/// Following AGENTS.md section 4 - SyncService requirements.
class SyncService {
  final AppDatabase _database;
  final Connectivity _connectivity;

  SyncState _state = SyncState.idle;
  DateTime? _lastSyncTime;

  SyncService(this._database) : _connectivity = Connectivity();

  /// Current sync state.
  SyncState get state => _state;

  /// Last successful sync time.
  DateTime? get lastSyncTime => _lastSyncTime;

  /// Stream of sync state changes.
  Stream<SyncState> get stateChanges async* {
    yield _state;
    await for (final _ in _connectivity.onConnectivityChanged) {
      if (_state == SyncState.syncing) continue;
      yield _state;
    }
  }

  /// Sync all pending changes.
  Future<void> syncAll() async {
    if (_state == SyncState.syncing) return;
    
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      _state = SyncState.offline;
      return;
    }

    _state = SyncState.syncing;
    try {
      await _pushChanges();
      await _pullChanges();
      _lastSyncTime = DateTime.now();
      _state = SyncState.idle;
    } catch (e) {
      _state = SyncState.error;
      rethrow;
    }
  }

  /// Push pending local changes to Supabase.
  Future<void> _pushChanges() async {
    // Get all pending assets
    final selectAssets = _database.select(_database.assetsTable);
    final assets = await selectAssets.get();
    
    for (final asset in assets) {
      final syncStatus = SyncStatus.values.firstWhere(
        (e) => e.name == asset.syncStatus,
        orElse: () => SyncStatus.synced,
      );

      if (syncStatus == SyncStatus.pendingCreate) {
        await _pushCreate('assets', asset);
      } else if (syncStatus == SyncStatus.pendingUpdate) {
        await _pushUpdate('assets', asset);
      } else if (syncStatus == SyncStatus.pendingDelete) {
        await _pushDelete('assets', asset.id);
      }
    }

    // Get all pending extension records
    final selectRecords = _database.select(_database.extensionRecordsTable);
    final records = await selectRecords.get();
    
    for (final record in records) {
      final syncStatus = SyncStatus.values.firstWhere(
        (e) => e.name == record.syncStatus,
        orElse: () => SyncStatus.synced,
      );

      if (syncStatus == SyncStatus.pendingCreate) {
        await _pushCreate('extension_records', record);
      } else if (syncStatus == SyncStatus.pendingUpdate) {
        await _pushUpdate('extension_records', record);
      } else if (syncStatus == SyncStatus.pendingDelete) {
        await _pushDelete('extension_records', record.id);
      }
    }
  }

  /// Push a create operation to Supabase.
  Future<void> _pushCreate(String table, dynamic data) async {
    // TODO: Implement actual Supabase push
  }

  /// Push an update operation to Supabase.
  Future<void> _pushUpdate(String table, dynamic data) async {
    // TODO: Implement actual Supabase push
  }

  /// Push a delete operation to Supabase.
  Future<void> _pushDelete(String table, String id) async {
    // TODO: Implement actual Supabase push
  }

  /// Pull remote changes from Supabase.
  Future<void> _pullChanges() async {
    // TODO: Implement actual Supabase pull with realtime subscriptions
  }

  /// Update sync status for a record.
  Future<void> updateSyncStatus(String tableName, String recordId, SyncStatus status) async {
    final now = DateTime.now();
    
    switch (tableName) {
      case 'assets':
        final companion = AssetsTableCompanion(
          syncStatus: Value(status.name),
          updatedAt: Value(now),
        );
        await (_database.update(_database.assetsTable)..where((t) => t.id.equals(recordId))).write(companion);
        break;
      case 'extension_records':
        final companion = ExtensionRecordsTableCompanion(
          syncStatus: Value(status.name),
          updatedAt: Value(now),
        );
        await (_database.update(_database.extensionRecordsTable)..where((t) => t.id.equals(recordId))).write(companion);
        break;
    }
  }
}

/// Sync state enumeration.
enum SyncState {
  idle,
  syncing,
  offline,
  error,
}

/// Global instance - initialized in main.dart
late final SyncService syncService;