import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routine_nutrition_model.g.dart';

@JsonSerializable()
class RoutineNutritionResponseModel extends Equatable {
  final int id;
  final String text;

  const RoutineNutritionResponseModel({this.id, this.text});

  factory RoutineNutritionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RoutineNutritionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineNutritionResponseModelToJson(this);

  @override
  List<Object> get props => [id, text];
}
