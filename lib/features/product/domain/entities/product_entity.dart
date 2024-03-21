import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/remote_models/product_model.dart';

part 'product_entity.freezed.dart';
part 'product_entity.g.dart';

@freezed
class ProductEntity with _$ProductEntity {
  ProductEntity._();

  factory ProductEntity({
    required final String productId,
    required final String storeId,
    required final String productCategory,
    required final String productName,
    required final String productDesc,
    required final String productPrice,
    required final String productImage,
    required final bool isAvailable,
  }) = _ProductEntity;

  factory ProductEntity.empty() {
    return ProductEntity(
      productId: '',
      storeId: '',
      productCategory: '',
      productName: '',
      productDesc: '',
      productPrice: '',
      productImage: '',
      isAvailable: false,
    );
  }

  ProductModel toRemoteModel() => ProductModel(
        productId: productId,
        storeId: storeId,
        productCategory: productCategory,
        productName: productName,
        productDesc: productDesc,
        productPrice: productPrice,
        productImage: productImage,
        isAvailable: isAvailable,
      );

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);
}
