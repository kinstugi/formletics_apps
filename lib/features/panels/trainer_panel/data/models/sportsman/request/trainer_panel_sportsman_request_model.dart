import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import "sportsman.dart";
import "service.dart";
import "exercise_days.dart";
import "supplement_list.dart";

part 'trainer_panel_sportsman_request_model.g.dart';

@JsonSerializable()
class TrainerPanelSportsmanRequestModel extends Equatable {
  @JsonKey(name: 'changepk')
  String changepk;
  @JsonKey(name: 'sportsman')
  TrainerPanelSportsmanNestedSportsman sportsman;
  @JsonKey(name: 'service')
  TrainerPanelSportsmanNestedService service;
  @JsonKey(name: 'exercise_days')
  List<TrainerPanelSportsmanNestedExerciseDays> exerciseDays;
  @JsonKey(name: 'nutrition_list')
  String nutritionList;
  @JsonKey(name: 'supplement_list')
  List<TrainerPanelSportsmanNestedSupplementList> supplementList;
  @JsonKey(name: 'start_date')
  DateTime startDate;
  @JsonKey(name: 'end_date')
  DateTime endDate;
  @JsonKey(name: 'note')
  String note;

  TrainerPanelSportsmanRequestModel(
      {this.changepk,
      this.sportsman,
      this.service,
      this.exerciseDays,
      this.nutritionList,
      this.supplementList,
      this.startDate,
      this.endDate,
      this.note});

  factory TrainerPanelSportsmanRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TrainerPanelSportsmanRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerPanelSportsmanRequestModelToJson(this);

  @override
  List<Object> get props => [
        this.changepk,
        this.sportsman,
        this.service,
        this.exerciseDays,
        this.nutritionList,
        this.supplementList,
        this.startDate,
        this.endDate,
        this.note
      ];
}
