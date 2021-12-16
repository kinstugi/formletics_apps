import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'post_login_response_model.g.dart';

@JsonSerializable(nullable: true)
class PostLoginResponseModel extends Equatable {
  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'non_field_errors')
  final String errorMessage;

  const PostLoginResponseModel({
    @required this.token,
    this.errorMessage,
  });

  bool get isAuthenticated => token != null;

  factory PostLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostLoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostLoginResponseModelToJson(this);

  @override
  List<Object> get props => [token, errorMessage];
}
