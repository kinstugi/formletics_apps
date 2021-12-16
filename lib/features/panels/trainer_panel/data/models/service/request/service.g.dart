// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerPanelServiceRequestModel _$TrainerPanelServiceRequestModelFromJson(
    Map<String, dynamic> json) {
  return TrainerPanelServiceRequestModel(
    id: json['id'] as int,
    name: json['name'] as String,
    is_exercise: json['is_exercise'] as bool,
    is_nutrition: json['is_nutrition'] as bool,
    is_supplement: json['is_supplement'] as bool,
    price_for_2_months: json['price_for_2_months'] as int,
    price_for_3_months: json['price_for_3_months'] as int,
    price_for_6_months: json['price_for_6_months'] as int,
    price_for_12_months: json['price_for_12_months'] as int,
    subscription: json['subscription'] as bool,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$TrainerPanelServiceRequestModelToJson(
        TrainerPanelServiceRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_exercise': instance.is_exercise,
      'is_nutrition': instance.is_nutrition,
      'is_supplement': instance.is_supplement,
      'price_for_2_months': instance.price_for_2_months,
      'price_for_3_months': instance.price_for_3_months,
      'price_for_6_months': instance.price_for_6_months,
      'price_for_12_months': instance.price_for_12_months,
      'subscription': instance.subscription,
      'description': instance.description,
    };
