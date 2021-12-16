// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'routine_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineListResponseModel _$RoutineListResponseModelFromJson(
    Map<String, dynamic> json) {
  return RoutineListResponseModel(
    id: json['id'] as int,
    trainer: json['trainer'] == null
        ? null
        : TrainerCutResponseModel.fromJson(
            json['trainer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RoutineListResponseModelToJson(
        RoutineListResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trainer': instance.trainer,
    };
