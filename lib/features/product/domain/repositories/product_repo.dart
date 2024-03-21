import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failures/failures.dart';
import '../entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    required String storeId,
  });
  Future<Either<Failure, ProductEntity>> getProduct({
    required String storeId,
    required String productId,
  });
}
