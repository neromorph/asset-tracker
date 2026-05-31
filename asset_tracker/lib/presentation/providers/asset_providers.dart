import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/errors/app_exceptions.dart';
import '../../domain/entities/asset.dart';
import '../../domain/entities/expiry_status.dart';
import '../../domain/entities/sync_status.dart';
import '../../domain/repositories/asset_repository.dart';
import 'repository_providers.dart';

/// Asset list state.
class AssetListState {
  final List<Asset> assets;
  final bool isLoading;
  final String? error;
  final ExpiryStatus? filterStatus;
  final String? searchQuery;

  const AssetListState({
    this.assets = const [],
    this.isLoading = false,
    this.error,
    this.filterStatus,
    this.searchQuery,
  });

  AssetListState copyWith({
    List<Asset>? assets,
    bool? isLoading,
    String? error,
    ExpiryStatus? filterStatus,
    String? searchQuery,
  }) {
    return AssetListState(
      assets: assets ?? this.assets,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      filterStatus: filterStatus ?? this.filterStatus,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  List<Asset> get filteredAssets {
    var result = assets;

    if (filterStatus != null) {
      result = result.where((a) => a.status == filterStatus).toList();
    }

    if (searchQuery != null && searchQuery!.isNotEmpty) {
      final query = searchQuery!.toLowerCase();
      result = result.where((a) =>
        a.name.toLowerCase().contains(query) ||
        (a.notes?.toLowerCase().contains(query) ?? false)
      ).toList();
    }

    return result;
  }
}

/// Asset list notifier.
class AssetListNotifier extends AsyncNotifier<AssetListState> {
  @override
  Future<AssetListState> build() async {
    // Don't load automatically - wait for refresh
    return const AssetListState();
  }

  Future<void> loadAssets() async {
    state = const AsyncValue.data(AssetListState(isLoading: true));

    try {
      final repository = ref.read(assetRepositoryProvider);
      // TODO: Use actual familyGroupId from auth
      const familyGroupId = 'default';
      final result = await repository.getAssets(familyGroupId);

      result.fold(
        (error) => state = AsyncValue.data(AssetListState(error: error.message)),
        (assets) => state = AsyncValue.data(AssetListState(assets: assets)),
      );
    } catch (e) {
      state = AsyncValue.data(AssetListState(error: e.toString()));
    }
  }

  Future<void> refresh() async {
    await loadAssets();
  }

  void setFilter(ExpiryStatus? status) {
    final current = state.valueOrNull ?? const AssetListState();
    state = AsyncValue.data(current.copyWith(filterStatus: status));
  }

  void setSearch(String? query) {
    final current = state.valueOrNull ?? const AssetListState();
    state = AsyncValue.data(current.copyWith(searchQuery: query));
  }
}

/// Asset list provider.
final assetListProvider =
    AsyncNotifierProvider<AssetListNotifier, AssetListState>(AssetListNotifier.new);

/// Asset by ID provider.
final assetByIdProvider = FutureProvider.family<Either<AppException, Asset>, String>((ref, id) async {
  final repository = ref.read(assetRepositoryProvider);
  return repository.getAsset(id);
});

/// Assets by status provider.
final assetsByStatusProvider = Provider.family<List<Asset>, ExpiryStatus>((ref, status) {
  final assets = ref.watch(assetListProvider).valueOrNull?.assets ?? [];
  return assets.where((a) => a.status == status).toList();
});

/// Critical assets count provider (expired + expiring soon today).
final criticalAssetsCountProvider = Provider<int>((ref) {
  final assets = ref.watch(assetListProvider).valueOrNull?.assets ?? [];
  return assets.where((a) => 
    a.status == ExpiryStatus.expired || 
    (a.status == ExpiryStatus.expiringSoon && a.daysRemaining <= 1)
  ).length;
});

/// Warning assets count provider (expiring soon within window).
final warningAssetsCountProvider = Provider<int>((ref) {
  return ref.watch(assetsByStatusProvider(ExpiryStatus.expiringSoon)).length;
});

/// Asset creation state.
sealed class AssetCreationState {
  const AssetCreationState();
}

class AssetCreationInitial extends AssetCreationState {
  const AssetCreationInitial();
}

class AssetCreationLoading extends AssetCreationState {
  const AssetCreationLoading();
}

class AssetCreationSuccess extends AssetCreationState {
  final Asset asset;
  const AssetCreationSuccess(this.asset);
}

class AssetCreationError extends AssetCreationState {
  final AppException error;
  const AssetCreationError(this.error);
}

/// Asset creation notifier.
class AssetCreationNotifier extends Notifier<AssetCreationState> {
  @override
  AssetCreationState build() {
    return const AssetCreationInitial();
  }

  Future<Asset?> createAsset(Asset asset) async {
    state = const AssetCreationLoading();

    try {
      final repository = ref.read(assetRepositoryProvider);
      final result = await repository.createAsset(asset);

      return result.fold(
        (error) {
          state = AssetCreationError(error);
          return null;
        },
        (createdAsset) {
          state = AssetCreationSuccess(createdAsset);
          // Refresh asset list
          ref.read(assetListProvider.notifier).refresh();
          return createdAsset;
        },
      );
    } catch (e) {
      state = AssetCreationError(StorageException('Failed to create asset: $e'));
      return null;
    }
  }
}

/// Asset creation provider.
final assetCreationProvider =
    NotifierProvider<AssetCreationNotifier, AssetCreationState>(
        AssetCreationNotifier.new);