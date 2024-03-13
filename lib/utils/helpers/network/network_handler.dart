import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../core/data/exceptions/network_exception.dart';
import '../../logs/custom_log.dart';

class NetworkHandler {
  Future<void> checkNetworkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Log.logNetworkStatus(networkStatus: 'No network');
      throw NetworkException();
    } else {
      Log.logNetworkStatus(networkStatus: 'Has network');
      return;
    }
  }
}
