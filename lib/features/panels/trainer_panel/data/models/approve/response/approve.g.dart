// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'approve.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerPanelApproveNestedService _$TrainerPanelApproveNestedServiceFromJson(
    Map<String, dynamic> json) {
  return TrainerPanelApproveNestedService(
    id: json['id'] as int,
    name: json['name'] as String,
    subscription: json['subscription'] as bool,
    is_exercise: json['is_exercise'] as bool,
    is_nutrition: json['is_nutrition'] as bool,
    is_supplement: json['is_supplement'] as bool,
  );
}

Map<String, dynamic> _$TrainerPanelApproveNestedServiceToJson(
        TrainerPanelApproveNestedService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subscription': instance.subscription,
      'is_exercise': instance.is_exercise,
      'is_nutrition': instance.is_nutrition,
      'is_supplement': instance.is_supplement,
    };

TrainerPanelApproveNestedUser _$TrainerPanelApproveNestedUserFromJson(
    Map<String, dynamic> json) {
  return TrainerPanelApproveNestedUser(
    username: json['username'] as String,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
  );
}

Map<String, dynamic> _$TrainerPanelApproveNestedUserToJson(
        TrainerPanelApproveNestedUser instance) =>
    <String, dynamic>{
      'username': instance.username,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
    };

TrainerPanelApproveSportmenListResponseModel
    _$TrainerPanelApproveSportmenListResponseModelFromJson(
        Map<String, dynamic> json) {
  return TrainerPanelApproveSportmenListResponseModel(
    id: json['id'] as int,
    user: json['user'] == null
        ? null
        : TrainerPanelApproveNestedUser.fromJson(
            json['user'] as Map<String, dynamic>),
    service: (json['service'] as List)
        ?.map((e) => e == null
            ? null
            : TrainerPanelApproveNestedService.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    end_date: json['end_date'] == null
        ? null
        : DateTime.parse(json['end_date'] as String),
    status: json['status'] as int,
    trainer: json['trainer'] as int,
  );
}

Map<String, dynamic> _$TrainerPanelApproveSportmenListResponseModelToJson(
        TrainerPanelApproveSportmenListResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'service': instance.service,
      'end_date': instance.end_date?.toIso8601String(),
      'status': instance.status,
      'trainer': instance.trainer,
    };
