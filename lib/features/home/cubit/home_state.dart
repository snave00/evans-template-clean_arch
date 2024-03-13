part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required HomeStatus homeStatus,
    final String? successMessage,
    final String? errorMessage,
  }) = _HomeState;
}

enum HomeStatus {
  initial,
  loading,
  failure,
}
