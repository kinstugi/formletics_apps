import 'package:equatable/equatable.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_exercise_days_model.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_nutrition_model.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_service.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_cut_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routine_service_list.g.dart';

@JsonSerializable()
class RoutineServiceListResponseModel extends Equatable {
  /*Routine General List after selecting Trainer. For 2nd Page*/
  final int id;
  final RoutineServiceResponseModel service;
  final List<RoutineExerciseDaysResponseModel> exercise_days;
  final RoutineNutritionResponseModel nutrition_list;
  // final SUPPLEMENT TODO
  final DateTime start_date;
  final DateTime end_date;
  final String note;
  final TrainerCutResponseModel trainer;

  const RoutineServiceListResponseModel(
      {this.id,
      this.service,
      this.exercise_days,
      this.nutrition_list,
      this.start_date,
      this.end_date,
      this.note,
      this.trainer});

  factory RoutineServiceListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RoutineServiceListResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RoutineServiceListResponseModelToJson(this);

  @override
  List<Object> get props => [
        id,
        service,
        exercise_days,
        nutrition_list,
        start_date,
        end_date,
        note,
        trainer
      ];
}
