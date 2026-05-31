import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tzlib;
import 'package:asset_tracker/core/utils/expiry_engine.dart';
import 'package:asset_tracker/domain/entities/expiry_status.dart';

void main() {
  setUpAll(() {
    // Initialize timezone database for all tests
    tz.initializeTimeZones();
  });

  group('ExpiryEngine', () {
    group('computeStatus', () {
      test('returns expired for past dates', () {
        final past = DateTime.now().subtract(const Duration(days: 1));
        expect(ExpiryEngine.computeStatus(past, 7), ExpiryStatus.expired);
      });

      test('returns expiringSoon for same day (within reminder window)', () {
        final today = DateTime.now();
        final startOfDay = DateTime(today.year, today.month, today.day);
        expect(ExpiryEngine.computeStatus(startOfDay, 7), ExpiryStatus.expiringSoon);
      });

      test('returns expiringSoon for 1 day remaining within window', () {
        final tomorrow = DateTime.now().add(const Duration(days: 1));
        final endOfTomorrow = DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 23, 59, 59);
        expect(ExpiryEngine.computeStatus(endOfTomorrow, 7), ExpiryStatus.expiringSoon);
      });

      test('returns expiringSoon for 7 days remaining (within window)', () {
        final in7Days = DateTime.now().add(const Duration(days: 7));
        expect(ExpiryEngine.computeStatus(in7Days, 7), ExpiryStatus.expiringSoon);
      });

      test('returns active for 8 days remaining (outside window)', () {
        final in8Days = DateTime.now().add(const Duration(days: 8));
        expect(ExpiryEngine.computeStatus(in8Days, 7), ExpiryStatus.active);
      });

      test('returns active for 31 days remaining', () {
        final in31Days = DateTime.now().add(const Duration(days: 31));
        expect(ExpiryEngine.computeStatus(in31Days, 7), ExpiryStatus.active);
      });

      test('returns active for 90 days remaining', () {
        final in90Days = DateTime.now().add(const Duration(days: 90));
        expect(ExpiryEngine.computeStatus(in90Days, 7), ExpiryStatus.active);
      });

      test('respects custom reminder window', () {
        final in15Days = DateTime.now().add(const Duration(days: 15));
        // With 30-day window, 15 days should be expiringSoon
        expect(ExpiryEngine.computeStatus(in15Days, 30), ExpiryStatus.expiringSoon);
        // With 7-day window, 15 days should be active
        expect(ExpiryEngine.computeStatus(in15Days, 7), ExpiryStatus.active);
      });
    });

    group('daysRemaining', () {
      test('returns negative for past dates', () {
        final past = DateTime.now().subtract(const Duration(days: 5));
        expect(ExpiryEngine.daysRemaining(past), lessThan(0));
      });

      test('returns 0 for today', () {
        final today = DateTime.now();
        final startOfDay = DateTime(today.year, today.month, today.day);
        expect(ExpiryEngine.daysRemaining(startOfDay), 0);
      });

      test('returns positive for future dates', () {
        final future = DateTime.now().add(const Duration(days: 30));
        expect(ExpiryEngine.daysRemaining(future), greaterThan(0));
      });

      test('returns 1 for tomorrow', () {
        final tomorrow = DateTime.now().add(const Duration(days: 1));
        final endOfTomorrow = DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 23, 59, 59);
        expect(ExpiryEngine.daysRemaining(endOfTomorrow), 1);
      });
    });

    group('isOverdue', () {
      test('returns true for past dates', () {
        final past = DateTime.now().subtract(const Duration(days: 1));
        expect(ExpiryEngine.isOverdue(past), true);
      });

      test('returns false for today', () {
        final today = DateTime.now();
        final startOfDay = DateTime(today.year, today.month, today.day);
        expect(ExpiryEngine.isOverdue(startOfDay), false);
      });

      test('returns false for future dates', () {
        final future = DateTime.now().add(const Duration(days: 1));
        expect(ExpiryEngine.isOverdue(future), false);
      });
    });

    group('isWithinDays', () {
      test('returns true when within window', () {
        final in5Days = DateTime.now().add(const Duration(days: 5));
        expect(ExpiryEngine.isWithinDays(in5Days, 7), true);
      });

      test('returns false when outside window', () {
        final in10Days = DateTime.now().add(const Duration(days: 10));
        expect(ExpiryEngine.isWithinDays(in10Days, 7), false);
      });

      test('returns false for past dates', () {
        final past = DateTime.now().subtract(const Duration(days: 1));
        expect(ExpiryEngine.isWithinDays(past, 7), false);
      });
    });

    group('nextNotificationDate', () {
      test('returns null when trigger date is in the past', () {
        final past = DateTime.now().subtract(const Duration(days: 10));
        expect(ExpiryEngine.nextNotificationDate(past, 7), null);
      });

      test('returns trigger date at 08:00 for future expiry', () {
        final in10Days = DateTime.now().add(const Duration(days: 10));
        final notificationDate = ExpiryEngine.nextNotificationDate(in10Days, 7);
        expect(notificationDate, isNotNull);
        expect(notificationDate!.hour, 8);
        expect(notificationDate.minute, 0);
      });

      test('notification date is 7 days before expiry', () {
        final in10Days = DateTime.now().add(const Duration(days: 10));
        final notificationDate = ExpiryEngine.nextNotificationDate(in10Days, 7);
        final expiryDate = DateTime(in10Days.year, in10Days.month, in10Days.day);
        final expected = DateTime(expiryDate.year, expiryDate.month, expiryDate.day - 7, 8, 0, 0);
        expect(notificationDate!.day, expected.day);
      });
    });

    group('getDaysRemainingText', () {
      test('returns "Hari ini" for today', () {
        final today = DateTime.now();
        final startOfDay = DateTime(today.year, today.month, today.day);
        expect(ExpiryEngine.getDaysRemainingText(startOfDay), 'Hari ini');
      });

      test('returns "1 hari lagi" for tomorrow', () {
        final tomorrow = DateTime.now().add(const Duration(days: 1));
        final endOfTomorrow = DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 23, 59, 59);
        expect(ExpiryEngine.getDaysRemainingText(endOfTomorrow), '1 hari lagi');
      });

      test('returns "X hari lagi" for future dates', () {
        final in10Days = DateTime.now().add(const Duration(days: 10));
        expect(ExpiryEngine.getDaysRemainingText(in10Days), '10 hari lagi');
      });

      test('returns "1 hari terlewat" for yesterday', () {
        final yesterday = DateTime.now().subtract(const Duration(days: 1));
        expect(ExpiryEngine.getDaysRemainingText(yesterday), '1 hari terlewat');
      });

      test('returns "X hari terlewat" for past dates', () {
        final past = DateTime.now().subtract(const Duration(days: 5));
        expect(ExpiryEngine.getDaysRemainingText(past), '5 hari terlewat');
      });
    });
  });
}