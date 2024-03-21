import 'package:fpdart/fpdart.dart';

import '../../../../core/data/exceptions/cache_exception.dart';
import '../../../../core/domain/failures/failures.dart';
import '../../../../utils/constants/error_const.dart';
import '../../../../utils/logs/custom_log.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repo.dart';
import '../data_source/product_mock_data_source.dart';

class ProductRepoImpl implements ProductRepo {
  static String runtimeTypeName = (ProductRepoImpl).toString();

  final ProductMockDataSource productMockDataSource;

  ProductRepoImpl({
    required this.productMockDataSource,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    required String storeId,
  }) async {
    try {
      final products =
          await productMockDataSource.getProducts(storeId: storeId);

      final productsToEntity =
          products.map((product) => product.toEntity()).toList();
      final productsToJson =
          productsToEntity.map((product) => product.toJson()).toList();

      Log.logRepo(
        repoName: runtimeTypeName,
        functionName: 'getProducts success: ',
        log: productsToJson,
      );
      return right(productsToEntity);
    } on CacheException catch (e) {
      return left(CacheFailure(e.toString()));
    } catch (e) {
      return left(GeneralFailure(
          '${ErrorConst.generalErrorMessage}. getProducts\n${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct({
    required String storeId,
    required String productId,
  }) async {
    try {
      final product = await productMockDataSource.getProduct(
        storeId: storeId,
        productId: productId,
      );

      final productToEntity = product.toEntity();
      final productToJson = productToEntity.toJson();

      Log.logRepo(
        repoName: runtimeTypeName,
        functionName: 'getProduct success: ',
        log: productToJson,
      );
      return right(productToEntity);
    } on CacheException catch (e) {
      return left(CacheFailure(e.toString()));
    } catch (e) {
      return left(GeneralFailure(
          '${ErrorConst.generalErrorMessage}. getProduct\n${e.toString()}'));
    }
  }
}
