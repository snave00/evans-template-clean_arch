import 'package:flutter/foundation.dart';

import '../../../utils/env/env.dart';

class Environment {
  static String get baseUrl {
    if (kReleaseMode) {
      return Env.baseUrlRelease;
    }
    if (kDebugMode) {
      return Env.baseUrlDev;
    }

    return Env.baseUrlStg;
  }
}
