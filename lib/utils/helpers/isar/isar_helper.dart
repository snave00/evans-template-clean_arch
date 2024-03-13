import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/data/data_source/local/shared_pref_local_data_source.dart';
import '../../../modules/di/injection.dart';

class IsarHelper {
  static Isar? getInstance() {
    final sharedPrefLocalDataSource = SharedPrefLocalDataSourceImpl(
      prefs: sl<SharedPreferences>(),
    );

    final savedIsarName = sharedPrefLocalDataSource.getIsarName();

    final isar = Isar.getInstance(savedIsarName);

    return isar;
  }
}

/// * FNV-1a 64bit hash algorithm optimized for Dart Strings
/// * used in hashing id string userId in isar collection
int fastHash(String string) {
  if (string.isEmpty) return 0;
  var hash = 0xcbf29ce484222325;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }

  return hash;
}
