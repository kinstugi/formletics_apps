import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import "trainers.dart";

part 'gym_panel_trainer_list_response_model.g.dart';

@JsonSerializable()
class GymPanelTrainerListResponseModel extends Equatable {
  @JsonKey(name: 'trainers')
  final List<GymPanelNestedTrainers> trainers;

  GymPanelTrainerListResponseModel({this.trainers});

  factory GymPanelTrainerListResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$GymPanelTrainerListResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GymPanelTrainerListResponseModelToJson(this);

  @override
  List<Object> get props => [this.trainers];
}
