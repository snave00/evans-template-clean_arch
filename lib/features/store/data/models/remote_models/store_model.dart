import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/store_entity.dart';

part 'store_model.freezed.dart';
part 'store_model.g.dart';

@freezed
class StoreModel with _$StoreModel {
  StoreModel._();

  factory StoreModel({
    final String? storeId,
    final String? storeName,
    final String? storeDesc,
    final String? rating,
    final String? distance,
    final String? location,
    final bool? isStoreOpen,
    final String? openingTime,
    final String? closingTime,
    final String? storeThumbnail,
    final String? bannerImage,
  }) = _StoreModel;

  factory StoreModel.empty() {
    return StoreModel(
      storeId: '',
      storeName: '',
      storeDesc: '',
      rating: '',
      distance: '',
      location: '',
      isStoreOpen: false,
      openingTime: '',
      closingTime: '',
      storeThumbnail: '',
      bannerImage: '',
    );
  }

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);

  StoreEntity toEntity() => StoreEntity(
        storeId: storeId ?? '',
        storeName: storeName ?? '',
        storeDesc: storeDesc ?? '',
        rating: rating ?? '',
        distance: distance ?? '',
        location: location ?? '',
        isStoreOpen: isStoreOpen ?? false,
        openingTime: openingTime ?? '',
        closingTime: closingTime ?? '',
        storeThumbnail: storeThumbnail ?? '',
        bannerImage: bannerImage ?? '',
      );
}
