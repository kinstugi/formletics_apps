import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'approve.g.dart';

@JsonSerializable()
class TrainerPanelApproveNestedService extends Equatable {
  final int id;
  final String name;
  final bool subscription;
  final bool is_exercise;
  final bool is_nutrition;
  final bool is_supplement;

  const TrainerPanelApproveNestedService(
      {this.id,
      this.name,
      this.subscription,
      this.is_exercise,
      this.is_nutrition,
      this.is_supplement});

  factory TrainerPanelApproveNestedService.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerPanelApproveNestedServiceFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelApproveNestedServiceToJson(this);

  @override
  List<Object> get props =>
      [id, name, subscription, is_exercise, is_nutrition, is_supplement];
}

@JsonSerializable()
class TrainerPanelApproveNestedUser extends Equatable {
  final String username;
  final String first_name;
  final String last_name;

  const TrainerPanelApproveNestedUser(
      {this.username, this.first_name, this.last_name});

  factory TrainerPanelApproveNestedUser.fromJson(Map<String, dynamic> json) =>
      _$TrainerPanelApproveNestedUserFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerPanelApproveNestedUserToJson(this);

  @override
  List<Object> get props => [username, first_name, last_name];
}

@JsonSerializable()
class TrainerPanelApproveSportmenListResponseModel extends Equatable {
  final int id;
  final TrainerPanelApproveNestedUser user;
  final List<TrainerPanelApproveNestedService> service;
  final DateTime end_date;
  final int status;
  final int trainer;

  const TrainerPanelApproveSportmenListResponseModel(
      {this.id,
      this.user,
      this.service,
      this.end_date,
      this.status,
      this.trainer});

  factory TrainerPanelApproveSportmenListResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerPanelApproveSportmenListResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelApproveSportmenListResponseModelToJson(this);

  @override
  List<Object> get props => [id, user, service, end_date, status, trainer];
}
