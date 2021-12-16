// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'basket_add_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketAddResponseModel _$BasketAddResponseModelFromJson(
    Map<String, dynamic> json) {
  return BasketAddResponseModel(
    services: (json['services'] as List)
        ?.map((e) => e == null
            ? null
            : BasketServiceModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    products: (json['products'] as List)
        ?.map((e) => e == null
            ? null
            : BasketProductModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BasketAddResponseModelToJson(
        BasketAddResponseModel instance) =>
    <String, dynamic>{
      'services': instance.services,
      'products': instance.products,
    };
