import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'trainers.g.dart';

@JsonSerializable()
class GymPanelNestedTrainers extends Equatable {
  @JsonKey(name: 'user')
  final String user;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'last_name')
  final String lastName;

  GymPanelNestedTrainers({this.user, this.name, this.lastName});

  factory GymPanelNestedTrainers.fromJson(Map<String, dynamic> json) =>
      _$GymPanelNestedTrainersFromJson(json);

  Map<String, dynamic> toJson() => _$GymPanelNestedTrainersToJson(this);

  @override
  List<Object> get props => [this.user, this.name, this.lastName];
}
