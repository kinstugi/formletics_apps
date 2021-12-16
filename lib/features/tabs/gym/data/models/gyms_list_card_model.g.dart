// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'gyms_list_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GymListCardModel _$GymListCardModelFromJson(Map<String, dynamic> json) {
  return GymListCardModel(
    id: json['id'] as int,
    il: json['il'] as String,
    ilce: json['ilce'] as String,
    mahalle: json['mahalle'] as String,
    name: json['name'] as String,
    photo: json['photo'] as String,
    semt: json['semt'] as String,
  );
}

Map<String, dynamic> _$GymListCardModelToJson(GymListCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'il': instance.il,
      'ilce': instance.ilce,
      'semt': instance.semt,
      'mahalle': instance.mahalle,
    };
