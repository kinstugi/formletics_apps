import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basket_price_model.g.dart';

@JsonSerializable()
class BasketPriceModel extends Equatable {
  final int service_total_price;
  final int product_total_price;
  final int total_price;

  const BasketPriceModel(
      {this.service_total_price, this.product_total_price, this.total_price});

  factory BasketPriceModel.fromJson(Map<String, dynamic> json) =>
      _$BasketPriceModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasketPriceModelToJson(this);

  @override
  List<Object> get props =>
      [service_total_price, product_total_price, total_price];
}
