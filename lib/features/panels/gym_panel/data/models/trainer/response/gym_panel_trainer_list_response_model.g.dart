// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'gym_panel_trainer_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GymPanelTrainerListResponseModel _$GymPanelTrainerListResponseModelFromJson(
    Map<String, dynamic> json) {
  return GymPanelTrainerListResponseModel(
    trainers: (json['trainers'] as List)
        ?.map((e) => e == null
            ? null
            : GymPanelNestedTrainers.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GymPanelTrainerListResponseModelToJson(
        GymPanelTrainerListResponseModel instance) =>
    <String, dynamic>{
      'trainers': instance.trainers,
    };
