import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

/// Extension methods for DateTime handling in Asia/Jakarta timezone.
extension DateTimeExtensions on DateTime {
  /// Get DateTime in Asia/Jakarta timezone.
  tz.TZDateTime get inJakarta {
    final jakarta = tz.getLocation('Asia/Jakarta');
    return tz.TZDateTime.from(this, jakarta);
  }

  /// Get today's date in Asia/Jakarta timezone (midnight).
  DateTime get jakartaToday {
    final now = DateTime.now().inJakarta;
    return DateTime(now.year, now.month, now.day);
  }

  /// Format as Indonesian date string: "15 Januari 2026".
  String get formattedDateId {
    return DateFormat('dd MMMM yyyy', 'id_ID').format(this);
  }

  /// Format as short date: "15 Jan 2026".
  String get formattedDateShortId {
    return DateFormat('dd MMM yyyy', 'id_ID').format(this);
  }

  /// Format as full datetime: "15 Januari 2026, 08:00".
  String get formattedDateTimeId {
    return DateFormat("dd MMMM yyyy, HH:mm", 'id_ID').format(this);
  }

  /// Check if this date is today in Jakarta timezone.
  bool get isTodayInJakarta {
    final jakartaNow = DateTime.now().inJakarta;
    return year == jakartaNow.year && month == jakartaNow.month && day == jakartaNow.day;
  }

  /// Get start of day.
  DateTime get startOfDay => DateTime(year, month, day);

  /// Get end of day.
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999);

  /// Days between this date and another.
  int daysUntil(DateTime other) {
    final thisDay = DateTime(year, month, day);
    final otherDay = DateTime(other.year, other.month, other.day);
    return otherDay.difference(thisDay).inDays;
  }

  /// Days since another date.
  int daysSince(DateTime other) {
    return -daysUntil(other);
  }
}

/// Extension for formatting currency in IDR.
extension CurrencyFormatter on num {
  /// Format as Indonesian Rupiah: "Rp 150.000".
  String get formattedIdr {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(this);
  }
}
