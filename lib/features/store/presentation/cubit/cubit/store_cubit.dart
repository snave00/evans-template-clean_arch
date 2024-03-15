import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/store_entity.dart';
import '../../../domain/usecases/get_store_usecase.dart';

part 'store_cubit.freezed.dart';
part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  final GetStoreUseCase getStoreUseCase;

  StoreCubit({
    required this.getStoreUseCase,
  }) : super(StoreState(
          storeDetailStatus: StoreDetailStatus.initial,
          store: StoreEntity.empty(),
        ));

  void init({required String storeId}) async {
    // this is needed if u showProgressDialog to avoid popping the page
    // await Future.delayed(Duration.zero);

    // don't put await so both will load at the same time
    _getStore(storeId: storeId);
  }

  Future<void> _getStore({required String storeId}) async {
    _loadingStore();
    final result = await getStoreUseCase.call(storeId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          storeDetailStatus: StoreDetailStatus.failure,
          errorMessage: failure.errorMessage,
        ),
      ),
      (success) {
        emit(
          state.copyWith(
            storeDetailStatus: StoreDetailStatus.getStoreSuccess,
            store: success,
            errorMessage: '',
          ),
        );
      },
    );
  }

  void _loadingStore() {
    emit(state.copyWith(
      storeDetailStatus: StoreDetailStatus.getStoreLoading,
      successMessage: '',
      errorMessage: '',
    ));
  }
}
