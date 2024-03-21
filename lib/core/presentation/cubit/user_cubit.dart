import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/init_dependencies.dart';
import '../../domain/entities/user_entity.dart';

part 'user_cubit.freezed.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit()
      : super(
          UserState(
            userStatus: UserStatus.initial,
            userEntity: UserEntity.empty(),
          ),
        );

  void init({required BuildContext context}) async {
    removeSplash();
  }

  void _loading() {
    emit(state.copyWith(
      userStatus: UserStatus.loading,
      successMessage: '',
      errorMessage: '',
    ));
  }
}
