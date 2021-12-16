// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'yes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerPanelSportsmanNestedYes _$TrainerPanelSportsmanNestedYesFromJson(
    Map<String, dynamic> json) {
  return TrainerPanelSportsmanNestedYes(
    id: json['id'] as int,
    trainer: json['trainer'] as int,
    name: json['name'] as String,
    subscription: json['subscription'] as bool,
    isExercise: json['is_exercise'] as bool,
    isNutrition: json['is_nutrition'] as bool,
    isSupplement: json['is_supplement'] as bool,
    priceFor_2Months: json['price_for_2_months'] as int,
    priceFor_3Months: json['price_for_3_months'] as int,
    priceFor_6Months: json['price_for_6_months'] as int,
    priceFor_12Months: json['price_for_12_months'] as int,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$TrainerPanelSportsmanNestedYesToJson(
        TrainerPanelSportsmanNestedYes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trainer': instance.trainer,
      'name': instance.name,
      'subscription': instance.subscription,
      'is_exercise': instance.isExercise,
      'is_nutrition': instance.isNutrition,
      'is_supplement': instance.isSupplement,
      'price_for_2_months': instance.priceFor_2Months,
      'price_for_3_months': instance.priceFor_3Months,
      'price_for_6_months': instance.priceFor_6Months,
      'price_for_12_months': instance.priceFor_12Months,
      'description': instance.description,
    };
