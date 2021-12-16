import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import "no.dart";
import "yes.dart";

part 'trainer_panel_sportsman_response_model.g.dart';

@JsonSerializable()
class TrainerPanelSportsmanResponseModel extends Equatable {
  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'sportsman')
  final int sportsman;

  @JsonKey(name: 'end_date')
  final String endDate;

  @JsonKey(name: 'start_date')
  final String startDate;

  @JsonKey(name: 'any')
  final bool any;

  @JsonKey(name: 'no')
  final List<TrainerPanelSportsmanNestedNo> no;

  @JsonKey(name: 'yes')
  final List<TrainerPanelSportsmanNestedYes> yes;

  TrainerPanelSportsmanResponseModel({
    this.username,
    this.sportsman,
    this.endDate,
    this.any,
    this.no,
    this.yes,
    this.startDate,
  });

  factory TrainerPanelSportsmanResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerPanelSportsmanResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelSportsmanResponseModelToJson(this);

  @override
  List<Object> get props => [
        this.username,
        this.sportsman,
        this.endDate,
        this.any,
        this.no,
        this.yes,
        this.startDate,
      ];
}
