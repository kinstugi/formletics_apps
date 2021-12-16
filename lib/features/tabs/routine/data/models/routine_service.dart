import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routine_service.g.dart';

@JsonSerializable()
class RoutineServiceResponseModel extends Equatable {
  final int id;
  final String name;
  final bool is_exercise;
  final bool is_nutrition;
  final bool is_supplement;

  const RoutineServiceResponseModel(
      {this.id,
      this.name,
      this.is_exercise,
      this.is_nutrition,
      this.is_supplement});

  factory RoutineServiceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RoutineServiceResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineServiceResponseModelToJson(this);

  @override
  List<Object> get props =>
      [id, name, is_exercise, is_nutrition, is_supplement];
}
