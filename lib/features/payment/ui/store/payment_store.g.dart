// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'payment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentStore on _PaymentStoreBase, Store {
  final _$errorMessageAtom = Atom(name: '_PaymentStoreBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$isSucceedGetBasketAtom =
      Atom(name: '_PaymentStoreBase.isSucceedGetBasket');

  @override
  StateStatus get isSucceedGetBasket {
    _$isSucceedGetBasketAtom.reportRead();
    return super.isSucceedGetBasket;
  }

  @override
  set isSucceedGetBasket(StateStatus value) {
    _$isSucceedGetBasketAtom.reportWrite(value, super.isSucceedGetBasket, () {
      super.isSucceedGetBasket = value;
    });
  }

  final _$isSucceedChangedQuantitiyAtom =
      Atom(name: '_PaymentStoreBase.isSucceedChangedQuantitiy');

  @override
  StateStatus get isSucceedChangedQuantitiy {
    _$isSucceedChangedQuantitiyAtom.reportRead();
    return super.isSucceedChangedQuantitiy;
  }

  @override
  set isSucceedChangedQuantitiy(StateStatus value) {
    _$isSucceedChangedQuantitiyAtom
        .reportWrite(value, super.isSucceedChangedQuantitiy, () {
      super.isSucceedChangedQuantitiy = value;
    });
  }

  final _$basketAtom = Atom(name: '_PaymentStoreBase.basket');

  @override
  BasketResponseModel get basket {
    _$basketAtom.reportRead();
    return super.basket;
  }

  @override
  set basket(BasketResponseModel value) {
    _$basketAtom.reportWrite(value, super.basket, () {
      super.basket = value;
    });
  }

  final _$product_countAtom = Atom(name: '_PaymentStoreBase.product_count');

  @override
  int get product_count {
    _$product_countAtom.reportRead();
    return super.product_count;
  }

  @override
  set product_count(int value) {
    _$product_countAtom.reportWrite(value, super.product_count, () {
      super.product_count = value;
    });
  }

  final _$nextAtom = Atom(name: '_PaymentStoreBase.next');

  @override
  bool get next {
    _$nextAtom.reportRead();
    return super.next;
  }

  @override
  set next(bool value) {
    _$nextAtom.reportWrite(value, super.next, () {
      super.next = value;
    });
  }

  final _$getBasketAsyncAction = AsyncAction('_PaymentStoreBase.getBasket');

  @override
  Future<void> getBasket() {
    return _$getBasketAsyncAction.run(() => super.getBasket());
  }

  final _$patchChangeQuantityAsyncAction =
      AsyncAction('_PaymentStoreBase.patchChangeQuantity');

  @override
  Future<void> patchChangeQuantity(int oid, int productId, int count) {
    return _$patchChangeQuantityAsyncAction
        .run(() => super.patchChangeQuantity(oid, productId, count));
  }

  final _$removeProductBasketAsyncAction =
      AsyncAction('_PaymentStoreBase.removeProductBasket');

  @override
  Future<void> removeProductBasket(int productId) {
    return _$removeProductBasketAsyncAction
        .run(() => super.removeProductBasket(productId));
  }

  final _$removeServiceBasketAsyncAction =
      AsyncAction('_PaymentStoreBase.removeServiceBasket');

  @override
  Future<void> removeServiceBasket(int serviceId) {
    return _$removeServiceBasketAsyncAction
        .run(() => super.removeServiceBasket(serviceId));
  }

  final _$make3dPaymentAsyncAction =
      AsyncAction('_PaymentStoreBase.make3dPayment');

  @override
  Future<Payment3DResponseModel> make3dPayment(Map<String, dynamic> details) {
    return _$make3dPaymentAsyncAction.run(() => super.make3dPayment(details));
  }

  final _$_PaymentStoreBaseActionController =
      ActionController(name: '_PaymentStoreBase');

  @override
  void resetBasket() {
    final _$actionInfo = _$_PaymentStoreBaseActionController.startAction(
        name: '_PaymentStoreBase.resetBasket');
    try {
      return super.resetBasket();
    } finally {
      _$_PaymentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
isSucceedGetBasket: ${isSucceedGetBasket},
isSucceedChangedQuantitiy: ${isSucceedChangedQuantitiy},
basket: ${basket},
product_count: ${product_count},
next: ${next}
    ''';
  }
}
