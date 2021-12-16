// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'gym_panel_add_manager_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GymPanelAddManagerResponseModel _$GymPanelAddManagerResponseModelFromJson(
    Map<String, dynamic> json) {
  return GymPanelAddManagerResponseModel(
    successCode: json['SuccessCode'] as int,
    message: json['Message'] as String,
  );
}

Map<String, dynamic> _$GymPanelAddManagerResponseModelToJson(
        GymPanelAddManagerResponseModel instance) =>
    <String, dynamic>{
      'SuccessCode': instance.successCode,
      'Message': instance.message,
    };
