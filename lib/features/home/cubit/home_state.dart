part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required HomeStatus homeStatus,
    required List<StoreEntity> stores,
    final String? successMessage,
    final String? errorMessage,
  }) = _HomeState;
}

enum HomeStatus {
  initial,
  loading,
  getStoresSuccess,
  success,
  failure,
}
