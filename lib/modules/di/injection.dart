import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/presentation/cubit/user_cubit.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/home/cubit/home_cubit.dart';
import '../../features/product/data/data_source/product_mock_data_source.dart';
import '../../features/product/data/repositories/product_repo_impl.dart';
import '../../features/product/domain/repositories/product_repo.dart';
import '../../features/product/domain/usecases/get_product_usecase.dart';
import '../../features/product/domain/usecases/get_products_usecase.dart';
import '../../features/promos/data/data_source/promo_mock_data_source.dart';
import '../../features/promos/data/repositories/promo_repo_impl.dart';
import '../../features/promos/domain/repositories/promo_repo.dart';
import '../../features/promos/domain/usecases/get_promos_usecase.dart';
import '../../features/store/data/data_source/store_mock_data_source.dart';
import '../../features/store/data/repositories/store_repo_impl.dart';
import '../../features/store/domain/repositories/store_repo.dart';
import '../../features/store/domain/usecases/get_store_usecase.dart';
import '../../features/store/domain/usecases/get_stores_usecase.dart';
import '../../features/store/presentation/cubit/cubit/store_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // * CUBITS
  sl.registerFactory(() => AuthCubit());
  sl.registerFactory(() => UserCubit());
  sl.registerFactory(
    () => HomeCubit(
      getStoresUseCase: sl(),
      getPromosUseCase: sl(),
    ),
  );
  sl.registerFactory(() => StoreCubit(
        getStoreUseCase: sl(),
        getProductsUseCase: sl(),
      ));

  // * USECASES
  // store
  sl.registerFactory(() => GetStoresUseCase(storeRepo: sl()));
  sl.registerFactory(() => GetStoreUseCase(storeRepo: sl()));

  // product
  sl.registerFactory(() => GetProductUseCase(productRepo: sl()));
  sl.registerFactory(() => GetProductsUseCase(productRepo: sl()));

  // promo
  sl.registerFactory(() => GetPromosUseCase(promoRepo: sl()));

  // * REPOSITORIES
  sl.registerFactory<StoreRepo>(() => StoreRepoImpl(
        storeMockDataSource: sl(),
      ));
  sl.registerFactory<PromoRepo>(() => PromoRepoImpl(
        promoMockDataSource: sl(),
      ));
  sl.registerFactory<ProductRepo>(() => ProductRepoImpl(
        productMockDataSource: sl(),
      ));

  // * DATA SOURCES LOCAL
  // store mock data
  sl.registerFactory<StoreMockDataSource>(
    () => StoreMockDataSourceImpl(),
  );
  sl.registerFactory<PromoMockDataSource>(
    () => PromoMockDataSourceImpl(),
  );

  // product mock data
  sl.registerFactory<ProductMockDataSource>(
    () => ProductMockDataSourceImpl(),
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
