import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/usecases/usecase.dart';
import '../../store/domain/entities/store_entity.dart';
import '../../store/domain/usecases/get_stores.usecase.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetStoresUseCase getStoresUseCase;

  HomeCubit({
    required this.getStoresUseCase,
  }) : super(HomeState(
          homeStatus: HomeStatus.initial,
          stores: [],
        ));

  void init() async {
    await _getStores();
  }

  void _loading() {
    emit(state.copyWith(
      homeStatus: HomeStatus.loading,
      successMessage: '',
      errorMessage: '',
    ));
  }

  Future<void> _getStores() async {
    _loading();
    await Future.delayed(Duration(seconds: 3));
    final result = await getStoresUseCase.call(NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          homeStatus: HomeStatus.failure,
          errorMessage: failure.errorMessage,
        ),
      ),
      (success) {
        emit(
          state.copyWith(
            homeStatus: HomeStatus.getStoresSuccess,
            stores: success,
            errorMessage: '',
          ),
        );
      },
    );
  }
}
