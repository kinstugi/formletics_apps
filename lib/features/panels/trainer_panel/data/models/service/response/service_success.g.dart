// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'service_success.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerPanelServiceSuccessResponseModel
    _$TrainerPanelServiceSuccessResponseModelFromJson(
        Map<String, dynamic> json) {
  return TrainerPanelServiceSuccessResponseModel(
    successCode: json['SuccessCode'] as int,
    message: json['Message'] as String,
  );
}

Map<String, dynamic> _$TrainerPanelServiceSuccessResponseModelToJson(
        TrainerPanelServiceSuccessResponseModel instance) =>
    <String, dynamic>{
      'SuccessCode': instance.successCode,
      'Message': instance.message,
    };
