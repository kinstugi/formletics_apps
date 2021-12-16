// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'routine_exercise_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineExerciseGroupResponseModel _$RoutineExerciseGroupResponseModelFromJson(
    Map<String, dynamic> json) {
  return RoutineExerciseGroupResponseModel(
    name: json['name'] as String,
    exercise_list: (json['exercise_list'] as List)
        ?.map((e) => e == null
            ? null
            : RoutineExerciseListResponseModel.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RoutineExerciseGroupResponseModelToJson(
        RoutineExerciseGroupResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'exercise_list': instance.exercise_list,
    };
