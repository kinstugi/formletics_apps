import 'package:equatable/equatable.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_exercise_list_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routine_exercise_group_model.g.dart';

@JsonSerializable()
class RoutineExerciseGroupResponseModel extends Equatable {
  final String name;
  final List<RoutineExerciseListResponseModel> exercise_list;

  const RoutineExerciseGroupResponseModel({this.name, this.exercise_list});

  factory RoutineExerciseGroupResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$RoutineExerciseGroupResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RoutineExerciseGroupResponseModelToJson(this);

  @override
  List<Object> get props => [name, exercise_list];
}
