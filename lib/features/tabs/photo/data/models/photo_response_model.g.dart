// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'photo_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoResponseModel _$PhotoResponseModelFromJson(Map<String, dynamic> json) {
  return PhotoResponseModel(
    albumId: json['albumId'] as int,
    id: json['id'] as int,
    title: json['title'] as String,
    url: json['url'] as String,
    thumbnailUrl: json['thumbnailUrl'] as String,
  );
}

Map<String, dynamic> _$PhotoResponseModelToJson(PhotoResponseModel instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
