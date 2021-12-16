import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'gym_panel_add_manager_response_model.g.dart';

@JsonSerializable()
class GymPanelAddManagerResponseModel extends Equatable {
  @JsonKey(name: 'SuccessCode')
  final int successCode;
  @JsonKey(name: 'Message')
  final String message;

  GymPanelAddManagerResponseModel({this.successCode, this.message});

  factory GymPanelAddManagerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GymPanelAddManagerResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GymPanelAddManagerResponseModelToJson(this);

  @override
  List<Object> get props => [this.successCode, this.message];
}
