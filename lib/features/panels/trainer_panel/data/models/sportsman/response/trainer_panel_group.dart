import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'trainer_panel_group.g.dart';

@JsonSerializable()
class TrainerPanelAllGroupList extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;

  TrainerPanelAllGroupList({this.id, this.name});

  factory TrainerPanelAllGroupList.fromJson(Map<String, dynamic> json) => _$TrainerPanelAllGroupListFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerPanelAllGroupListToJson(this);

  @override
  List<Object> get props => [this.id, this.name];
}
