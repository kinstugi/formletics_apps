// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'photo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PhotoStore on _PhotoStoreBase, Store {
  final _$photoListAtom = Atom(name: '_PhotoStoreBase.photoList');

  @override
  List<PhotoResponseModel> get photoList {
    _$photoListAtom.reportRead();
    return super.photoList;
  }

  @override
  set photoList(List<PhotoResponseModel> value) {
    _$photoListAtom.reportWrite(value, super.photoList, () {
      super.photoList = value;
    });
  }

  final _$successAtom = Atom(name: '_PhotoStoreBase.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$isSucceedAtom = Atom(name: '_PhotoStoreBase.isSucceed');

  @override
  StateStatus get isSucceed {
    _$isSucceedAtom.reportRead();
    return super.isSucceed;
  }

  @override
  set isSucceed(StateStatus value) {
    _$isSucceedAtom.reportWrite(value, super.isSucceed, () {
      super.isSucceed = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_PhotoStoreBase.errorMessage');

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

  @override
  String toString() {
    return '''
photoList: ${photoList},
success: ${success},
isSucceed: ${isSucceed},
errorMessage: ${errorMessage}
    ''';
  }
}
