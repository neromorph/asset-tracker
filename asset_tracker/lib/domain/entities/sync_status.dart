/// Synchronization status for offline-first data handling.
enum SyncStatus {
  /// Data is synced with remote server.
  synced,

  /// Data is created locally, pending sync to remote.
  pendingCreate,

  /// Data is updated locally, pending sync to remote.
  pendingUpdate,

  /// Data is deleted locally, pending deletion from remote.
  pendingDelete,
}
