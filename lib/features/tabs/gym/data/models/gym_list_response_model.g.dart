// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'gym_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GymListResponseModel _$GymListResponseModelFromJson(Map<String, dynamic> json) {
  return GymListResponseModel(
    count: json['count'] as int,
    next: json['next'] as String,
    previous: json['previous'] as String,
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : GymCutResponseModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GymListResponseModelToJson(
        GymListResponseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
