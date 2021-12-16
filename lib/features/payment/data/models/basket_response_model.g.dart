// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'basket_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketResponseModel _$BasketResponseModelFromJson(Map<String, dynamic> json) {
  return BasketResponseModel(
    id: json['id'] as int,
    product: (json['product'] as List)
        ?.map((e) => e == null
            ? null
            : BasketProductModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    service: (json['service'] as List)
        ?.map((e) => e == null
            ? null
            : BasketServiceModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    prices: (json['prices'] as List)
        ?.map((e) => e == null
            ? null
            : BasketPriceModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    user: json['user'] as int,
  );
}

Map<String, dynamic> _$BasketResponseModelToJson(
        BasketResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'service': instance.service,
      'prices': instance.prices,
      'user': instance.user,
    };
