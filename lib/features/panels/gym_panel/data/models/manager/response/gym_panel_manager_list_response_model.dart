import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'gym_panel_manager_list_response_model.g.dart';

@JsonSerializable()
class GymPanelManagerListResponseModel extends Equatable  {
	@JsonKey(name: 'managers')
	final List<String> managers;

	GymPanelManagerListResponseModel({this.managers});

	factory GymPanelManagerListResponseModel.fromJson(Map<String, dynamic> json) => _$GymPanelManagerListResponseModelFromJson(json);

	Map<String, dynamic> toJson() => _$GymPanelManagerListResponseModelToJson(this);

	@override
	List<Object> get props => [
		this.managers
	];
}
