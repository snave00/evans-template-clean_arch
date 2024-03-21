import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product_entity.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  ProductModel._();

  factory ProductModel({
    final String? productId,
    final String? storeId,
    final String? productCategory,
    final String? productName,
    final String? productDesc,
    final String? productPrice,
    final String? productImage,
    final bool? isAvailable,
  }) = _ProductModel;

  factory ProductModel.empty() {
    return ProductModel(
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

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  ProductEntity toEntity() => ProductEntity(
        productId: productId ?? '',
        storeId: storeId ?? '',
        productCategory: productCategory ?? '',
        productName: productName ?? '',
        productDesc: productDesc ?? '',
        productPrice: productPrice ?? '',
        productImage: productImage ?? '',
        isAvailable: isAvailable ?? false,
      );
}
