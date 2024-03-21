part of 'store_cubit.dart';

@freezed
class StoreState with _$StoreState {
  const factory StoreState({
    required StoreDetailStatus storeDetailStatus,
    required StoreProductsStatus storeProductsStatus,
    required StoreEntity store,
    required List<ProductEntity> products,
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

enum StoreProductsStatus {
  initial,
  getProductsLoading,
  getProductsSuccess,
  failure,
}
