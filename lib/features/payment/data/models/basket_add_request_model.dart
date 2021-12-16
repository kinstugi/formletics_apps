import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basket_add_request_model.g.dart';

@JsonSerializable()
class BasketAddNestedServiceModel extends Equatable {
  final int id;
  final String period;

  const BasketAddNestedServiceModel({this.id, this.period});

  factory BasketAddNestedServiceModel.fromJson(Map<String, dynamic> json) =>
      _$BasketAddNestedServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasketAddNestedServiceModelToJson(this);

  @override
  List<Object> get props => [id, period];
}

@JsonSerializable()
class BasketAddRequestModel extends Equatable {
  final List<BasketAddNestedServiceModel> services;

  const BasketAddRequestModel({this.services});

  factory BasketAddRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BasketAddRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasketAddRequestModelToJson(this);

  @override
  List<Object> get props => [services];
}
