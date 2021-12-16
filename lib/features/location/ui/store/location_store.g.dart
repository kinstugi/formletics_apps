// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'location_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocationStore on _TodoStoreBase, Store {
  final _$isSucceedIlAtom = Atom(name: '_TodoStoreBase.isSucceedIl');

  @override
  StateStatus get isSucceedIl {
    _$isSucceedIlAtom.reportRead();
    return super.isSucceedIl;
  }

  @override
  set isSucceedIl(StateStatus value) {
    _$isSucceedIlAtom.reportWrite(value, super.isSucceedIl, () {
      super.isSucceedIl = value;
    });
  }

  final _$ilListAtom = Atom(name: '_TodoStoreBase.ilList');

  @override
  List<LocationResponseModel> get ilList {
    _$ilListAtom.reportRead();
    return super.ilList;
  }

  @override
  set ilList(List<LocationResponseModel> value) {
    _$ilListAtom.reportWrite(value, super.ilList, () {
      super.ilList = value;
    });
  }

  final _$isSucceedIlceAtom = Atom(name: '_TodoStoreBase.isSucceedIlce');

  @override
  StateStatus get isSucceedIlce {
    _$isSucceedIlceAtom.reportRead();
    return super.isSucceedIlce;
  }

  @override
  set isSucceedIlce(StateStatus value) {
    _$isSucceedIlceAtom.reportWrite(value, super.isSucceedIlce, () {
      super.isSucceedIlce = value;
    });
  }

  final _$ilceListAtom = Atom(name: '_TodoStoreBase.ilceList');

  @override
  List<LocationResponseModel> get ilceList {
    _$ilceListAtom.reportRead();
    return super.ilceList;
  }

  @override
  set ilceList(List<LocationResponseModel> value) {
    _$ilceListAtom.reportWrite(value, super.ilceList, () {
      super.ilceList = value;
    });
  }

  final _$isSucceedSemtAtom = Atom(name: '_TodoStoreBase.isSucceedSemt');

  @override
  StateStatus get isSucceedSemt {
    _$isSucceedSemtAtom.reportRead();
    return super.isSucceedSemt;
  }

  @override
  set isSucceedSemt(StateStatus value) {
    _$isSucceedSemtAtom.reportWrite(value, super.isSucceedSemt, () {
      super.isSucceedSemt = value;
    });
  }

  final _$semtListAtom = Atom(name: '_TodoStoreBase.semtList');

  @override
  List<LocationResponseModel> get semtList {
    _$semtListAtom.reportRead();
    return super.semtList;
  }

  @override
  set semtList(List<LocationResponseModel> value) {
    _$semtListAtom.reportWrite(value, super.semtList, () {
      super.semtList = value;
    });
  }

  final _$isSucceedMahalleAtom = Atom(name: '_TodoStoreBase.isSucceedMahalle');

  @override
  StateStatus get isSucceedMahalle {
    _$isSucceedMahalleAtom.reportRead();
    return super.isSucceedMahalle;
  }

  @override
  set isSucceedMahalle(StateStatus value) {
    _$isSucceedMahalleAtom.reportWrite(value, super.isSucceedMahalle, () {
      super.isSucceedMahalle = value;
    });
  }

  final _$mahalleListAtom = Atom(name: '_TodoStoreBase.mahalleList');

  @override
  List<LocationResponseModel> get mahalleList {
    _$mahalleListAtom.reportRead();
    return super.mahalleList;
  }

  @override
  set mahalleList(List<LocationResponseModel> value) {
    _$mahalleListAtom.reportWrite(value, super.mahalleList, () {
      super.mahalleList = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_TodoStoreBase.errorMessage');

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

  final _$getIlAsyncAction = AsyncAction('_TodoStoreBase.getIl');

  @override
  Future<void> getIl() {
    return _$getIlAsyncAction.run(() => super.getIl());
  }

  final _$getIlceAsyncAction = AsyncAction('_TodoStoreBase.getIlce');

  @override
  Future<void> getIlce(int il_id) {
    return _$getIlceAsyncAction.run(() => super.getIlce(il_id));
  }

  final _$getSemtAsyncAction = AsyncAction('_TodoStoreBase.getSemt');

  @override
  Future<void> getSemt(int ilce_id) {
    return _$getSemtAsyncAction.run(() => super.getSemt(ilce_id));
  }

  final _$getMahalleAsyncAction = AsyncAction('_TodoStoreBase.getMahalle');

  @override
  Future<void> getMahalle(int semt_id) {
    return _$getMahalleAsyncAction.run(() => super.getMahalle(semt_id));
  }

  @override
  String toString() {
    return '''
isSucceedIl: ${isSucceedIl},
ilList: ${ilList},
isSucceedIlce: ${isSucceedIlce},
ilceList: ${ilceList},
isSucceedSemt: ${isSucceedSemt},
semtList: ${semtList},
isSucceedMahalle: ${isSucceedMahalle},
mahalleList: ${mahalleList},
errorMessage: ${errorMessage}
    ''';
  }
}
