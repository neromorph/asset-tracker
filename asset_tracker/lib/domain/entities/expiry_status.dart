/// Expiry status computed by ExpiryEngine based on days remaining.
enum ExpiryStatus {
  /// Actively tracked and not expiring soon.
  active,

  /// Within the reminder window (≤ remindDaysBefore).
  expiringSoon,

  /// Past the expiry date.
  expired,

  /// Manually renewed by user.
  renewed,

  /// No expiry date set or being tracked.
  none,
}

/// Extension methods for ExpiryStatus.
extension ExpiryStatusExtension on ExpiryStatus {
  /// Get Indonesian label for this status.
  String get label {
    switch (this) {
      case ExpiryStatus.active:
        return 'Aktif';
      case ExpiryStatus.expiringSoon:
        return 'Mendekati Kedaluwarsa';
      case ExpiryStatus.expired:
        return 'Kadaluwarsa';
      case ExpiryStatus.renewed:
        return 'Diperbarui';
      case ExpiryStatus.none:
        return 'Tidak Dit脾';
    }
  }

  /// Get Indonesian short label.
  String get shortLabel {
    switch (this) {
      case ExpiryStatus.active:
        return 'Aktif';
      case ExpiryStatus.expiringSoon:
        return 'Mendatang';
      case ExpiryStatus.expired:
        return 'Terlewat';
      case ExpiryStatus.renewed:
        return 'Perbarui';
      case ExpiryStatus.none:
        return '-';
    }
  }
}
