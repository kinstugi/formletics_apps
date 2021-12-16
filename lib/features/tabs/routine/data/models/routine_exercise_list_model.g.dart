// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'routine_exercise_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineExerciseListResponseModel _$RoutineExerciseListResponseModelFromJson(
    Map<String, dynamic> json) {
  return RoutineExerciseListResponseModel(
    exercise: json['exercise'] as int,
    times: json['times'] as int,
    second: json['second'] as int,
    name: json['name'] as String,
    media: json['media'] as String,
  );
}

Map<String, dynamic> _$RoutineExerciseListResponseModelToJson(
        RoutineExerciseListResponseModel instance) =>
    <String, dynamic>{
      'exercise': instance.exercise,
      'times': instance.times,
      'second': instance.second,
      'name': instance.name,
      'media': instance.media,
    };
