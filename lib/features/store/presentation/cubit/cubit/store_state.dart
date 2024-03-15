part of 'store_cubit.dart';

@freezed
class StoreState with _$StoreState {
  const factory StoreState({
    required StoreDetailStatus storeDetailStatus,
    required StoreEntity store,
    final String? successMessage,
    final String? errorMessage,
  }) = _StoreState;
}

enum StoreDetailStatus {
  initial,
  getStoreLoading,
  getStoreSuccess,
  failure,
}
