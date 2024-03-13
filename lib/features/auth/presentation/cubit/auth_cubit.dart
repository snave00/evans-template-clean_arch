import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/entities/user_entity.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(AuthState(
          authStatus: AuthStatus.initial,
          userEntity: UserEntity.empty(),
        ));

  void _loading() {
    emit(state.copyWith(
      authStatus: AuthStatus.loading,
      successMessage: '',
      errorMessage: '',
    ));
  }

  void authStateChanges() async {
    // this delayed is needed to trigger loading
    await Future.delayed(Duration.zero);
    _loading();

    // TODO: for testing only
    // await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(
      authStatus: AuthStatus.authenticated,
      successMessage: 'Authenticated!',
    ));

    // emit(state.copyWith(
    //   authStatus: AuthStatus.unautenticated,
    //   successMessage: 'Unauthenticated!',
    // ));

    // emit(state.copyWith(
    //   authStatus: AuthStatus.failure,
    //   errorMessage: 'Failed!',
    // ));

    // final result = checkAuthUseCase.callStream(NoParams());
    // result.fold(
    //   (failure) => emit(
    //     state.copyWith(
    //       authStatus: AuthStatus.failure,
    //       errorMessage: failure.errorMessage,
    //     ),
    //   ),
    //   (success) {
    //     _authUserSubscription = success.listen((authUser) {
    //       authUser != null
    //           ? emit(state.copyWith(
    //               authStatus: AuthStatus.authenticated,
    //               authUser: authUser,
    //             ))
    //           : emit(state.copyWith(
    //               authStatus: AuthStatus.unauthenticated,
    //               authUser: authUser,
    //             ));
    //     });
    //   },
    // );
  }

  // @override
  // Future<void> close() {
  //   _authUserSubscription?.cancel();
  //   return super.close();
  // }

  // @override
  // String toString() => 'AuthCubit(checkAuthUseCase: $checkAuthUseCase,)';
}
