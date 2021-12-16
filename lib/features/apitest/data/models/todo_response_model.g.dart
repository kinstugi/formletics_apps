// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'todo_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoResponseModel _$TodoResponseModelFromJson(Map<String, dynamic> json) {
  return TodoResponseModel(
    userId: json['userId'] as int,
    id: json['id'] as int,
    title: json['title'] as String,
    completed: json['completed'] as bool,
  );
}

Map<String, dynamic> _$TodoResponseModelToJson(TodoResponseModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
