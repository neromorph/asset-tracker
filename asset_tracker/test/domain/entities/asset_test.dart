import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'package:asset_tracker/domain/entities/asset.dart';
import 'package:asset_tracker/domain/entities/sync_status.dart';
import 'package:asset_tracker/domain/entities/expiry_status.dart';

void main() {
  setUpAll(() {
    tz.initializeTimeZones();
  });

  final now = DateTime.now();
  final baseAsset = Asset(
    id: 'asset-1',
    familyGroupId: 'family-1',
    createdBy: 'user-1',
    name: 'Test Asset',
    category: 'vehicle',
    iconName: 'car',
    syncStatus: SyncStatus.synced,
    createdAt: now,
    updatedAt: now,
  );

  group('Asset', () {
    group('constructor', () {
      test('creates with required fields', () {
        expect(baseAsset.id, 'asset-1');
        expect(baseAsset.name, 'Test Asset');
        expect(baseAsset.category, 'vehicle');
        expect(baseAsset.isArchived, false);
        expect(baseAsset.customFields, isEmpty);
        expect(baseAsset.templateId, isNull);
        expect(baseAsset.notes, isNull);
        expect(baseAsset.expiryDate, isNull);
        expect(baseAsset.defaultRemindDaysBefore, 7);
      });

      test('creates with optional fields', () {
        final asset = Asset(
          id: 'a1',
          familyGroupId: 'f1',
          createdBy: 'u1',
          name: 'Car',
          category: 'vehicle',
          iconName: 'car',
          templateId: 't1',
          notes: 'My car',
          customFields: {'plate': 'AB 1234'},
          isArchived: true,
          syncStatus: SyncStatus.pendingCreate,
          createdAt: now,
          updatedAt: now,
          expiryDate: now.add(const Duration(days: 30)),
          defaultRemindDaysBefore: 14,
        );
        expect(asset.templateId, 't1');
        expect(asset.notes, 'My car');
        expect(asset.customFields['plate'], 'AB 1234');
        expect(asset.isArchived, true);
        expect(asset.defaultRemindDaysBefore, 14);
        expect(asset.expiryDate, isNotNull);
      });
    });

    group('copyWith', () {
      test('copies with no changes', () {
        final copy = baseAsset.copyWith();
        expect(copy.id, baseAsset.id);
        expect(copy.name, baseAsset.name);
        expect(copy.expiryDate, baseAsset.expiryDate);
        expect(copy.defaultRemindDaysBefore, baseAsset.defaultRemindDaysBefore);
      });

      test('updates name only', () {
        final copy = baseAsset.copyWith(name: 'Updated');
        expect(copy.name, 'Updated');
        expect(copy.id, baseAsset.id);
      });

      test('preserves expiryDate through copyWith', () {
        final expiry = now.add(const Duration(days: 10));
        final withExpiry = baseAsset.copyWith(expiryDate: expiry);
        expect(withExpiry.expiryDate, expiry);

        final nameChanged = withExpiry.copyWith(name: 'Renamed');
        expect(nameChanged.expiryDate, expiry);
        expect(nameChanged.name, 'Renamed');
      });

      test('preserves defaultRemindDaysBefore through copyWith', () {
        final withReminder = baseAsset.copyWith(defaultRemindDaysBefore: 30);
        expect(withReminder.defaultRemindDaysBefore, 30);

        final nameChanged = withReminder.copyWith(name: 'Renamed');
        expect(nameChanged.defaultRemindDaysBefore, 30);
      });

      test('updates syncStatus', () {
        final copy = baseAsset.copyWith(syncStatus: SyncStatus.pendingUpdate);
        expect(copy.syncStatus, SyncStatus.pendingUpdate);
      });
    });

    group('fromJson / toJson', () {
      test('round-trips correctly', () {
        final json = baseAsset.toJson();
        final restored = Asset.fromJson(json);
        expect(restored.id, baseAsset.id);
        expect(restored.name, baseAsset.name);
        expect(restored.category, baseAsset.category);
        expect(restored.syncStatus, baseAsset.syncStatus);
      });

      test('round-trips with expiryDate', () {
        final expiry = DateTime(2026, 12, 31);
        final asset = baseAsset.copyWith(expiryDate: expiry, defaultRemindDaysBefore: 14);
        final json = asset.toJson();
        final restored = Asset.fromJson(json);
        expect(restored.expiryDate, isNotNull);
        expect(restored.expiryDate!.year, 2026);
        expect(restored.expiryDate!.month, 12);
        expect(restored.expiryDate!.day, 31);
        expect(restored.defaultRemindDaysBefore, 14);
      });

      test('handles null optional fields in JSON', () {
        final json = {
          'id': 'a1',
          'family_group_id': 'f1',
          'created_by': 'u1',
          'name': 'Test',
          'category': 'vehicle',
          'icon_name': 'car',
          'created_at': now.toIso8601String(),
          'updated_at': now.toIso8601String(),
        };
        final asset = Asset.fromJson(json);
        expect(asset.templateId, isNull);
        expect(asset.notes, isNull);
        expect(asset.customFields, isEmpty);
        expect(asset.isArchived, false);
        expect(asset.expiryDate, isNull);
        expect(asset.defaultRemindDaysBefore, 7);
      });

      test('handles unknown sync_status gracefully', () {
        final json = {
          'id': 'a1',
          'family_group_id': 'f1',
          'created_by': 'u1',
          'name': 'Test',
          'category': 'vehicle',
          'icon_name': 'car',
          'sync_status': 'unknown_value',
          'created_at': now.toIso8601String(),
          'updated_at': now.toIso8601String(),
        };
        final asset = Asset.fromJson(json);
        expect(asset.syncStatus, SyncStatus.synced);
      });

      test('toJson omits expiryDate when null', () {
        final json = baseAsset.toJson();
        expect(json.containsKey('expiry_date'), false);
      });
    });

    group('computed properties', () {
      test('status is none when no expiryDate', () {
        expect(baseAsset.status, ExpiryStatus.none);
      });

      test('status is active for far future expiry', () {
        final asset = baseAsset.copyWith(
          expiryDate: now.add(const Duration(days: 90)),
        );
        expect(asset.status, ExpiryStatus.active);
      });

      test('status is expiringSoon within reminder window', () {
        final asset = baseAsset.copyWith(
          expiryDate: now.add(const Duration(days: 3)),
          defaultRemindDaysBefore: 7,
        );
        expect(asset.status, ExpiryStatus.expiringSoon);
      });

      test('status is expired for past date', () {
        final asset = baseAsset.copyWith(
          expiryDate: now.subtract(const Duration(days: 5)),
        );
        expect(asset.status, ExpiryStatus.expired);
      });

      test('daysRemaining returns 0 when no expiryDate', () {
        expect(baseAsset.daysRemaining, 0);
      });

      test('daysRemaining is positive for future expiry', () {
        final asset = baseAsset.copyWith(
          expiryDate: now.add(const Duration(days: 30)),
        );
        expect(asset.daysRemaining, greaterThan(0));
      });

      test('daysRemaining is negative for past expiry', () {
        final asset = baseAsset.copyWith(
          expiryDate: now.subtract(const Duration(days: 5)),
        );
        expect(asset.daysRemaining, lessThan(0));
      });

      test('isExpired is false when no expiryDate', () {
        expect(baseAsset.isExpired, false);
      });

      test('isExpired is true for past date', () {
        final asset = baseAsset.copyWith(
          expiryDate: now.subtract(const Duration(days: 1)),
        );
        expect(asset.isExpired, true);
      });

      test('isExpired is false for future date', () {
        final asset = baseAsset.copyWith(
          expiryDate: now.add(const Duration(days: 30)),
        );
        expect(asset.isExpired, false);
      });
    });

    group('equality', () {
      test('equal by id', () {
        final a = baseAsset;
        final b = baseAsset.copyWith(name: 'Different Name');
        expect(a, equals(b));
      });

      test('not equal with different id', () {
        final other = Asset(
          id: 'other-id',
          familyGroupId: 'f1',
          createdBy: 'u1',
          name: 'Test Asset',
          category: 'vehicle',
          iconName: 'car',
          syncStatus: SyncStatus.synced,
          createdAt: now,
          updatedAt: now,
        );
        expect(baseAsset, isNot(equals(other)));
      });

      test('hashCode based on id', () {
        expect(baseAsset.hashCode, 'asset-1'.hashCode);
      });
    });
  });
}