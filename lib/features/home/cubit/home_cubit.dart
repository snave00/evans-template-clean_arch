import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/usecases/usecase.dart';
import '../../promos/domain/entities/promo_entity.dart';
import '../../promos/domain/usecases/get_promos_usecase.dart';
import '../../store/domain/entities/store_entity.dart';
import '../../store/domain/usecases/get_stores_usecase.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetStoresUseCase getStoresUseCase;
  final GetPromosUseCase getPromosUseCase;

  HomeCubit({
    required this.getStoresUseCase,
    required this.getPromosUseCase,
  }) : super(HomeState(
          homeStoreStatus: HomeStoreStatus.initial,
          homePromosStatus: HomePromosStatus.initial,
          stores: [],
          promos: [],
        ));

  void init() async {
    // don't put await so both will load at the same time
    _getStores();
    _getPromos();
  }

  Future<void> _getStores() async {
    _loadingStore();
    // await Future.delayed(const Duration(seconds: 1));
    final result = await getStoresUseCase.call(NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          homeStoreStatus: HomeStoreStatus.failure,
          errorMessage: failure.errorMessage,
        ),
      ),
      (success) {
        emit(
          state.copyWith(
            homeStoreStatus: HomeStoreStatus.getStoresSuccess,
            stores: success,
            errorMessage: '',
          ),
        );
      },
    );
  }

  Future<void> _getPromos() async {
    _loadingPromo();
    // await Future.delayed(const Duration(seconds: 2));
    final result = await getPromosUseCase.call(NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          homePromosStatus: HomePromosStatus.failure,
          errorMessage: failure.errorMessage,
        ),
      ),
      (success) {
        emit(
          state.copyWith(
            homePromosStatus: HomePromosStatus.getPromosSuccess,
            promos: success,
            errorMessage: '',
          ),
        );
      },
    );
  }

  void _loadingStore() {
    emit(state.copyWith(
      homeStoreStatus: HomeStoreStatus.getStoresLoading,
      successMessage: '',
      errorMessage: '',
    ));
  }

  void _loadingPromo() {
    emit(state.copyWith(
      homePromosStatus: HomePromosStatus.getPromosLoading,
      successMessage: '',
      errorMessage: '',
    ));
  }
}
