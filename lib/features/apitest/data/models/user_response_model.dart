import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class Geo extends Equatable {
  final String lat;
  final String lng;

  const Geo({
    this.lat,
    this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);

  @override
  List<Object> get props => [lat, lng];
}

@JsonSerializable()
class Address extends Equatable {
  final String street;
  final String suite;
  final Geo geo;

  const Address({this.street, this.suite, this.geo});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  List<Object> get props => [street, suite, geo];
}

@JsonSerializable()
class UserResponseModel extends Equatable {
  final String username;
  final String email;
  final Address address;

  const UserResponseModel({this.username, this.email, this.address});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);

  @override
  List<Object> get props => [username, email, address];
}
