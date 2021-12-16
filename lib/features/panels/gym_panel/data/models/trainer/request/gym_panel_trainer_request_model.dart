import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'gym_panel_trainer_request_model.g.dart';

@JsonSerializable()
class GymPanelTrainerRequestModel extends Equatable  {
	@JsonKey(name: 'new_trainer')
	final String newTrainer;

	GymPanelTrainerRequestModel({this.newTrainer});

	factory GymPanelTrainerRequestModel.fromJson(Map<String, dynamic> json) => _$GymPanelTrainerRequestModelFromJson(json);

	Map<String, dynamic> toJson() => _$GymPanelTrainerRequestModelToJson(this);

	@override
	List<Object> get props => [
		this.newTrainer
	];
}
