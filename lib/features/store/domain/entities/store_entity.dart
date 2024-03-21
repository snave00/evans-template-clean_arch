import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/remote_models/store_model.dart';

part 'store_entity.freezed.dart';
part 'store_entity.g.dart';

@freezed
class StoreEntity with _$StoreEntity {
  StoreEntity._();

  factory StoreEntity({
    required final String storeId,
    required final String storeName,
    required final String storeDesc,
    required final String rating,
    required final String distance,
    required final String location,
    required final bool isStoreOpen,
    required final String openingTime,
    required final String closingTime,
    required final String storeThumbnail,
    required final String bannerImage,
  }) = _StoreEntity;

  factory StoreEntity.empty() {
    return StoreEntity(
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

  StoreModel toRemoteModel() => StoreModel(
        storeId: storeId,
        storeName: storeName,
        storeDesc: storeDesc,
        rating: rating,
        distance: distance,
        location: location,
        isStoreOpen: isStoreOpen,
        openingTime: openingTime,
        closingTime: closingTime,
        storeThumbnail: storeThumbnail,
        bannerImage: bannerImage,
      );

  factory StoreEntity.fromJson(Map<String, dynamic> json) =>
      _$StoreEntityFromJson(json);
}
