import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basket_product_model.g.dart';

@JsonSerializable()
class BasketNestedProductModel extends Equatable {
  final int id;
  final String category;
  final String creator;
  final List<String> gift;
  final String brand;
  final String model;
  final String amount;
  final int price;
  final int stock;

  const BasketNestedProductModel(
      {this.id,
      this.category,
      this.creator,
      this.gift,
      this.brand,
      this.model,
      this.amount,
      this.price,
      this.stock});

  factory BasketNestedProductModel.fromJson(Map<String, dynamic> json) =>
      _$BasketNestedProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasketNestedProductModelToJson(this);

  @override
  List<Object> get props =>
      [id, category, creator, gift, brand, model, price, stock];
}

@JsonSerializable()
class BasketProductModel extends Equatable {
  final int id;
  final BasketNestedProductModel product;
  final String aroma;
  final String gift;
  final int count;
  final int user;

  const BasketProductModel(
      {this.id, this.product, this.aroma, this.gift, this.count, this.user});

  factory BasketProductModel.fromJson(Map<String, dynamic> json) =>
      _$BasketProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasketProductModelToJson(this);

  @override
  List<Object> get props => [id, product, aroma, gift, count, user];
}
