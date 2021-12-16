// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'add_routine_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerPanelAddRoutineResponseModel
    _$TrainerPanelAddRoutineResponseModelFromJson(Map<String, dynamic> json) {
  return TrainerPanelAddRoutineResponseModel(
    successCode: json['SuccessCode'] as int,
    message: json['Message'] as String,
  );
}

Map<String, dynamic> _$TrainerPanelAddRoutineResponseModelToJson(
        TrainerPanelAddRoutineResponseModel instance) =>
    <String, dynamic>{
      'SuccessCode': instance.successCode,
      'Message': instance.message,
    };
