// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'my_gym_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyGymStore on _MyGymStore, Store {
  final _$showModalAtom = Atom(name: '_MyGymStore.showModal');

  @override
  bool get showModal {
    _$showModalAtom.reportRead();
    return super.showModal;
  }

  @override
  set showModal(bool value) {
    _$showModalAtom.reportWrite(value, super.showModal, () {
      super.showModal = value;
    });
  }

  final _$ilAtom = Atom(name: '_MyGymStore.il');

  @override
  String get il {
    _$ilAtom.reportRead();
    return super.il;
  }

  @override
  set il(String value) {
    _$ilAtom.reportWrite(value, super.il, () {
      super.il = value;
    });
  }

  final _$ilceAtom = Atom(name: '_MyGymStore.ilce');

  @override
  String get ilce {
    _$ilceAtom.reportRead();
    return super.ilce;
  }

  @override
  set ilce(String value) {
    _$ilceAtom.reportWrite(value, super.ilce, () {
      super.ilce = value;
    });
  }

  final _$semtAtom = Atom(name: '_MyGymStore.semt');

  @override
  String get semt {
    _$semtAtom.reportRead();
    return super.semt;
  }

  @override
  set semt(String value) {
    _$semtAtom.reportWrite(value, super.semt, () {
      super.semt = value;
    });
  }

  final _$mahalleAtom = Atom(name: '_MyGymStore.mahalle');

  @override
  String get mahalle {
    _$mahalleAtom.reportRead();
    return super.mahalle;
  }

  @override
  set mahalle(String value) {
    _$mahalleAtom.reportWrite(value, super.mahalle, () {
      super.mahalle = value;
    });
  }

  final _$getPreferenceAsyncAction = AsyncAction('_MyGymStore.getPreference');

  @override
  Future<void> getPreference() {
    return _$getPreferenceAsyncAction.run(() => super.getPreference());
  }

  final _$checkFiltersAsyncAction = AsyncAction('_MyGymStore.checkFilters');

  @override
  Future<bool> checkFilters() {
    return _$checkFiltersAsyncAction.run(() => super.checkFilters());
  }

  final _$saveFilterAsyncAction = AsyncAction('_MyGymStore.saveFilter');

  @override
  Future<bool> saveFilter(Map<String, dynamic> locationData) {
    return _$saveFilterAsyncAction.run(() => super.saveFilter(locationData));
  }

  @override
  String toString() {
    return '''
showModal: ${showModal},
il: ${il},
ilce: ${ilce},
semt: ${semt},
mahalle: ${mahalle}
    ''';
  }
}
