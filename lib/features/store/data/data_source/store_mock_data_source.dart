import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/services.dart';

import '../../../../utils/constants/asset_const.dart';
import '../models/remote_models/store_model.dart';

abstract class StoreMockDataSource {
  Future<List<StoreModel>> getStores();
  Future<StoreModel> getStore({required String storeId});
}

class StoreMockDataSourceImpl implements StoreMockDataSource {
  @override
  Future<List<StoreModel>> getStores() async {
    final String response = await rootBundle.loadString(
      AssetConst.storeMockData,
    );

    // get stores
    final stores = await Isolate.run(
      () => getStoresMockData(response),
    );

    return stores;
  }

  @override
  Future<StoreModel> getStore({required String storeId}) async {
    final String response = await rootBundle.loadString(
      AssetConst.storeMockData,
    );

    // get stores
    final stores = await Isolate.run(
      () => getStoresMockData(response),
    );

    // filter by storeId. this mocks the query for your backend
    final store = stores.firstWhere((element) => element.storeId == storeId);

    return store;
  }
}

// made it top level function so it can be isolated
Future<List<StoreModel>> getStoresMockData(String response) async {
  final List<dynamic> parsed = jsonDecode(response);
  return parsed.map((storeJson) => StoreModel.fromJson(storeJson)).toList();
}
