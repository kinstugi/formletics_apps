// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'trainer_service_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerServiceResponseModel _$TrainerServiceResponseModelFromJson(
    Map<String, dynamic> json) {
  return TrainerServiceResponseModel(
    id: json['id'] as int,
    name: json['name'] as String,
    subscription: json['subscription'] as bool,
    is_exercise: json['is_exercise'] as bool,
    is_nutrition: json['is_nutrition'] as bool,
    is_supplement: json['is_supplement'] as bool,
    price_for_2_months: json['price_for_2_months'] as int,
    price_for_3_months: json['price_for_3_months'] as int,
    price_for_6_months: json['price_for_6_months'] as int,
    price_for_12_months: json['price_for_12_months'] as int,
    description: json['description'] as String,
    trainer: json['trainer'] as int,
  );
}

Map<String, dynamic> _$TrainerServiceResponseModelToJson(
        TrainerServiceResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subscription': instance.subscription,
      'is_exercise': instance.is_exercise,
      'is_nutrition': instance.is_nutrition,
      'is_supplement': instance.is_supplement,
      'price_for_2_months': instance.price_for_2_months,
      'price_for_3_months': instance.price_for_3_months,
      'price_for_6_months': instance.price_for_6_months,
      'price_for_12_months': instance.price_for_12_months,
      'description': instance.description,
      'trainer': instance.trainer,
    };
