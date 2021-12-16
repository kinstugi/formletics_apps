// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'gym_cut_reponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GymCutResponseModel _$GymCutResponseModelFromJson(Map<String, dynamic> json) {
  return GymCutResponseModel(
    id: json['id'] as int,
    name: json['name'] as String,
    location: json['location'] as String,
  );
}

Map<String, dynamic> _$GymCutResponseModelToJson(
        GymCutResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
    };
