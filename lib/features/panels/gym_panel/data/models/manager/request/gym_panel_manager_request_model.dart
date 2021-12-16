import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'gym_panel_manager_request_model.g.dart';

@JsonSerializable()
class GymPanelManagerRequestModel extends Equatable  {
	@JsonKey(name: 'new_manager')
	final String newManager;

	GymPanelManagerRequestModel({this.newManager});

	factory GymPanelManagerRequestModel.fromJson(Map<String, dynamic> json) => _$GymPanelManagerRequestModelFromJson(json);

	Map<String, dynamic> toJson() => _$GymPanelManagerRequestModelToJson(this);

	@override
	List<Object> get props => [
		this.newManager
	];
}
