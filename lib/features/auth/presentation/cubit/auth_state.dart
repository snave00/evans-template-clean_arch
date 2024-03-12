part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.success(final String message) = _Success;

  const factory AuthState.failure(final String message) = _Failure;
}
