import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'trainer_panel_all_exercise_list.g.dart';

@JsonSerializable()
class TrainerPanelAllExerciseList extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;

  TrainerPanelAllExerciseList({this.id, this.name});

  factory TrainerPanelAllExerciseList.fromJson(Map<String, dynamic> json) =>
      _$TrainerPanelAllExerciseListFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerPanelAllExerciseListToJson(this);

  @override
  List<Object> get props => [this.id, this.name];
}
