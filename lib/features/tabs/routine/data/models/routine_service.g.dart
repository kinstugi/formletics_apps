// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'routine_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineServiceResponseModel _$RoutineServiceResponseModelFromJson(
    Map<String, dynamic> json) {
  return RoutineServiceResponseModel(
    id: json['id'] as int,
    name: json['name'] as String,
    is_exercise: json['is_exercise'] as bool,
    is_nutrition: json['is_nutrition'] as bool,
    is_supplement: json['is_supplement'] as bool,
  );
}

Map<String, dynamic> _$RoutineServiceResponseModelToJson(
        RoutineServiceResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_exercise': instance.is_exercise,
      'is_nutrition': instance.is_nutrition,
      'is_supplement': instance.is_supplement,
    };
