import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'package:asset_tracker/presentation/providers/asset_providers.dart';
import 'package:asset_tracker/domain/entities/asset.dart';
import 'package:asset_tracker/domain/entities/sync_status.dart';
import 'package:asset_tracker/domain/entities/expiry_status.dart';
import 'package:asset_tracker/core/errors/app_exceptions.dart';

void main() {
  setUpAll(() {
    tz.initializeTimeZones();
  });

  final now = DateTime.now();

  Asset makeAsset(String id, {String? name, DateTime? expiryDate, String? notes}) {
    return Asset(
      id: id,
      familyGroupId: 'f1',
      createdBy: 'u1',
      name: name ?? 'Asset $id',
      category: 'vehicle',
      iconName: 'car',
      notes: notes,
      syncStatus: SyncStatus.synced,
      createdAt: now,
      updatedAt: now,
      expiryDate: expiryDate,
    );
  }

  group('AssetListState', () {
    group('constructor', () {
      test('defaults', () {
        const state = AssetListState();
        expect(state.assets, isEmpty);
        expect(state.isLoading, false);
        expect(state.error, isNull);
        expect(state.filterStatus, isNull);
        expect(state.searchQuery, isNull);
      });
    });

    group('copyWith', () {
      test('updates isLoading', () {
        const state = AssetListState();
        final updated = state.copyWith(isLoading: true);
        expect(updated.isLoading, true);
        expect(updated.assets, isEmpty);
      });

      test('updates error (clears on null)', () {
        final state = const AssetListState().copyWith(error: 'Something broke');
        expect(state.error, 'Something broke');
        final cleared = state.copyWith(error: null);
        expect(cleared.error, isNull);
      });
    });

    group('filteredAssets', () {
      test('returns all when no filter', () {
        final state = AssetListState(
          assets: [makeAsset('1'), makeAsset('2'), makeAsset('3')],
        );
        expect(state.filteredAssets.length, 3);
      });

      test('filters by status', () {
        final state = AssetListState(
          assets: [
            makeAsset('1', expiryDate: now.add(const Duration(days: 90))),
            makeAsset('2', expiryDate: now.subtract(const Duration(days: 5))),
            makeAsset('3', expiryDate: now.add(const Duration(days: 3))),
          ],
          filterStatus: ExpiryStatus.expired,
        );
        final filtered = state.filteredAssets;
        expect(filtered.length, 1);
        expect(filtered.first.id, '2');
      });

      test('filters by search query on name', () {
        final state = AssetListState(
          assets: [
            makeAsset('1', name: 'Honda Jazz'),
            makeAsset('2', name: 'Toyota Avanza'),
            makeAsset('3', name: 'Honda Civic'),
          ],
          searchQuery: 'honda',
        );
        final filtered = state.filteredAssets;
        expect(filtered.length, 2);
      });

      test('filters by search query on notes', () {
        final state = AssetListState(
          assets: [
            makeAsset('1', name: 'Car', notes: 'Blue honda jazz'),
            makeAsset('2', name: 'Bike', notes: 'Red yamaha'),
          ],
          searchQuery: 'honda',
        );
        final filtered = state.filteredAssets;
        expect(filtered.length, 1);
        expect(filtered.first.id, '1');
      });

      test('empty search returns all', () {
        final state = AssetListState(
          assets: [makeAsset('1'), makeAsset('2')],
          searchQuery: '',
        );
        expect(state.filteredAssets.length, 2);
      });

      test('combines filter and search', () {
        final state = AssetListState(
          assets: [
            makeAsset('1', name: 'Honda Jazz', expiryDate: now.add(const Duration(days: 90))),
            makeAsset('2', name: 'Honda Civic', expiryDate: now.subtract(const Duration(days: 1))),
            makeAsset('3', name: 'Toyota', expiryDate: now.subtract(const Duration(days: 1))),
          ],
          filterStatus: ExpiryStatus.expired,
          searchQuery: 'honda',
        );
        final filtered = state.filteredAssets;
        expect(filtered.length, 1);
        expect(filtered.first.id, '2');
      });
    });
  });

  group('AssetCreationState', () {
    test('initial state', () {
      const state = AssetCreationInitial();
      expect(state, isA<AssetCreationState>());
    });

    test('loading state', () {
      const state = AssetCreationLoading();
      expect(state, isA<AssetCreationState>());
    });

    test('success state contains asset', () {
      final asset = makeAsset('1');
      final state = AssetCreationSuccess(asset);
      expect(state, isA<AssetCreationState>());
      expect(state.asset.id, '1');
    });

    test('error state contains exception', () {
      const state = AssetCreationError(StorageException('fail'));
      expect(state, isA<AssetCreationState>());
      expect(state.error.message, 'fail');
    });

    test('exhaustive pattern matching', () {
      const AssetCreationState state = AssetCreationInitial();
      final result = switch (state) {
        AssetCreationInitial() => 'initial',
        AssetCreationLoading() => 'loading',
        AssetCreationSuccess() => 'success',
        AssetCreationError() => 'error',
      };
      expect(result, 'initial');
    });
  });
}