// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'routine_exercise_days_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineExerciseDaysResponseModel _$RoutineExerciseDaysResponseModelFromJson(
    Map<String, dynamic> json) {
  return RoutineExerciseDaysResponseModel(
    day_number: json['day_number'] as int,
    group: (json['group'] as List)
        ?.map((e) => e == null
            ? null
            : RoutineExerciseGroupResponseModel.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    is_break: json['is_break'] as bool,
  );
}

Map<String, dynamic> _$RoutineExerciseDaysResponseModelToJson(
        RoutineExerciseDaysResponseModel instance) =>
    <String, dynamic>{
      'day_number': instance.day_number,
      'group': instance.group,
      'is_break': instance.is_break,
    };
