// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'post_login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostLoginResponseModel _$PostLoginResponseModelFromJson(
    Map<String, dynamic> json) {
  return PostLoginResponseModel(
    token: json['token'] as String,
    errorMessage: json['non_field_errors'] as String,
  );
}

Map<String, dynamic> _$PostLoginResponseModelToJson(
        PostLoginResponseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'non_field_errors': instance.errorMessage,
    };
