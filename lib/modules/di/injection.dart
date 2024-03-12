import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // * CUBITS
  // user
  // sl.registerFactory(
  //   () => UserCubit(
  //     getIsFromFreshInstallUseCase: sl(),
  //     addInitialUserUseCase: sl(),
  //     updateUserSettingsFromInitialSetupUseCase: sl(),
  //     addWalletsFromSetupUseCase: sl(),
  //     addBudgetsFromSetupUseCase: sl(),
  //     setIsFromFreshInstallUseCase: sl(),
  //     getUserUseCase: sl(),
  //     updateUserUseCase: sl(),
  //     getEmojiCategoriesUseCase: sl(),
  //     updateThemeUseCase: sl(),
  //     exportIsarUseCase: sl(),
  //     importIsarUseCase: sl(),
  //     getOfferingsUseCase: sl(),
  //     getCustomerInfoUseCase: sl(),
  //     purchasePackageUseCase: sl(),
  //     restorePurchasesUseCase: sl(),
  //     watchUserUseCase: sl(),
  //     setReminderUseCase: sl(),
  //     setShowTxnDescSubtitleUseCase: sl(),
  //   ),
  // );

  // * USECASES
  // user
  // sl.registerFactory(() => GetUserUseCase(userRepo: sl()));
  // sl.registerFactory(() => AddInitialUserUseCase(userRepo: sl()));
  // sl.registerFactory(() => UpdateUserUseCase(userRepo: sl()));
  // sl.registerFactory(
  //   () => UpdateUserSettingsFromInitialSetupUseCase(userRepo: sl()),
  // );
  // sl.registerFactory(() => GetIsFromFreshInstallUseCase(userRepo: sl()));
  // sl.registerFactory(() => SetIsFromFreshInstallUseCase(userRepo: sl()));
  // sl.registerFactory(() => GetIsarNameUseCase(userRepo: sl()));
  // sl.registerFactory(() => SetIsarNameUseCase(userRepo: sl()));
  // sl.registerFactory(() => GetIsarDirUseCase(userRepo: sl()));
  // sl.registerFactory(() => SetIsarDirUseCase(userRepo: sl()));
  // sl.registerFactory(() => WatchUserUseCase(userRepo: sl()));

  // settings
  // sl.registerFactory(() => UpdateThemeUseCase(settingsRepo: sl()));

  // * REPOSITORIES
  // user
  // sl.registerFactory<UserRepo>(() => UserRepoImpl(
  //       userLocalIsarDataSource: sl(),
  //       sharedPrefLocalDataSource: sl(),
  //     ));

  // settings
  // sl.registerFactory<SettingsRepo>(
  //   () => SettingsRepoImpl(
  //     userLocalIsarDataSource: sl(),
  //     sharedPrefLocalDataSource: sl(),
  //   ),
  // );

  // * DATA SOURCES LOCAL
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
