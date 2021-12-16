// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'basket_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketNestedServiceModel _$BasketNestedServiceModelFromJson(
    Map<String, dynamic> json) {
  return BasketNestedServiceModel(
    id: json['id'] as int,
    name: json['name'] as String,
    subscription: json['subscription'] as bool,
    is_exercise: json['is_exercise'] as bool,
    is_nutrition: json['is_nutrition'] as bool,
    is_supplement: json['is_supplement'] as bool,
  );
}

Map<String, dynamic> _$BasketNestedServiceModelToJson(
        BasketNestedServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subscription': instance.subscription,
      'is_exercise': instance.is_exercise,
      'is_nutrition': instance.is_nutrition,
      'is_supplement': instance.is_supplement,
    };

BasketServiceModel _$BasketServiceModelFromJson(Map<String, dynamic> json) {
  return BasketServiceModel(
    id: json['id'] as int,
    service: json['service'] == null
        ? null
        : BasketNestedServiceModel.fromJson(
            json['service'] as Map<String, dynamic>),
    period: json['period'] as int,
    price: json['price'] as int,
  );
}

Map<String, dynamic> _$BasketServiceModelToJson(BasketServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service': instance.service,
      'period': instance.period,
      'price': instance.price,
    };
