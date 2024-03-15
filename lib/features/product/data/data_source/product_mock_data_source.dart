import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/services.dart';

import '../../../../utils/constants/asset_const.dart';
import '../models/remote_models/product_model.dart';

abstract class ProductMockDataSource {
  Future<List<ProductModel>> getProducts({required String storeId});
  Future<ProductModel> getProduct({
    required String productId,
    required String storeId,
  });
}

class ProductMockDataSourceImpl implements ProductMockDataSource {
  @override
  Future<List<ProductModel>> getProducts({required String storeId}) async {
    final String response = await rootBundle.loadString(
      AssetConst.productMockData,
    );

    // get products
    final products = await Isolate.run(
      () => getProductsMockData(response),
    );

    // filter by storeId. this mocks the query for your backend
    final productsFiltered = products
        .where(
          (element) => element.storeId == storeId,
        )
        .toList();

    return productsFiltered;
  }

  @override
  Future<ProductModel> getProduct({
    required String storeId,
    required String productId,
  }) async {
    final String response = await rootBundle.loadString(
      AssetConst.productMockData,
    );

    // get products
    final products = await Isolate.run(
      () => getProductsMockData(response),
    );

    // filter by storeId. this mocks the query for your backend
    final productsFiltered = products
        .where(
          (element) => element.storeId == storeId,
        )
        .toList();

    // filter by productId. this mocks the query for your backend
    final product = productsFiltered.firstWhere(
      (element) => element.productId == productId,
    );

    return product;
  }
}

// made it top level function so it can be isolated
Future<List<ProductModel>> getProductsMockData(String response) async {
  final List<dynamic> parsed = jsonDecode(response);
  return parsed.map((json) => ProductModel.fromJson(json)).toList();
}
