import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_sportsman.g.dart';

@JsonSerializable()
class TrainerPanelApproveChangeSportsmanRequestModel extends Equatable {
  final int id;
  final int status;

  const TrainerPanelApproveChangeSportsmanRequestModel({
    @required this.id,
    @required this.status,
  });

  factory TrainerPanelApproveChangeSportsmanRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerPanelApproveChangeSportsmanRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelApproveChangeSportsmanRequestModelToJson(this);

  @override
  List<Object> get props => [
        id,
        status,
      ];
}
