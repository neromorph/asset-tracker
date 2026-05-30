class AppConstants {
  AppConstants._();

  static const String appName = 'Asset Tracker';
  static const String defaultTimezone = 'Asia/Jakarta';
  static const int defaultReminderDays = 30;
  static const int maxFileSizeBytes = 10 * 1024 * 1024; // 10 MB

  static const List<String> allowedFileTypes = [
    'pdf',
    'jpg',
    'jpeg',
    'png',
    'heic',
  ];

  static const List<int> reminderDayOptions = [7, 14, 30, 60, 90];

  static const Duration biometricLockDuration = Duration(minutes: 5);

  // Storage bucket name for Supabase Storage
  static const String storageBucket = 'asset-documents';

  // Maximum files per extension record
  static const int maxAttachmentsPerRecord = 5;
}
