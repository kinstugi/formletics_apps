import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routine_exercise_list_model.g.dart';

@JsonSerializable()
class RoutineExerciseListResponseModel extends Equatable {
  final int exercise;
  final int times;
  final int second;
  final String name;
  final String media;

  const RoutineExerciseListResponseModel(
      {this.exercise, this.times, this.second, this.name, this.media});

  factory RoutineExerciseListResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$RoutineExerciseListResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RoutineExerciseListResponseModelToJson(this);

  @override
  List<Object> get props => [exercise, times, second, name, media];
}
