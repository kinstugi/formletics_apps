import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'exercise_nested_exercise.g.dart';

@JsonSerializable()
class TrainerPanelSportsmanNestedExerciseObject extends Equatable {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'media')
  String media;

  TrainerPanelSportsmanNestedExerciseObject({this.id, this.name, this.media});

  factory TrainerPanelSportsmanNestedExerciseObject.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerPanelSportsmanNestedExerciseObjectFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelSportsmanNestedExerciseObjectToJson(this);

  @override
  List<Object> get props => [id, name, media];
}
