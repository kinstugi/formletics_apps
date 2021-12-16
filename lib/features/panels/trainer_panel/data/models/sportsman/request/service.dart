import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'service.g.dart';

@JsonSerializable()
class TrainerPanelSportsmanNestedService extends Equatable {
  @JsonKey(name: 'id')
  final int id;
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

  TrainerPanelSportsmanNestedService(
      {this.id,
      this.name,
      this.subscription,
      this.isExercise,
      this.isNutrition,
      this.isSupplement});

  factory TrainerPanelSportsmanNestedService.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerPanelSportsmanNestedServiceFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelSportsmanNestedServiceToJson(this);

  @override
  List<Object> get props => [
        this.id,
        this.name,
        this.subscription,
        this.isExercise,
        this.isNutrition,
        this.isSupplement
      ];
}
