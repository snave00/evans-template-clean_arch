part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required HomeStoreStatus homeStoreStatus,
    required HomePromosStatus homePromosStatus,
    required List<StoreEntity> stores,
    required List<PromoEntity> promos,
    final String? successMessage,
    final String? errorMessage,
  }) = _HomeState;
}

enum HomeStoreStatus {
  initial,
  getStoresLoading,
  getStoresSuccess,
  failure,
}

enum HomePromosStatus {
  initial,
  getPromosLoading,
  getPromosSuccess,
  failure,
}
