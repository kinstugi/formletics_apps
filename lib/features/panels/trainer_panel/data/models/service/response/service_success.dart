import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_success.g.dart';

@JsonSerializable()
class TrainerPanelServiceSuccessResponseModel extends Equatable {
  @JsonKey(name: "SuccessCode")
  final int successCode;
  @JsonKey(name: "Message")
  final String message;

  const TrainerPanelServiceSuccessResponseModel(
      {this.successCode, this.message});

  factory TrainerPanelServiceSuccessResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerPanelServiceSuccessResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelServiceSuccessResponseModelToJson(this);

  @override
  List<Object> get props => [successCode, message];
}
