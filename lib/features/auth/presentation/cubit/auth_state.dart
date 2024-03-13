part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required final AuthStatus authStatus,
    required final UserEntity userEntity,
    final String? successMessage,
    final String? errorMessage,
  }) = _AuthState;
}

enum AuthStatus {
  initial,
  loading,
  authenticated,
  unautenticated,
  failure,
}
