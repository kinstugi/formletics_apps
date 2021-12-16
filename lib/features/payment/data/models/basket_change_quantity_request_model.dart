import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basket_change_quantity_request_model.g.dart';

@JsonSerializable()
class BasketChangeQuantityRequestModel extends Equatable {
  final int count;

  const BasketChangeQuantityRequestModel({this.count});

  factory BasketChangeQuantityRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$BasketChangeQuantityRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BasketChangeQuantityRequestModelToJson(this);

  @override
  List<Object> get props => [count];
}
