// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'user_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailResponseModel _$UserDetailResponseModelFromJson(
    Map<String, dynamic> json) {
  return UserDetailResponseModel(
    username: json['username'] as String,
    is_trainer: json['is_trainer'] as bool,
    is_gym: json['is_gym'] as bool,
    is_sportsman: json['is_sportsman'] as bool,
    detail: json['detail'] as String,
  );
}

Map<String, dynamic> _$UserDetailResponseModelToJson(
        UserDetailResponseModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'is_trainer': instance.is_trainer,
      'is_gym': instance.is_gym,
      'is_sportsman': instance.is_sportsman,
      'detail': instance.detail,
    };
