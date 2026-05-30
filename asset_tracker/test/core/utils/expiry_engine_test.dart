import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/timezone.dart';
import 'package:asset_tracker/core/utils/expiry_engine.dart';
import 'package:asset_tracker/domain/entities/expiry_status.dart';

void main() {
  group('ExpiryEngine', () {
    late Location jakarta;

    setUpAll(() {
      // Initialize timezone data
      tz.initializeTimeZones();
      jakarta = tz.getLocation('Asia/Jakarta');
    });

    /// Helper to create a TZDateTime in Jakarta with specific date.
    TZDateTime _jakartaDateTime(int year, int month, int day, {int hour = 12}) {
      return tz.TZDateTime(jakarta, year, month, day, hour);
    }

    /// Helper to get today's date in Jakarta at midnight.
    DateTime _todayInJakarta() {
      final now = tz.TZDateTime.now(jakarta);
      return DateTime(now.year, now.month, now.day);
    }

    group('computeStatus', () {
      test('expiring today should return expiringSoon', () {
        final today = _todayInJakarta();
        final result = ExpiryEngine.computeStatus(today, 30);
        expect(result, ExpiryStatus.expiringSoon);
      });

      test('expired yesterday should return expired', () {
        final yesterday = _todayInJakarta().subtract(const Duration(days: 1));
        final result = ExpiryEngine.computeStatus(yesterday, 30);
        expect(result, ExpiryStatus.expired);
      });

      test('expiring in exactly remindDaysBefore days should return expiringSoon', () {
        final today = _todayInJakarta();
        final exactly30Days = today.add(const Duration(days: 30));
        final result = ExpiryEngine.computeStatus(exactly30Days, 30);
        expect(result, ExpiryStatus.expiringSoon);
      });

      test('expiring in remindDaysBefore + 1 days should return active', () {
        final today = _todayInJakarta();
        final days31 = today.add(const Duration(days: 31));
        final result = ExpiryEngine.computeStatus(days31, 30);
        expect(result, ExpiryStatus.active);
      });

      test('expired long ago should return expired', () {
        final longAgo = _todayInJakarta().subtract(const Duration(days: 100));
        final result = ExpiryEngine.computeStatus(longAgo, 30);
        expect(result, ExpiryStatus.expired);
      });

      test('far future expiry should return active', () {
        final farFuture = _todayInJakarta().add(const Duration(days: 365));
        final result = ExpiryEngine.computeStatus(farFuture, 30);
        expect(result, ExpiryStatus.active);
      });

      test('expiry at midnight Jakarta time boundary', () {
        // Test at 00:00 WIB boundary
        final now = tz.TZDateTime.now(jakarta);
        final midnightExpiry = DateTime(now.year, now.month, now.day, 0, 0, 0);
        final result = ExpiryEngine.computeStatus(midnightExpiry, 30);
        // Midnight of today should still count as today = expiringSoon
        expect(result, ExpiryStatus.expiringSoon);
      });
    });

    group('daysRemaining', () {
      test('returns positive days for future expiry', () {
        final future = _todayInJakarta().add(const Duration(days: 10));
        final result = ExpiryEngine.daysRemaining(future);
        expect(result, 10);
      });

      test('returns zero for today expiry', () {
        final today = _todayInJakarta();
        final result = ExpiryEngine.daysRemaining(today);
        expect(result, 0);
      });

      test('returns negative for past expiry', () {
        final past = _todayInJakarta().subtract(const Duration(days: 5));
        final result = ExpiryEngine.daysRemaining(past);
        expect(result, -5);
      });
    });

    group('nextNotificationDate', () {
      test('returns future trigger date at 08:00 WIB', () {
        final expiryDate = _todayInJakarta().add(const Duration(days: 30));
        final result = ExpiryEngine.nextNotificationDate(expiryDate, 30);

        expect(result, isNotNull);
        expect(result!.hour, 8);
        expect(result.minute, 0);
        expect(result.day, expiryDate.day - 30);
      });

      test('returns null for past trigger date', () {
        final recentExpiry = _todayInJakarta().subtract(const Duration(days: 1));
        final result = ExpiryEngine.nextNotificationDate(recentExpiry, 30);
        expect(result, isNull);
      });

      test('returns exactly trigger date for same-day expiry', () {
        final today = _todayInJakarta();
        // If expiry is today and reminder is 0 days
        final result = ExpiryEngine.nextNotificationDate(today, 0);
        expect(result, isNotNull);
        expect(result!.day, today.day);
      });
    });

    group('isWithinDays', () {
      test('returns true when within threshold', () {
        final future = _todayInJakarta().add(const Duration(days: 5));
        final result = ExpiryEngine.isWithinDays(future, 7);
        expect(result, true);
      });

      test('returns false when beyond threshold', () {
        final future = _todayInJakarta().add(const Duration(days: 10));
        final result = ExpiryEngine.isWithinDays(future, 7);
        expect(result, false);
      });

      test('returns false when expired', () {
        final past = _todayInJakarta().subtract(const Duration(days: 1));
        final result = ExpiryEngine.isWithinDays(past, 7);
        expect(result, false);
      });
    });

    group('isOverdue', () {
      test('returns true for past expiry', () {
        final past = _todayInJakarta().subtract(const Duration(days: 1));
        final result = ExpiryEngine.isOverdue(past);
        expect(result, true);
      });

      test('returns false for future expiry', () {
        final future = _todayInJakarta().add(const Duration(days: 1));
        final result = ExpiryEngine.isOverdue(future);
        expect(result, false);
      });

      test('returns false for today', () {
        final today = _todayInJakarta();
        final result = ExpiryEngine.isOverdue(today);
        expect(result, false);
      });
    });

    group('getDaysRemainingText', () {
      test('returns correct text for future expiry', () {
        final future = _todayInJakarta().add(const Duration(days: 5));
        final result = ExpiryEngine.getDaysRemainingText(future);
        expect(result, '5 hari lagi');
      });

      test('returns correct text for today', () {
        final today = _todayInJakarta();
        final result = ExpiryEngine.getDaysRemainingText(today);
        expect(result, 'Hari ini');
      });

      test('returns correct text for single day overdue', () {
        final yesterday = _todayInJakarta().subtract(const Duration(days: 1));
        final result = ExpiryEngine.getDaysRemainingText(yesterday);
        expect(result, '1 hari terlewat');
      });

      test('returns correct text for multiple days overdue', () {
        final past = _todayInJakarta().subtract(const Duration(days: 10));
        final result = ExpiryEngine.getDaysRemainingText(past);
        expect(result, '10 hari terlewat');
      });
    });
  });
}
