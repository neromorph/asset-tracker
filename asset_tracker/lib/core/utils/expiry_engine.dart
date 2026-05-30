import 'package:timezone/timezone.dart' as tz;
import '../../domain/entities/expiry_status.dart';

/// Pure utility class for computing expiry status.
/// All calculations use Asia/Jakarta timezone per AGENTS.md section 4.6.
class ExpiryEngine {
  ExpiryEngine._();

  /// Location for Asia/Jakarta timezone.
  static final _jakarta = tz.getLocation('Asia/Jakarta');

  /// Compute the expiry status based on expiry date and reminder window.
  ///
  /// Rules (from PRD.md section 3.10):
  /// - If daysRemaining < 0 → expired
  /// - If daysRemaining <= remindDaysBefore → expiringSoon
  /// - Otherwise → active
  static ExpiryStatus computeStatus(DateTime expiryDate, int remindDaysBefore) {
    final now = tz.TZDateTime.now(_jakarta);
    final today = DateTime(now.year, now.month, now.day);
    final expiry = DateTime(expiryDate.year, expiryDate.month, expiryDate.day);

    final daysRemaining = expiry.difference(today).inDays;

    if (daysRemaining < 0) {
      return ExpiryStatus.expired;
    }
    if (daysRemaining <= remindDaysBefore) {
      return ExpiryStatus.expiringSoon;
    }
    return ExpiryStatus.active;
  }

  /// Get the number of days remaining until expiry.
  /// Negative value means expired.
  static int daysRemaining(DateTime expiryDate) {
    final now = tz.TZDateTime.now(_jakarta);
    final today = DateTime(now.year, now.month, now.day);
    final expiry = DateTime(expiryDate.year, expiryDate.month, expiryDate.day);

    return expiry.difference(today).inDays;
  }

  /// Get the notification trigger date for a given expiry date and reminder window.
  /// Returns null if the trigger date is in the past.
  ///
  /// Notification is scheduled at 08:00 WIB on the trigger date.
  static DateTime? nextNotificationDate(DateTime expiryDate, int remindDaysBefore) {
    final expiry = DateTime(expiryDate.year, expiryDate.month, expiryDate.day);
    final triggerDate = expiry.subtract(Duration(days: remindDaysBefore));

    final now = tz.TZDateTime.now(_jakarta);
    final today = DateTime(now.year, now.month, now.day);

    // If trigger date is in the past, return null
    if (triggerDate.isBefore(today)) {
      return null;
    }

    // Return date at 08:00 WIB
    return DateTime(triggerDate.year, triggerDate.month, triggerDate.day, 8, 0, 0);
  }

  /// Check if the expiry is within the given number of days.
  static bool isWithinDays(DateTime expiryDate, int days) {
    final remaining = daysRemaining(expiryDate);
    return remaining >= 0 && remaining <= days;
  }

  /// Check if the expiry is overdue (past the expiry date).
  static bool isOverdue(DateTime expiryDate) {
    return daysRemaining(expiryDate) < 0;
  }

  /// Get a human-readable string for days remaining.
  static String getDaysRemainingText(DateTime expiryDate) {
    final days = daysRemaining(expiryDate);
    if (days < 0) {
      final overdue = days.abs();
      return overdue == 1 ? '1 hari terlewat' : '$overdue hari terlewat';
    } else if (days == 0) {
      return 'Hari ini';
    } else if (days == 1) {
      return '1 hari lagi';
    } else {
      return '$days hari lagi';
    }
  }
}
