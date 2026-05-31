import 'package:flutter_test/flutter_test.dart';

import 'package:asset_tracker/core/constants/app_constants.dart';

void main() {
  group('AppConstants', () {
    test('appName is correct', () {
      expect(AppConstants.appName, 'Asset Tracker');
    });

    test('defaultTimezone is Asia/Jakarta', () {
      expect(AppConstants.defaultTimezone, 'Asia/Jakarta');
    });

    test('defaultReminderDays is 30', () {
      expect(AppConstants.defaultReminderDays, 30);
    });

    test('maxFileSizeBytes is 10 MB', () {
      expect(AppConstants.maxFileSizeBytes, 10 * 1024 * 1024);
    });

    test('allowedFileTypes contains expected types', () {
      expect(AppConstants.allowedFileTypes, contains('pdf'));
      expect(AppConstants.allowedFileTypes, contains('jpg'));
      expect(AppConstants.allowedFileTypes, contains('jpeg'));
      expect(AppConstants.allowedFileTypes, contains('png'));
      expect(AppConstants.allowedFileTypes, contains('heic'));
      expect(AppConstants.allowedFileTypes.length, 5);
    });

    test('reminderDayOptions has correct values', () {
      expect(AppConstants.reminderDayOptions, [7, 14, 30, 60, 90]);
    });

    test('biometricLockDuration is 5 minutes', () {
      expect(AppConstants.biometricLockDuration, const Duration(minutes: 5));
    });

    test('storageBucket is set', () {
      expect(AppConstants.storageBucket, 'asset-documents');
    });

    test('maxAttachmentsPerRecord is 5', () {
      expect(AppConstants.maxAttachmentsPerRecord, 5);
    });
  });
}