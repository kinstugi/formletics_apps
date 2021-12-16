import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import "group.dart";

part 'exercise_days.g.dart';

@JsonSerializable()
class TrainerPanelSportsmanNestedExerciseDays extends Equatable {
  @JsonKey(name: 'number')
  final int number;
  @JsonKey(name: 'group')
  final List<TrainerPanelSportsmanNestedGroup> group;
  @JsonKey(name: 'is_break')
  final bool isBreak;

  TrainerPanelSportsmanNestedExerciseDays(
      {this.number, this.group, this.isBreak});

  factory TrainerPanelSportsmanNestedExerciseDays.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerPanelSportsmanNestedExerciseDaysFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelSportsmanNestedExerciseDaysToJson(this);

  @override
  List<Object> get props => [this.number, this.group, this.isBreak];
}
