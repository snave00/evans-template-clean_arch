import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/data/data_source/local/shared_pref_local_data_source.dart';
import '../../core/data/models/isar_models/user_isar_model.dart';
import '../../utils/constants/string_const.dart';
import '../../utils/logs/custom_log.dart';
import '../di/injection.dart';

class IsarDatabaseService {
  Future<Isar> initIsar({
    String? isarNameIso, // must only be filled if inIsolate = true
    bool inIsolate = false,
  }) async {
    Log.logIsar(logIsar: 'initIsar');

    var isarName = StringConst.defaultIsarName;
    var isarDir = '';

    // re initialize in isolate
    // if re-openning an isar in isolate is required as per docs
    // dir should be empty in isolate or else it will have an error
    // https://isar.dev/recipes/multi_isolate.html
    // https://github.com/isar/isar/issues/1378
    // ! always close the isar instance if from isolate
    if (inIsolate) {
      isarName = isarNameIso ?? StringConst.defaultIsarName;

      // should be empty in isolate
      isarDir = '';

      Log.logIsar(
        logIsar: 'initIsar Isolate. isarName: $isarName. isarDir: $isarDir',
      );
    }

    // initialize at the beginning
    if (!inIsolate) {
      // should only be called if not in isolate else will not work
      final sharedPrefLocalDataSource = SharedPrefLocalDataSourceImpl(
        prefs: sl<SharedPreferences>(),
      );

      final savedIsarName = sharedPrefLocalDataSource.getIsarName();
      isarName = savedIsarName;

      final savedIsarDir = await sharedPrefLocalDataSource.getIsarDir();
      isarDir = savedIsarDir;

      Log.logIsar(
        logIsar: 'initIsar main. isarName: $isarName. isarDir: $isarDir',
      );
    }

    // put all isar models/schema here
    return await Isar.open(
      [
        UserIsarModelSchema,
      ],
      directory: isarDir,
      name: isarName,
      inspector: true,
    );
  }
}
