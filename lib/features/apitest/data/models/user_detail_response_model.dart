import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_detail_response_model.g.dart';

@JsonSerializable()
class UserDetailResponseModel extends Equatable {
  final String username;
  final bool is_trainer;
  final bool is_gym;
  final bool is_sportsman;
  final String detail;

  const UserDetailResponseModel(
      {this.username,
      this.is_trainer,
      this.is_gym,
      this.is_sportsman,
      this.detail});

  factory UserDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailResponseModelToJson(this);

  @override
  List<Object> get props =>
      [username, is_trainer, is_gym, is_sportsman, detail];
}
