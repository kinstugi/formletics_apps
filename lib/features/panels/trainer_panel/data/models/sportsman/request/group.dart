//import 'package:injectable/injectable.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/exercise_nested_exercise.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import "exercise_list.dart";
import "exercise_group.dart";

part 'group.g.dart';

@JsonSerializable()
class TrainerPanelSportsmanNestedGroup extends Equatable {
  @JsonKey(name: 'group')
  TrainerPanelSportsmanNestedGroupObject group;
  @JsonKey(name: 'exercise_list')
  List<TrainerPanelSportsmanNestedExerciseList> exerciseList;
  @JsonKey(name: 'exercises')
  List<TrainerPanelSportsmanNestedExerciseObject> exercises;

  TrainerPanelSportsmanNestedGroup(
      {this.group, this.exerciseList, this.exercises});

  // String get _name => group.name;

  // set _name(String value) {
  //   group.name = value;
  // }

  factory TrainerPanelSportsmanNestedGroup.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerPanelSportsmanNestedGroupFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelSportsmanNestedGroupToJson(this);

  @override
  List<Object> get props => [group, exerciseList, exercises];
}
