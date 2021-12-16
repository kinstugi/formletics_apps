import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gym_cut_reponse_model.g.dart';

@JsonSerializable()
class GymCutResponseModel extends Equatable {
  final int id;
  final String name;
  final String location;

  const GymCutResponseModel({this.id, this.name, this.location});

  factory GymCutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GymCutResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GymCutResponseModelToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        location,
      ];
}
