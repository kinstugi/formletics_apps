// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'basket_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketPriceModel _$BasketPriceModelFromJson(Map<String, dynamic> json) {
  return BasketPriceModel(
    service_total_price: json['service_total_price'] as int,
    product_total_price: json['product_total_price'] as int,
    total_price: json['total_price'] as int,
  );
}

Map<String, dynamic> _$BasketPriceModelToJson(BasketPriceModel instance) =>
    <String, dynamic>{
      'service_total_price': instance.service_total_price,
      'product_total_price': instance.product_total_price,
      'total_price': instance.total_price,
    };
