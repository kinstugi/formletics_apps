import 'package:equatable/equatable.dart';
import 'package:formletics/features/payment/data/models/basket_product_model.dart';
import 'package:formletics/features/payment/data/models/basket_service_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basket_add_response_model.g.dart';

@JsonSerializable()
class BasketAddResponseModel extends Equatable {
  final List<BasketServiceModel> services;
  final List<BasketProductModel> products;

  const BasketAddResponseModel({this.services, this.products});

  factory BasketAddResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BasketAddResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasketAddResponseModelToJson(this);

  @override
  List<Object> get props => [services];
}
