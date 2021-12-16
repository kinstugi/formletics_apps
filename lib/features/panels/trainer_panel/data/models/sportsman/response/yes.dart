import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'yes.g.dart';

@JsonSerializable()
class TrainerPanelSportsmanNestedYes extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'trainer')
  final int trainer;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'subscription')
  final bool subscription;
  @JsonKey(name: 'is_exercise')
  final bool isExercise;
  @JsonKey(name: 'is_nutrition')
  final bool isNutrition;
  @JsonKey(name: 'is_supplement')
  final bool isSupplement;
  @JsonKey(name: 'price_for_2_months')
  final int priceFor_2Months;
  @JsonKey(name: 'price_for_3_months')
  final int priceFor_3Months;
  @JsonKey(name: 'price_for_6_months')
  final int priceFor_6Months;
  @JsonKey(name: 'price_for_12_months')
  final int priceFor_12Months;
  @JsonKey(name: 'description')
  final String description;

  TrainerPanelSportsmanNestedYes(
      {this.id,
      this.trainer,
      this.name,
      this.subscription,
      this.isExercise,
      this.isNutrition,
      this.isSupplement,
      this.priceFor_2Months,
      this.priceFor_3Months,
      this.priceFor_6Months,
      this.priceFor_12Months,
      this.description});

  factory TrainerPanelSportsmanNestedYes.fromJson(Map<String, dynamic> json) =>
      _$TrainerPanelSportsmanNestedYesFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerPanelSportsmanNestedYesToJson(this);

  @override
  List<Object> get props => [
        this.id,
        this.trainer,
        this.name,
        this.subscription,
        this.isExercise,
        this.isNutrition,
        this.isSupplement,
        this.priceFor_2Months,
        this.priceFor_3Months,
        this.priceFor_6Months,
        this.priceFor_12Months,
        this.description
      ];
}
