import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'gym_panel_add_trainer_response_model.g.dart';

@JsonSerializable()
class GymPanelAddTrainerResponseModel extends Equatable {
  @JsonKey(name: 'SuccessCode')
  final int successCode;
  @JsonKey(name: 'Message')
  final String message;

  GymPanelAddTrainerResponseModel({this.successCode, this.message});

  factory GymPanelAddTrainerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GymPanelAddTrainerResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GymPanelAddTrainerResponseModelToJson(this);

  @override
  List<Object> get props => [this.successCode, this.message];
}
