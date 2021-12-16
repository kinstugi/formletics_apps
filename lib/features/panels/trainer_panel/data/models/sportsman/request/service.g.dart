// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerPanelSportsmanNestedService _$TrainerPanelSportsmanNestedServiceFromJson(
    Map<String, dynamic> json) {
  return TrainerPanelSportsmanNestedService(
    id: json['id'] as int,
    name: json['name'] as String,
    subscription: json['subscription'] as bool,
    isExercise: json['is_exercise'] as bool,
    isNutrition: json['is_nutrition'] as bool,
    isSupplement: json['is_supplement'] as bool,
  );
}

Map<String, dynamic> _$TrainerPanelSportsmanNestedServiceToJson(
        TrainerPanelSportsmanNestedService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subscription': instance.subscription,
      'is_exercise': instance.isExercise,
      'is_nutrition': instance.isNutrition,
      'is_supplement': instance.isSupplement,
    };
