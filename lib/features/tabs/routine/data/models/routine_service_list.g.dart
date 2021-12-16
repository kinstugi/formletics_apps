// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'routine_service_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineServiceListResponseModel _$RoutineServiceListResponseModelFromJson(
    Map<String, dynamic> json) {
  return RoutineServiceListResponseModel(
    id: json['id'] as int,
    service: json['service'] == null
        ? null
        : RoutineServiceResponseModel.fromJson(
            json['service'] as Map<String, dynamic>),
    exercise_days: (json['exercise_days'] as List)
        ?.map((e) => e == null
            ? null
            : RoutineExerciseDaysResponseModel.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nutrition_list: json['nutrition_list'] == null
        ? null
        : RoutineNutritionResponseModel.fromJson(
            json['nutrition_list'] as Map<String, dynamic>),
    start_date: json['start_date'] == null
        ? null
        : DateTime.parse(json['start_date'] as String),
    end_date: json['end_date'] == null
        ? null
        : DateTime.parse(json['end_date'] as String),
    note: json['note'] as String,
    trainer: json['trainer'] == null
        ? null
        : TrainerCutResponseModel.fromJson(
            json['trainer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RoutineServiceListResponseModelToJson(
        RoutineServiceListResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service': instance.service,
      'exercise_days': instance.exercise_days,
      'nutrition_list': instance.nutrition_list,
      'start_date': instance.start_date?.toIso8601String(),
      'end_date': instance.end_date?.toIso8601String(),
      'note': instance.note,
      'trainer': instance.trainer,
    };
