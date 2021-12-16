import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable()
class TrainerPanelServiceResponseModel extends Equatable {
  final int id;
  final String period;
  final String name;
  final bool is_exercise;
  final bool is_nutrition;
  final bool is_supplement;
  final int price_for_2_months;
  final int price_for_3_months;
  final int price_for_6_months;
  final int price_for_12_months;
  final String description;
  final int trainer;

  const TrainerPanelServiceResponseModel(
      {this.id,
      this.period,
      this.name,
      this.is_exercise,
      this.is_nutrition,
      this.is_supplement,
      this.price_for_2_months,
      this.price_for_3_months,
      this.price_for_6_months,
      this.price_for_12_months,
      this.description,
      this.trainer});

  factory TrainerPanelServiceResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerPanelServiceResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelServiceResponseModelToJson(this);

  @override
  List<Object> get props => [
        id,
        period,
        name,
        is_exercise,
        is_nutrition,
        is_supplement,
        price_for_2_months,
        price_for_3_months,
        price_for_6_months,
        price_for_12_months,
        description,
        trainer
      ];
}
