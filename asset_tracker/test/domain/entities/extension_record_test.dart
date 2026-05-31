import 'package:flutter_test/flutter_test.dart';

import 'package:asset_tracker/domain/entities/extension_record.dart';
import 'package:asset_tracker/domain/entities/sync_status.dart';
import 'package:asset_tracker/domain/entities/expiry_status.dart';

void main() {
  final now = DateTime.now();
  final baseRecord = ExtensionRecord(
    id: 'rec-1',
    assetId: 'asset-1',
    familyGroupId: 'family-1',
    type: ExtensionType.document,
    label: 'STNK',
    expiryDate: now.add(const Duration(days: 30)),
    remindDaysBefore: 7,
    status: ExpiryStatus.active,
    syncStatus: SyncStatus.synced,
    createdAt: now,
    updatedAt: now,
  );

  group('ExtensionRecord', () {
    group('constructor', () {
      test('creates with required fields and defaults', () {
        expect(baseRecord.id, 'rec-1');
        expect(baseRecord.label, 'STNK');
        expect(baseRecord.type, ExtensionType.document);
        expect(baseRecord.remindDaysBefore, 7);
        expect(baseRecord.currency, 'IDR');
        expect(baseRecord.billingCycle, isNull);
        expect(baseRecord.amount, isNull);
        expect(baseRecord.renewedFrom, isNull);
      });

      test('creates billing record', () {
        final billing = ExtensionRecord(
          id: 'rec-2',
          assetId: 'asset-1',
          familyGroupId: 'family-1',
          type: ExtensionType.billing,
          label: 'Pajak',
          expiryDate: now.add(const Duration(days: 60)),
          billingCycle: BillingCycle.annual,
          amount: 150000,
          currency: 'IDR',
          status: ExpiryStatus.active,
          syncStatus: SyncStatus.synced,
          createdAt: now,
          updatedAt: now,
        );
        expect(billing.isBilling, true);
        expect(billing.billingCycle, BillingCycle.annual);
        expect(billing.amount, 150000);
      });
    });

    group('isBilling', () {
      test('returns true for billing type', () {
        final billing = baseRecord.copyWith(type: ExtensionType.billing);
        expect(billing.isBilling, true);
      });

      test('returns false for document type', () {
        expect(baseRecord.isBilling, false);
      });

      test('returns false for reminder type', () {
        final reminder = baseRecord.copyWith(type: ExtensionType.reminder);
        expect(reminder.isBilling, false);
      });
    });

    group('copyWith', () {
      test('copies with no changes', () {
        final copy = baseRecord.copyWith();
        expect(copy.id, baseRecord.id);
        expect(copy.label, baseRecord.label);
        expect(copy.type, baseRecord.type);
        expect(copy.remindDaysBefore, baseRecord.remindDaysBefore);
      });

      test('updates status', () {
        final copy = baseRecord.copyWith(status: ExpiryStatus.renewed);
        expect(copy.status, ExpiryStatus.renewed);
        expect(copy.id, baseRecord.id);
      });

      test('updates amount and billing cycle', () {
        final copy = baseRecord.copyWith(
          amount: 500000,
          billingCycle: BillingCycle.monthly,
        );
        expect(copy.amount, 500000);
        expect(copy.billingCycle, BillingCycle.monthly);
      });
    });

    group('fromJson / toJson', () {
      test('round-trips correctly', () {
        final json = baseRecord.toJson();
        final restored = ExtensionRecord.fromJson(json);
        expect(restored.id, baseRecord.id);
        expect(restored.label, baseRecord.label);
        expect(restored.type, baseRecord.type);
        expect(restored.currency, 'IDR');
      });

      test('handles billing record JSON', () {
        final billing = ExtensionRecord(
          id: 'rec-b',
          assetId: 'asset-1',
          familyGroupId: 'family-1',
          type: ExtensionType.billing,
          label: 'Pajak Kendaraan',
          expiryDate: now,
          billingCycle: BillingCycle.annual,
          amount: 250000,
          status: ExpiryStatus.active,
          syncStatus: SyncStatus.synced,
          createdAt: now,
          updatedAt: now,
        );
        final json = billing.toJson();
        final restored = ExtensionRecord.fromJson(json);
        expect(restored.billingCycle, BillingCycle.annual);
        expect(restored.amount, 250000);
        expect(restored.type, ExtensionType.billing);
      });

      test('handles null billing fields in JSON', () {
        final json = {
          'id': 'r1',
          'asset_id': 'a1',
          'family_group_id': 'f1',
          'type': 'document',
          'label': 'Test',
          'expiry_date': now.toIso8601String(),
          'status': 'active',
          'sync_status': 'synced',
          'created_at': now.toIso8601String(),
          'updated_at': now.toIso8601String(),
        };
        final record = ExtensionRecord.fromJson(json);
        expect(record.billingCycle, isNull);
        expect(record.amount, isNull);
        expect(record.remindDaysBefore, 30);
      });

      test('handles unknown type gracefully', () {
        final json = {
          'id': 'r1',
          'asset_id': 'a1',
          'family_group_id': 'f1',
          'type': 'unknown_type',
          'label': 'Test',
          'expiry_date': now.toIso8601String(),
          'status': 'active',
          'sync_status': 'synced',
          'created_at': now.toIso8601String(),
          'updated_at': now.toIso8601String(),
        };
        final record = ExtensionRecord.fromJson(json);
        expect(record.type, ExtensionType.document);
      });
    });

    group('equality', () {
      test('equal by id', () {
        final a = baseRecord;
        final b = baseRecord.copyWith(label: 'Different');
        expect(a, equals(b));
      });

      test('not equal with different id', () {
        final other = baseRecord.copyWith(id: 'rec-other');
        expect(baseRecord, isNot(equals(other)));
      });
    });
  });

  group('BillingCycle', () {
    test('labels are in Indonesian', () {
      expect(BillingCycle.monthly.label, 'Bulanan');
      expect(BillingCycle.quarterly.label, 'Triwulanan');
      expect(BillingCycle.semiAnnual.label, 'Semester');
      expect(BillingCycle.annual.label, 'Tahunan');
      expect(BillingCycle.oneTime.label, 'Sekali');
    });
  });

  group('ExtensionType', () {
    test('has correct values', () {
      expect(ExtensionType.values.length, 3);
      expect(ExtensionType.values, contains(ExtensionType.document));
      expect(ExtensionType.values, contains(ExtensionType.billing));
      expect(ExtensionType.values, contains(ExtensionType.reminder));
    });
  });
}