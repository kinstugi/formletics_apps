// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerPanelSportsmanNestedGroup _$TrainerPanelSportsmanNestedGroupFromJson(
    Map<String, dynamic> json) {
  return TrainerPanelSportsmanNestedGroup(
    group: json['group'] == null
        ? null
        : TrainerPanelSportsmanNestedGroupObject.fromJson(
            json['group'] as Map<String, dynamic>),
    exerciseList: (json['exercise_list'] as List)
        ?.map((e) => e == null
            ? null
            : TrainerPanelSportsmanNestedExerciseList.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    exercises: (json['exercises'] as List)
        ?.map((e) => e == null
            ? null
            : TrainerPanelSportsmanNestedExerciseObject.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TrainerPanelSportsmanNestedGroupToJson(
        TrainerPanelSportsmanNestedGroup instance) =>
    <String, dynamic>{
      'group': instance.group,
      'exercise_list': instance.exerciseList,
      'exercises': instance.exercises,
    };
