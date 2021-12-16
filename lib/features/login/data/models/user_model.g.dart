// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as int,
    email: json['email'] as String,
    username: json['username'] as String,
    errorMessage: json['errorMessage'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
    };
