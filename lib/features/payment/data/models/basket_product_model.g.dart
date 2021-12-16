// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'basket_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketNestedProductModel _$BasketNestedProductModelFromJson(
    Map<String, dynamic> json) {
  return BasketNestedProductModel(
    id: json['id'] as int,
    category: json['category'] as String,
    creator: json['creator'] as String,
    gift: (json['gift'] as List)?.map((e) => e as String)?.toList(),
    brand: json['brand'] as String,
    model: json['model'] as String,
    amount: json['amount'] as String,
    price: json['price'] as int,
    stock: json['stock'] as int,
  );
}

Map<String, dynamic> _$BasketNestedProductModelToJson(
        BasketNestedProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'creator': instance.creator,
      'gift': instance.gift,
      'brand': instance.brand,
      'model': instance.model,
      'amount': instance.amount,
      'price': instance.price,
      'stock': instance.stock,
    };

BasketProductModel _$BasketProductModelFromJson(Map<String, dynamic> json) {
  return BasketProductModel(
    id: json['id'] as int,
    product: json['product'] == null
        ? null
        : BasketNestedProductModel.fromJson(
            json['product'] as Map<String, dynamic>),
    aroma: json['aroma'] as String,
    gift: json['gift'] as String,
    count: json['count'] as int,
    user: json['user'] as int,
  );
}

Map<String, dynamic> _$BasketProductModelToJson(BasketProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'aroma': instance.aroma,
      'gift': instance.gift,
      'count': instance.count,
      'user': instance.user,
    };
