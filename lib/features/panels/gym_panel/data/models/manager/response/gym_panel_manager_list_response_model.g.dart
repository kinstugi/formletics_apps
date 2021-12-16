// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'gym_panel_manager_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GymPanelManagerListResponseModel _$GymPanelManagerListResponseModelFromJson(
    Map<String, dynamic> json) {
  return GymPanelManagerListResponseModel(
    managers: (json['managers'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$GymPanelManagerListResponseModelToJson(
        GymPanelManagerListResponseModel instance) =>
    <String, dynamic>{
      'managers': instance.managers,
    };
