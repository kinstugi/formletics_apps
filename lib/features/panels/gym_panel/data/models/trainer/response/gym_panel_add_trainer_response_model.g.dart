// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'gym_panel_add_trainer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GymPanelAddTrainerResponseModel _$GymPanelAddTrainerResponseModelFromJson(
    Map<String, dynamic> json) {
  return GymPanelAddTrainerResponseModel(
    successCode: json['SuccessCode'] as int,
    message: json['Message'] as String,
  );
}

Map<String, dynamic> _$GymPanelAddTrainerResponseModelToJson(
        GymPanelAddTrainerResponseModel instance) =>
    <String, dynamic>{
      'SuccessCode': instance.successCode,
      'Message': instance.message,
    };
