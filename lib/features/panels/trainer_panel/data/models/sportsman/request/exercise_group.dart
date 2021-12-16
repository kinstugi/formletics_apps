//import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'exercise_group.g.dart';

@JsonSerializable()
class TrainerPanelSportsmanNestedGroupObject extends Equatable {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;

  TrainerPanelSportsmanNestedGroupObject({this.id, this.name});

  String get _name => name;

  set _name(String value) {
    name = value;
  }

  factory TrainerPanelSportsmanNestedGroupObject.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerPanelSportsmanNestedGroupObjectFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelSportsmanNestedGroupObjectToJson(this);

  @override
  List<Object> get props => [id, name];
}
