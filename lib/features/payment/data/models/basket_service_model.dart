import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basket_service_model.g.dart';

@JsonSerializable()
class BasketNestedServiceModel extends Equatable {
  final int id;
  final String name;
  final bool subscription;
  final bool is_exercise;
  final bool is_nutrition;
  final bool is_supplement;

  const BasketNestedServiceModel(
      {this.id,
      this.name,
      this.subscription,
      this.is_exercise,
      this.is_nutrition,
      this.is_supplement});

  factory BasketNestedServiceModel.fromJson(Map<String, dynamic> json) =>
      _$BasketNestedServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasketNestedServiceModelToJson(this);

  @override
  List<Object> get props =>
      [id, name, subscription, is_exercise, is_nutrition, is_supplement];
}

@JsonSerializable()
class BasketServiceModel extends Equatable {
  final int id;
  final BasketNestedServiceModel service;
  final int period;
  final int price;

  const BasketServiceModel({this.id, this.service, this.period, this.price});

  factory BasketServiceModel.fromJson(Map<String, dynamic> json) =>
      _$BasketServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasketServiceModelToJson(this);

  @override
  List<Object> get props => [id, service, period, price];
}
