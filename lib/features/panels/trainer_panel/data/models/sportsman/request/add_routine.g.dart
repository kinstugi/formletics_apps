// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'add_routine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerPanelAddRoutineRequestModel _$TrainerPanelAddRoutineRequestModelFromJson(
    Map<String, dynamic> json) {
  return TrainerPanelAddRoutineRequestModel(
    addRoutine: json['addRoutine'] == null
        ? null
        : TrainerPanelSportsmanRequestModel.fromJson(
            json['addRoutine'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TrainerPanelAddRoutineRequestModelToJson(
        TrainerPanelAddRoutineRequestModel instance) =>
    <String, dynamic>{
      'addRoutine': instance.addRoutine,
    };
