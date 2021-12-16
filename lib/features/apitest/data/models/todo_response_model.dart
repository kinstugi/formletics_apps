import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_response_model.g.dart';

@JsonSerializable()
class TodoResponseModel extends Equatable {
  @JsonKey(name: 'userId')
  final int userId;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'completed')
  final bool completed;

  const TodoResponseModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory TodoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TodoResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoResponseModelToJson(this);

  @override
  List<Object> get props => [userId, id, title, completed];
}
