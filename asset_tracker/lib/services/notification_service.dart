import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../domain/entities/expiry_status.dart';
import '../domain/entities/extension_record.dart';

/// Notification service for local scheduled reminders.
/// Following AGENTS.md section 3.7 - local notifications requirements.
class NotificationService {
  final FlutterLocalNotificationsPlugin _notifications;
  bool _initialized = false;

  NotificationService() : _notifications = FlutterLocalNotificationsPlugin();

  /// Initialize the notification service.
  Future<void> initialize() async {
    if (_initialized) return;

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    // Create notification channels for Android
    await _createNotificationChannels();

    _initialized = true;
  }

  /// Create notification channels for different priority levels.
  Future<void> _createNotificationChannels() async {
    final android = _notifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

    if (android == null) return;

    // Critical channel for ≤7 days expiry
    await android.createNotificationChannel(
      const AndroidNotificationChannel(
        'expiry_critical',
        'Expiry Critical',
        description: 'High priority notifications for items expiring within 7 days',
        importance: Importance.high,
        playSound: true,
      ),
    );

    // Warning channel for 8-30 days expiry
    await android.createNotificationChannel(
      const AndroidNotificationChannel(
        'expiry_warning',
        'Expiry Warning',
        description: 'Default priority notifications for items expiring in 8-30 days',
        importance: Importance.defaultImportance,
        playSound: true,
      ),
    );

    // Info channel for 31-90 days expiry
    await android.createNotificationChannel(
      const AndroidNotificationChannel(
        'expiry_info',
        'Expiry Info',
        description: 'Low priority notifications for items expiring in 31-90 days',
        importance: Importance.low,
        playSound: false,
      ),
    );
  }

  /// Schedule an expiry notification for an extension record.
  Future<void> scheduleExpiryNotification(ExtensionRecord record) async {
    if (!_initialized) await initialize();

    final expiryDate = record.expiryDate;
    final daysRemaining = expiryDate.difference(DateTime.now()).inDays;
    
    if (daysRemaining < 0) return;

    final jakarta = tz.getLocation('Asia/Jakarta');
    
    // Calculate notification date (remindDaysBefore days before expiry)
    final notificationDate = expiryDate.subtract(Duration(days: record.remindDaysBefore));
    
    // Schedule at 08:00 WIB
    var scheduledDate = tz.TZDateTime(
      jakarta,
      notificationDate.year,
      notificationDate.month,
      notificationDate.day,
      8,
      0,
    );

    // If the scheduled time is in the past, schedule immediately
    if (scheduledDate.isBefore(tz.TZDateTime.now(jakarta))) {
      scheduledDate = tz.TZDateTime.now(jakarta).add(const Duration(seconds: 5));
    }

    // Determine channel based on days remaining
    final channelId = _getChannelId(daysRemaining);

    final androidDetails = AndroidNotificationDetails(
      channelId,
      _getChannelName(channelId),
      channelDescription: _getChannelDescription(channelId),
      importance: _getChannelImportance(channelId),
      priority: _getChannelPriority(channelId),
      icon: '@mipmap/ic_launcher',
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    // Use platform-specific zonedSchedule
    final androidPlugin = _notifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    
    if (androidPlugin != null) {
      // Android scheduling with platform-specific API
      await androidPlugin.zonedSchedule(
        record.id.hashCode,
        'Pengingat: ${record.label}',
        'Jatuh tempo: ${_formatDate(expiryDate)}. Tap untuk melihat detail.',
        scheduledDate,
        androidDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: record.id,
      );
    } else {
      // iOS scheduling
      await _notifications.zonedSchedule(
        record.id.hashCode,
        'Pengingat: ${record.label}',
        'Jatuh tempo: ${_formatDate(expiryDate)}. Tap untuk melihat detail.',
        scheduledDate,
        iosDetails,
        payload: record.id,
      );
    }
  }

  /// Cancel a scheduled notification for an extension record.
  Future<void> cancelNotification(String recordId) async {
    await _notifications.cancel(recordId.hashCode);
  }

  /// Reschedule all notifications for a list of extension records.
  Future<void> rescheduleAll(List<ExtensionRecord> records) async {
    // Cancel all existing notifications
    await _notifications.cancelAll();

    // Schedule new notifications for each record
    for (final record in records) {
      if (record.status != ExpiryStatus.renewed) {
        await scheduleExpiryNotification(record);
      }
    }
  }

  /// Request notification permissions.
  Future<bool> requestPermissions() async {
    final android = _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    final iOS = _notifications
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>();

    bool? granted;
    
    if (android != null) {
      granted = await android.requestNotificationsPermission();
    }
    
    if (iOS != null) {
      granted = await iOS.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    return granted ?? false;
  }

  /// Handle notification tap - navigate to extension record detail.
  void _onNotificationTap(NotificationResponse response) {
    // TODO: Navigate to extension record detail screen
    // Use GoRouter or navigator to navigate to /records/:id
  }

  String _getChannelId(int daysRemaining) {
    if (daysRemaining <= 7) return 'expiry_critical';
    if (daysRemaining <= 30) return 'expiry_warning';
    return 'expiry_info';
  }

  String _getChannelName(String channelId) {
    switch (channelId) {
      case 'expiry_critical':
        return 'Expiry Critical';
      case 'expiry_warning':
        return 'Expiry Warning';
      default:
        return 'Expiry Info';
    }
  }

  String _getChannelDescription(String channelId) {
    switch (channelId) {
      case 'expiry_critical':
        return 'Notifications for items expiring within 7 days';
      case 'expiry_warning':
        return 'Notifications for items expiring in 8-30 days';
      default:
        return 'Notifications for items expiring in 31-90 days';
    }
  }

  Importance _getChannelImportance(String channelId) {
    switch (channelId) {
      case 'expiry_critical':
        return Importance.high;
      case 'expiry_warning':
        return Importance.defaultImportance;
      default:
        return Importance.low;
    }
  }

  Priority _getChannelPriority(String channelId) {
    switch (channelId) {
      case 'expiry_critical':
        return Priority.high;
      case 'expiry_warning':
        return Priority.defaultPriority;
      default:
        return Priority.low;
    }
  }

  String _formatDate(DateTime date) {
    const months = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}

/// Global instance.
final notificationService = NotificationService();