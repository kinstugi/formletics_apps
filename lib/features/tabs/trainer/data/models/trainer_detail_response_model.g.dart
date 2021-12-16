// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'trainer_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerDetailResponseModel _$TrainerDetailResponseModelFromJson(
    Map<String, dynamic> json) {
  return TrainerDetailResponseModel(
    id: json['id'] as int,
    name: json['name'] as String,
    last_name: json['last_name'] as String,
    photo: json['photo'] as String,
    location: json['location'] as String,
    sportsman_count: json['sportsman_count'] as int,
    statement: json['statement'] as String,
    specialization: json['specialization'] as String,
    services: (json['services'] as List)
        ?.map((e) => e == null
            ? null
            : TrainerServiceResponseModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    certificates: (json['certificates'] as List)
        ?.map((e) => e == null
            ? null
            : TrainerCertificateModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    introductory_video: json['introductory_video'] as String,
    after_photo: json['after_photo'] as String,
    before_photo: json['before_photo'] as String,
    students_photo: (json['students_photo'] as List)
        ?.map((e) => e == null
            ? null
            : StudentReferencePhotoModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TrainerDetailResponseModelToJson(
        TrainerDetailResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'last_name': instance.last_name,
      'photo': instance.photo,
      'location': instance.location,
      'sportsman_count': instance.sportsman_count,
      'statement': instance.statement,
      'specialization': instance.specialization,
      'services': instance.services,
      'certificates': instance.certificates,
      'students_photo': instance.students_photo,
      'introductory_video': instance.introductory_video,
      'before_photo': instance.before_photo,
      'after_photo': instance.after_photo,
    };
