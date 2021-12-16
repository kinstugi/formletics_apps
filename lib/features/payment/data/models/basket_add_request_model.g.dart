// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'basket_add_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketAddNestedServiceModel _$BasketAddNestedServiceModelFromJson(
    Map<String, dynamic> json) {
  return BasketAddNestedServiceModel(
    id: json['id'] as int,
    period: json['period'] as String,
  );
}

Map<String, dynamic> _$BasketAddNestedServiceModelToJson(
        BasketAddNestedServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'period': instance.period,
    };

BasketAddRequestModel _$BasketAddRequestModelFromJson(
    Map<String, dynamic> json) {
  return BasketAddRequestModel(
    services: (json['services'] as List)
        ?.map((e) => e == null
            ? null
            : BasketAddNestedServiceModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BasketAddRequestModelToJson(
        BasketAddRequestModel instance) =>
    <String, dynamic>{
      'services': instance.services,
    };
