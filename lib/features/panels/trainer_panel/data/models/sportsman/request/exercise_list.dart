import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/exercise_nested_exercise.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'exercise_list.g.dart';

@JsonSerializable()
class TrainerPanelSportsmanNestedExerciseList extends Equatable {
  @JsonKey(name: 'exercise')
  TrainerPanelSportsmanNestedExerciseObject exercise;
  @JsonKey(name: 'times')
  String times;
  @JsonKey(name: 'second')
  String second;
  @JsonKey(name: 'super_set')
  bool super_set;

  TrainerPanelSportsmanNestedExerciseList(
      {this.exercise, this.times, this.second, this.super_set});

  factory TrainerPanelSportsmanNestedExerciseList.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerPanelSportsmanNestedExerciseListFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelSportsmanNestedExerciseListToJson(this);

  @override
  List<Object> get props => [exercise, times, second, super_set];
}
