// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'trainers_highlights_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainersHighlightCardModel _$TrainersHighlightCardModelFromJson(
    Map<String, dynamic> json) {
  return TrainersHighlightCardModel(
    id: json['id'] as int,
    photo: json['photo'] as String,
    name: json['name'] as String,
    subtitle: json['subtitle'] as String,
  );
}

Map<String, dynamic> _$TrainersHighlightCardModelToJson(
        TrainersHighlightCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subtitle': instance.subtitle,
      'photo': instance.photo,
    };
