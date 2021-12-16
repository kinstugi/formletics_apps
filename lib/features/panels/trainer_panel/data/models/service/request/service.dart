import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable()
class TrainerPanelServiceRequestModel extends Equatable {
  final int id;
  final String name;
  final bool is_exercise;
  final bool is_nutrition;
  final bool is_supplement;
  final int price_for_2_months;
  final int price_for_3_months;
  final int price_for_6_months;
  final int price_for_12_months;
  final bool subscription;
  final String description;

  const TrainerPanelServiceRequestModel({
    this.id,
    @required this.name,
    @required this.is_exercise,
    @required this.is_nutrition,
    @required this.is_supplement,
    @required this.price_for_2_months,
    @required this.price_for_3_months,
    @required this.price_for_6_months,
    @required this.price_for_12_months,
    @required this.subscription,
    @required this.description,
  });

  factory TrainerPanelServiceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TrainerPanelServiceRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelServiceRequestModelToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        is_exercise,
        is_nutrition,
        is_supplement,
        price_for_2_months,
        price_for_3_months,
        price_for_6_months,
        price_for_12_months,
        subscription,
        description,
      ];
}
