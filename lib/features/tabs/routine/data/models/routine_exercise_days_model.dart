import 'package:equatable/equatable.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_exercise_group_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routine_exercise_days_model.g.dart';

@JsonSerializable()
class RoutineExerciseDaysResponseModel extends Equatable {
  final int day_number;
  final List<RoutineExerciseGroupResponseModel> group;
  final bool is_break;

  const RoutineExerciseDaysResponseModel(
      {this.day_number, this.group, this.is_break});

  factory RoutineExerciseDaysResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$RoutineExerciseDaysResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RoutineExerciseDaysResponseModelToJson(this);

  @override
  List<Object> get props => [day_number, group, is_break];
}
