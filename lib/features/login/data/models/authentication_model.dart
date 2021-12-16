import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'authentication_model.g.dart';

@JsonSerializable(nullable: false)
class AuthenticationModel extends Equatable {
  final String token;

  const AuthenticationModel({
    @required this.token,
  });

  bool get isAuthenticated => token != null && token.isNotEmpty;

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationModelToJson(this);

  @override
  List<Object> get props => [token];
}
