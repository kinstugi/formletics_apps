import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trainer_service_response_model.g.dart';

@JsonSerializable()
class TrainerServiceResponseModel extends Equatable {
  final int id;
  final String name;
  final bool subscription;
  final bool is_exercise;
  final bool is_nutrition;
  final bool is_supplement;
  final int price_for_2_months;
  final int price_for_3_months;
  final int price_for_6_months;
  final int price_for_12_months;
  final String description;
  final int trainer;

  const TrainerServiceResponseModel(
      {this.id,
      this.name,
      this.subscription,
      this.is_exercise,
      this.is_nutrition,
      this.is_supplement,
      this.price_for_2_months,
      this.price_for_3_months,
      this.price_for_6_months,
      this.price_for_12_months,
      this.description,
      this.trainer});

  factory TrainerServiceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TrainerServiceResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerServiceResponseModelToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        subscription,
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
