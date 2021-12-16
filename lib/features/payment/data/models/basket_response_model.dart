import 'package:equatable/equatable.dart';
import 'package:formletics/features/payment/data/models/basket_price_model.dart';
import 'package:formletics/features/payment/data/models/basket_product_model.dart';
import 'package:formletics/features/payment/data/models/basket_service_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basket_response_model.g.dart';

@JsonSerializable()
class BasketResponseModel extends Equatable {
  final int id;
  final List<BasketProductModel> product;
  final List<BasketServiceModel> service;
  final List<BasketPriceModel> prices;
  final int user;

  const BasketResponseModel(
      {this.id, this.product, this.service, this.prices, this.user});

  factory BasketResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BasketResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasketResponseModelToJson(this);

  @override
  List<Object> get props => [id, product, service, prices, user];
}
