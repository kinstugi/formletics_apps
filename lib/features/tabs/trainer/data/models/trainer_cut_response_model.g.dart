// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'trainer_cut_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerCutResponseModel _$TrainerCutResponseModelFromJson(
    Map<String, dynamic> json) {
  return TrainerCutResponseModel(
    id: json['id'] as int,
    user: json['user'] as String,
    name: json['name'] as String,
    last_name: json['last_name'] as String,
    photo: json['photo'] as String,
    il: json['il'] as String,
    ilce: json['ilce'] as String,
    semt: json['semt'] as String,
    mahalle: json['mahalle'] as String,
    sportsman_count: json['sportsman_count'] as int,
  );
}

Map<String, dynamic> _$TrainerCutResponseModelToJson(
        TrainerCutResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'name': instance.name,
      'last_name': instance.last_name,
      'photo': instance.photo,
      'il': instance.il,
      'ilce': instance.ilce,
      'semt': instance.semt,
      'mahalle': instance.mahalle,
      'sportsman_count': instance.sportsman_count,
    };
