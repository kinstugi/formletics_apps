// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'exercise_days.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerPanelSportsmanNestedExerciseDays
    _$TrainerPanelSportsmanNestedExerciseDaysFromJson(
        Map<String, dynamic> json) {
  return TrainerPanelSportsmanNestedExerciseDays(
    number: json['number'] as int,
    group: (json['group'] as List)
        ?.map((e) => e == null
            ? null
            : TrainerPanelSportsmanNestedGroup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    isBreak: json['is_break'] as bool,
  );
}

Map<String, dynamic> _$TrainerPanelSportsmanNestedExerciseDaysToJson(
        TrainerPanelSportsmanNestedExerciseDays instance) =>
    <String, dynamic>{
      'number': instance.number,
      'group': instance.group,
      'is_break': instance.isBreak,
    };
