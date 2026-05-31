import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asset_tracker/domain/entities/expiry_status.dart';

void main() {
  group('ExpiryStatus Enum Tests', () {
    test('ExpiryStatus has correct values', () {
      expect(ExpiryStatus.values.length, 5);
      expect(ExpiryStatus.values, contains(ExpiryStatus.active));
      expect(ExpiryStatus.values, contains(ExpiryStatus.expiringSoon));
      expect(ExpiryStatus.values, contains(ExpiryStatus.expired));
      expect(ExpiryStatus.values, contains(ExpiryStatus.renewed));
      expect(ExpiryStatus.values, contains(ExpiryStatus.none));
    });

    test('ExpiryStatus labels are in Indonesian', () {
      expect(ExpiryStatus.active.label, 'Aktif');
      expect(ExpiryStatus.expiringSoon.label, 'Mendekati Kedaluwarsa');
      expect(ExpiryStatus.expired.label, 'Kadaluwarsa');
      expect(ExpiryStatus.renewed.label, 'Diperbarui');
      expect(ExpiryStatus.none.label, 'Tidak Dit脾');
    });

    test('ExpiryStatus shortLabels are in Indonesian', () {
      expect(ExpiryStatus.active.shortLabel, 'Aktif');
      expect(ExpiryStatus.expiringSoon.shortLabel, 'Mendatang');
      expect(ExpiryStatus.expired.shortLabel, 'Terlewat');
      expect(ExpiryStatus.renewed.shortLabel, 'Perbarui');
      expect(ExpiryStatus.none.shortLabel, '-');
    });
  });

  group('ExpiryStatus Widget Rendering', () {
    testWidgets('displays status label correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Text(ExpiryStatus.active.label),
          ),
        ),
      );

      expect(find.text('Aktif'), findsOneWidget);
    });

    testWidgets('displays different status labels', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Text(ExpiryStatus.active.label),
                Text(ExpiryStatus.expiringSoon.label),
                Text(ExpiryStatus.expired.label),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Aktif'), findsOneWidget);
      expect(find.text('Mendekati Kedaluwarsa'), findsOneWidget);
      expect(find.text('Kadaluwarsa'), findsOneWidget);
    });
  });
}