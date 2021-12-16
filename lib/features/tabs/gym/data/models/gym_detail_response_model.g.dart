// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'gym_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GymDetailResponseModel _$GymDetailResponseModelFromJson(
    Map<String, dynamic> json) {
  return GymDetailResponseModel(
    id: json['id'] as int,
    trainers: (json['trainers'] as List)
        ?.map((e) => e == null
            ? null
            : TrainerCutResponseModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    location: json['location'] as String,
    name: json['name'] as String,
    photo: json['photo'] as String,
    address: json['address'] as String,
    statement: json['statement'] as String,
    images: (json['images'] as List)
        ?.map((e) => e == null
            ? null
            : GymImageResponseModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    introductory_video: json['introductory_video'] as String,
  );
}

Map<String, dynamic> _$GymDetailResponseModelToJson(
        GymDetailResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trainers': instance.trainers,
      'location': instance.location,
      'name': instance.name,
      'photo': instance.photo,
      'address': instance.address,
      'introductory_video': instance.introductory_video,
      'statement': instance.statement,
      'images': instance.images,
    };
