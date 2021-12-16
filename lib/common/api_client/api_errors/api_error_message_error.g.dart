// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'api_error_message_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorMessageError _$ApiErrorMessageErrorFromJson(Map<String, dynamic> json) {
  return ApiErrorMessageError(
    errorMessage: json['error_message'] as String,
  );
}

Map<String, dynamic> _$ApiErrorMessageErrorToJson(
        ApiErrorMessageError instance) =>
    <String, dynamic>{
      'error_message': instance.errorMessage,
    };
