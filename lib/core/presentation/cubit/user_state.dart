part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    required final UserStatus userStatus,
    required final UserEntity userEntity,
    final String? successMessage,
    final String? errorMessage,
  }) = _UserState;
}

enum UserStatus {
  initial,
  loading,
  success, // general success
  getUserSuccess,
  failure,
}
