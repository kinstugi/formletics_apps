import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_response_model.g.dart';

@JsonSerializable()
class LocationResponseModel extends Equatable {
  final int id;
  final String name;

  const LocationResponseModel({
    this.id,
    this.name,
  });

  factory LocationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResponseModelToJson(this);

  @override
  List<Object> get props => [id, name];
}
