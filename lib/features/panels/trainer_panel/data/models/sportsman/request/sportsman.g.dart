// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'sportsman.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerPanelSportsmanNestedSportsman
    _$TrainerPanelSportsmanNestedSportsmanFromJson(Map<String, dynamic> json) {
  return TrainerPanelSportsmanNestedSportsman(
    id: json['id'] as int,
    user: json['user'] == null
        ? null
        : TrainerPanelSportsmanNestedUser.fromJson(
            json['user'] as Map<String, dynamic>),
    service: (json['service'] as List)
        ?.map((e) => e == null
            ? null
            : TrainerPanelSportsmanNestedService.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    endDate: json['end_date'] as String,
    status: json['status'] as int,
    trainer: json['trainer'] as int,
  );
}

Map<String, dynamic> _$TrainerPanelSportsmanNestedSportsmanToJson(
        TrainerPanelSportsmanNestedSportsman instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'service': instance.service,
      'end_date': instance.endDate,
      'status': instance.status,
      'trainer': instance.trainer,
    };
