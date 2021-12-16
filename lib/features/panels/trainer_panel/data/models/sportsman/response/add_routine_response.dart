import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'add_routine_response.g.dart';

@JsonSerializable()
class TrainerPanelAddRoutineResponseModel extends Equatable {
  @JsonKey(name: 'SuccessCode')
  final int successCode;
  @JsonKey(name: 'Message')
  final String message;

  TrainerPanelAddRoutineResponseModel({this.successCode, this.message});

  factory TrainerPanelAddRoutineResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TrainerPanelAddRoutineResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerPanelAddRoutineResponseModelToJson(this);

  @override
  List<Object> get props => [this.successCode, this.message];
}
