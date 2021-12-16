import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_sportsman.g.dart';

@JsonSerializable()
class TrainerPanelApproveChangeSportsmanResponseModel extends Equatable {
  final int id;
  final int status;

  const TrainerPanelApproveChangeSportsmanResponseModel({
    this.id,
    this.status,
  });

  factory TrainerPanelApproveChangeSportsmanResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerPanelApproveChangeSportsmanResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelApproveChangeSportsmanResponseModelToJson(this);

  @override
  List<Object> get props => [
        id,
        status,
      ];
}
