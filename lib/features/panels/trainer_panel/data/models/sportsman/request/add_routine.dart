import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/trainer_panel_sportsman_request_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'add_routine.g.dart';

@JsonSerializable()
class TrainerPanelAddRoutineRequestModel extends Equatable {
  //@JsonKey(name: 'addRoutine')
  TrainerPanelSportsmanRequestModel addRoutine;

  TrainerPanelAddRoutineRequestModel({this.addRoutine});

  factory TrainerPanelAddRoutineRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TrainerPanelAddRoutineRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerPanelAddRoutineRequestModelToJson(this);

  @override
  List<Object> get props => [this.addRoutine];
}
