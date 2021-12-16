import 'package:equatable/equatable.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_cut_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routine_list_model.g.dart';

@JsonSerializable()
class RoutineListResponseModel extends Equatable {
  final int id;
  final TrainerCutResponseModel trainer;

  const RoutineListResponseModel({this.id, this.trainer});

  factory RoutineListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RoutineListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineListResponseModelToJson(this);

  @override
  List<Object> get props => [id, trainer];
}
