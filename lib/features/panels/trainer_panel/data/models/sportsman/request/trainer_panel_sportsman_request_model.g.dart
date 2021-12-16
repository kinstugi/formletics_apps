// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'trainer_panel_sportsman_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerPanelSportsmanRequestModel _$TrainerPanelSportsmanRequestModelFromJson(
    Map<String, dynamic> json) {
  return TrainerPanelSportsmanRequestModel(
    changepk: json['changepk'] as String,
    sportsman: json['sportsman'] == null
        ? null
        : TrainerPanelSportsmanNestedSportsman.fromJson(
            json['sportsman'] as Map<String, dynamic>),
    service: json['service'] == null
        ? null
        : TrainerPanelSportsmanNestedService.fromJson(
            json['service'] as Map<String, dynamic>),
    exerciseDays: (json['exercise_days'] as List)
        ?.map((e) => e == null
            ? null
            : TrainerPanelSportsmanNestedExerciseDays.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nutritionList: json['nutrition_list'] as String,
    supplementList: (json['supplement_list'] as List)
        ?.map((e) => e == null
            ? null
            : TrainerPanelSportsmanNestedSupplementList.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    startDate: json['start_date'] == null
        ? null
        : DateTime.parse(json['start_date'] as String),
    endDate: json['end_date'] == null
        ? null
        : DateTime.parse(json['end_date'] as String),
    note: json['note'] as String,
  );
}

Map<String, dynamic> _$TrainerPanelSportsmanRequestModelToJson(
        TrainerPanelSportsmanRequestModel instance) =>
    <String, dynamic>{
      'changepk': instance.changepk,
      'sportsman': instance.sportsman,
      'service': instance.service,
      'exercise_days': instance.exerciseDays,
      'nutrition_list': instance.nutritionList,
      'supplement_list': instance.supplementList,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'note': instance.note,
    };
