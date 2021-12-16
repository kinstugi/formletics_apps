import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user.g.dart';

@JsonSerializable()
class TrainerPanelSportsmanNestedUser extends Equatable {
  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;

  TrainerPanelSportsmanNestedUser(
      {this.username, this.firstName, this.lastName});

  factory TrainerPanelSportsmanNestedUser.fromJson(Map<String, dynamic> json) =>
      _$TrainerPanelSportsmanNestedUserFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelSportsmanNestedUserToJson(this);

  @override
  List<Object> get props => [this.username, this.firstName, this.lastName];
}
