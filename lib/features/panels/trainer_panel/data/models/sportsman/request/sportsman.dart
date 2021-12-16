import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import "service.dart";
import "user.dart";

part 'sportsman.g.dart';

@JsonSerializable()
class TrainerPanelSportsmanNestedSportsman extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'user')
  final TrainerPanelSportsmanNestedUser user;
  @JsonKey(name: 'service')
  final List<TrainerPanelSportsmanNestedService> service;
  @JsonKey(name: 'end_date')
  final String endDate;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'trainer')
  final int trainer;

  TrainerPanelSportsmanNestedSportsman(
      {this.id,
      this.user,
      this.service,
      this.endDate,
      this.status,
      this.trainer});

  factory TrainerPanelSportsmanNestedSportsman.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerPanelSportsmanNestedSportsmanFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelSportsmanNestedSportsmanToJson(this);

  @override
  List<Object> get props => [
        this.id,
        this.user,
        this.service,
        this.endDate,
        this.status,
        this.trainer
      ];
}
