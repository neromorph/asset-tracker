import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:intl/date_symbol_data_local.dart';

import 'package:asset_tracker/core/extensions/date_extensions.dart';

void main() {
  setUpAll(() async {
    tz.initializeTimeZones();
    await initializeDateFormatting('id_ID', null);
  });

  group('DateTimeExtensions', () {
    group('inJakarta', () {
      test('converts UTC to Jakarta TZ', () {
        final utc = DateTime.utc(2026, 6, 1, 0, 0, 0); // midnight UTC
        final jakarta = utc.inJakarta;
        // Jakarta is UTC+7
        expect(jakarta.hour, 7);
      });
    });

    group('startOfDay / endOfDay', () {
      test('startOfDay returns midnight', () {
        final dt = DateTime(2026, 6, 15, 14, 30, 45);
        final start = dt.startOfDay;
        expect(start.hour, 0);
        expect(start.minute, 0);
        expect(start.second, 0);
        expect(start.day, 15);
      });

      test('endOfDay returns 23:59:59.999', () {
        final dt = DateTime(2026, 6, 15, 8, 0, 0);
        final end = dt.endOfDay;
        expect(end.hour, 23);
        expect(end.minute, 59);
        expect(end.second, 59);
        expect(end.millisecond, 999);
        expect(end.day, 15);
      });
    });

    group('daysUntil / daysSince', () {
      test('daysUntil returns positive for future date', () {
        final today = DateTime(2026, 6, 1);
        final future = DateTime(2026, 6, 11);
        expect(today.daysUntil(future), 10);
      });

      test('daysUntil returns negative for past date', () {
        final today = DateTime(2026, 6, 11);
        final past = DateTime(2026, 6, 1);
        expect(today.daysUntil(past), -10);
      });

      test('daysUntil returns 0 for same day', () {
        final today = DateTime(2026, 6, 15, 8, 30);
        final sameDay = DateTime(2026, 6, 15, 20, 0);
        expect(today.daysUntil(sameDay), 0);
      });

      test('daysSince is inverse of daysUntil', () {
        final a = DateTime(2026, 6, 1);
        final b = DateTime(2026, 6, 11);
        expect(a.daysSince(b), -a.daysUntil(b));
      });
    });

    group('isTodayInJakarta', () {
      test('current datetime is today', () {
        expect(DateTime.now().isTodayInJakarta, true);
      });

      test('yesterday is not today', () {
        final yesterday = DateTime.now().subtract(const Duration(days: 1));
        expect(yesterday.isTodayInJakarta, false);
      });
    });

    group('formattedDateId', () {
      test('formats date in Indonesian', () {
        final dt = DateTime(2026, 1, 15);
        final formatted = dt.formattedDateId;
        // Should contain day and year
        expect(formatted, contains('15'));
        expect(formatted, contains('2026'));
      });
    });

    group('formattedDateShortId', () {
      test('formats short date', () {
        final dt = DateTime(2026, 1, 15);
        final formatted = dt.formattedDateShortId;
        expect(formatted, contains('15'));
        expect(formatted, contains('2026'));
      });
    });

    group('formattedDateTimeId', () {
      test('formats datetime with time', () {
        final dt = DateTime(2026, 1, 15, 8, 30);
        final formatted = dt.formattedDateTimeId;
        expect(formatted, contains('15'));
        expect(formatted, contains('08:30'));
      });
    });
  });

  group('CurrencyFormatter', () {
    test('formats integer amount', () {
      final formatted = 150000.formattedIdr;
      expect(formatted, contains('Rp'));
      expect(formatted, contains('150'));
    });

    test('formats zero', () {
      final formatted = 0.formattedIdr;
      expect(formatted, contains('Rp'));
      expect(formatted, contains('0'));
    });

    test('formats large amount', () {
      final formatted = 1000000.formattedIdr;
      expect(formatted, contains('Rp'));
      expect(formatted, contains('1'));
    });
  });
}