// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'trainer_panel_sportsman_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerPanelSportsmanResponseModel _$TrainerPanelSportsmanResponseModelFromJson(
    Map<String, dynamic> json) {
  return TrainerPanelSportsmanResponseModel(
    username: json['username'] as String,
    sportsman: json['sportsman'] as int,
    endDate: json['end_date'] as String,
    any: json['any'] as bool,
    no: (json['no'] as List)
        ?.map((e) => e == null
            ? null
            : TrainerPanelSportsmanNestedNo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    yes: (json['yes'] as List)
        ?.map((e) => e == null
            ? null
            : TrainerPanelSportsmanNestedYes.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    startDate: json['start_date'] as String,
  );
}

Map<String, dynamic> _$TrainerPanelSportsmanResponseModelToJson(
        TrainerPanelSportsmanResponseModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'sportsman': instance.sportsman,
      'end_date': instance.endDate,
      'start_date': instance.startDate,
      'any': instance.any,
      'no': instance.no,
      'yes': instance.yes,
    };
