// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'exercise_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerPanelSportsmanNestedExerciseList
    _$TrainerPanelSportsmanNestedExerciseListFromJson(
        Map<String, dynamic> json) {
  return TrainerPanelSportsmanNestedExerciseList(
    exercise: json['exercise'] == null
        ? null
        : TrainerPanelSportsmanNestedExerciseObject.fromJson(
            json['exercise'] as Map<String, dynamic>),
    times: json['times'] as String,
    second: json['second'] as String,
    super_set: json['super_set'] as bool,
  );
}

Map<String, dynamic> _$TrainerPanelSportsmanNestedExerciseListToJson(
        TrainerPanelSportsmanNestedExerciseList instance) =>
    <String, dynamic>{
      'exercise': instance.exercise,
      'times': instance.times,
      'second': instance.second,
      'super_set': instance.super_set,
    };
