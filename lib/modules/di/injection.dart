import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/presentation/cubit/user_cubit.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/home/cubit/home_cubit.dart';
import '../../features/store/data/data_source/store_mock_data_source.dart';
import '../../features/store/data/repositories/store_repo_impl.dart';
import '../../features/store/domain/repositories/store_repo.dart';
import '../../features/store/domain/usecases/get_stores.usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // * CUBITS

  sl.registerFactory(() => AuthCubit());
  sl.registerFactory(() => UserCubit());
  sl.registerFactory(() => HomeCubit(
        getStoresUseCase: sl(),
      ));

  // * USECASES

  // store
  sl.registerFactory(() => GetStoresUseCase(storeRepo: sl()));

  // * REPOSITORIES

  sl.registerFactory<StoreRepo>(() => StoreRepoImpl(
        storeMockDataSource: sl(),
      ));

  // * DATA SOURCES LOCAL

  // store mock data
  sl.registerFactory<StoreMockDataSource>(
    () => StoreMockDataSourceImpl(),
  );

  // user isar
  // sl.registerFactory<UserLocalIsarDataSource>(
  //   () => UserLocalIsarDataSourceImpl(
  //     sharedPrefLocalDataSource: sl(),
  //   ),
  // );

  // shared pref
  // sl.registerFactory<SharedPrefLocalDataSource>(
  //   () => SharedPrefLocalDataSourceImpl(
  //     prefs: sl(),
  //   ),
  // );

  // * SHARED PREF
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
}
