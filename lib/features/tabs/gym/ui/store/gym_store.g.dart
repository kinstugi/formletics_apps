// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'gym_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GymStore on _TodoStoreBase, Store {
  final _$isSucceedAllGymsAtom = Atom(name: '_TodoStoreBase.isSucceedAllGyms');

  @override
  StateStatus get isSucceedAllGyms {
    _$isSucceedAllGymsAtom.reportRead();
    return super.isSucceedAllGyms;
  }

  @override
  set isSucceedAllGyms(StateStatus value) {
    _$isSucceedAllGymsAtom.reportWrite(value, super.isSucceedAllGyms, () {
      super.isSucceedAllGyms = value;
    });
  }

  final _$isSucceedGymFeaturedAtom =
      Atom(name: '_TodoStoreBase.isSucceedGymFeatured');

  @override
  StateStatus get isSucceedGymFeatured {
    _$isSucceedGymFeaturedAtom.reportRead();
    return super.isSucceedGymFeatured;
  }

  @override
  set isSucceedGymFeatured(StateStatus value) {
    _$isSucceedGymFeaturedAtom.reportWrite(value, super.isSucceedGymFeatured,
        () {
      super.isSucceedGymFeatured = value;
    });
  }

  final _$isSucceedFilteredGymListAtom =
      Atom(name: '_TodoStoreBase.isSucceedFilteredGymList');

  @override
  StateStatus get isSucceedFilteredGymList {
    _$isSucceedFilteredGymListAtom.reportRead();
    return super.isSucceedFilteredGymList;
  }

  @override
  set isSucceedFilteredGymList(StateStatus value) {
    _$isSucceedFilteredGymListAtom
        .reportWrite(value, super.isSucceedFilteredGymList, () {
      super.isSucceedFilteredGymList = value;
    });
  }

  final _$isSucceedGymNearbyAtom =
      Atom(name: '_TodoStoreBase.isSucceedGymNearby');

  @override
  StateStatus get isSucceedGymNearby {
    _$isSucceedGymNearbyAtom.reportRead();
    return super.isSucceedGymNearby;
  }

  @override
  set isSucceedGymNearby(StateStatus value) {
    _$isSucceedGymNearbyAtom.reportWrite(value, super.isSucceedGymNearby, () {
      super.isSucceedGymNearby = value;
    });
  }

  final _$allGymsAtom = Atom(name: '_TodoStoreBase.allGyms');

  @override
  GymListResponseModel get allGyms {
    _$allGymsAtom.reportRead();
    return super.allGyms;
  }

  @override
  set allGyms(GymListResponseModel value) {
    _$allGymsAtom.reportWrite(value, super.allGyms, () {
      super.allGyms = value;
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

  final _$countAtom = Atom(name: '_TodoStoreBase.count');

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  final _$pageLinkAtom = Atom(name: '_TodoStoreBase.pageLink');

  @override
  String get pageLink {
    _$pageLinkAtom.reportRead();
    return super.pageLink;
  }

  @override
  set pageLink(String value) {
    _$pageLinkAtom.reportWrite(value, super.pageLink, () {
      super.pageLink = value;
    });
  }

  final _$isSucceedGymDetailsAtom =
      Atom(name: '_TodoStoreBase.isSucceedGymDetails');

  @override
  StateStatus get isSucceedGymDetails {
    _$isSucceedGymDetailsAtom.reportRead();
    return super.isSucceedGymDetails;
  }

  @override
  set isSucceedGymDetails(StateStatus value) {
    _$isSucceedGymDetailsAtom.reportWrite(value, super.isSucceedGymDetails, () {
      super.isSucceedGymDetails = value;
    });
  }

  final _$detailGymAtom = Atom(name: '_TodoStoreBase.detailGym');

  @override
  GymDetailResponseModel get detailGym {
    _$detailGymAtom.reportRead();
    return super.detailGym;
  }

  @override
  set detailGym(GymDetailResponseModel value) {
    _$detailGymAtom.reportWrite(value, super.detailGym, () {
      super.detailGym = value;
    });
  }

  final _$gymFeaturedAtom = Atom(name: '_TodoStoreBase.gymFeatured');

  @override
  List<GymListCardModel> get gymFeatured {
    _$gymFeaturedAtom.reportRead();
    return super.gymFeatured;
  }

  @override
  set gymFeatured(List<GymListCardModel> value) {
    _$gymFeaturedAtom.reportWrite(value, super.gymFeatured, () {
      super.gymFeatured = value;
    });
  }

  final _$filteredGymListAtom = Atom(name: '_TodoStoreBase.filteredGymList');

  @override
  List<GymListCardModel> get filteredGymList {
    _$filteredGymListAtom.reportRead();
    return super.filteredGymList;
  }

  @override
  set filteredGymList(List<GymListCardModel> value) {
    _$filteredGymListAtom.reportWrite(value, super.filteredGymList, () {
      super.filteredGymList = value;
    });
  }

  final _$gymsNearbyAtom = Atom(name: '_TodoStoreBase.gymsNearby');

  @override
  List<GymListCardModel> get gymsNearby {
    _$gymsNearbyAtom.reportRead();
    return super.gymsNearby;
  }

  @override
  set gymsNearby(List<GymListCardModel> value) {
    _$gymsNearbyAtom.reportWrite(value, super.gymsNearby, () {
      super.gymsNearby = value;
    });
  }

  final _$getAllGymsAsyncAction = AsyncAction('_TodoStoreBase.getAllGyms');

  @override
  Future<void> getAllGyms() {
    return _$getAllGymsAsyncAction.run(() => super.getAllGyms());
  }

  final _$getAllGymsByPageAsyncAction =
      AsyncAction('_TodoStoreBase.getAllGymsByPage');

  @override
  Future<void> getAllGymsByPage(String page) {
    return _$getAllGymsByPageAsyncAction
        .run(() => super.getAllGymsByPage(page));
  }

  final _$getGymDetailAsyncAction = AsyncAction('_TodoStoreBase.getGymDetail');

  @override
  Future<void> getGymDetail(int gymId) {
    return _$getGymDetailAsyncAction.run(() => super.getGymDetail(gymId));
  }

  final _$getGymFeaturedAsyncAction =
      AsyncAction('_TodoStoreBase.getGymFeatured');

  @override
  Future<void> getGymFeatured() {
    return _$getGymFeaturedAsyncAction.run(() => super.getGymFeatured());
  }

  final _$getGymsNearbyAsyncAction =
      AsyncAction('_TodoStoreBase.getGymsNearby');

  @override
  Future<void> getGymsNearby() {
    return _$getGymsNearbyAsyncAction.run(() => super.getGymsNearby());
  }

  final _$getGymsByLocationFilterAsyncAction =
      AsyncAction('_TodoStoreBase.getGymsByLocationFilter');

  @override
  Future<void> getGymsByLocationFilter() {
    return _$getGymsByLocationFilterAsyncAction
        .run(() => super.getGymsByLocationFilter());
  }

  final _$_TodoStoreBaseActionController =
      ActionController(name: '_TodoStoreBase');

  @override
  void resetList() {
    final _$actionInfo = _$_TodoStoreBaseActionController.startAction(
        name: '_TodoStoreBase.resetList');
    try {
      return super.resetList();
    } finally {
      _$_TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetDetail() {
    final _$actionInfo = _$_TodoStoreBaseActionController.startAction(
        name: '_TodoStoreBase.resetDetail');
    try {
      return super.resetDetail();
    } finally {
      _$_TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSucceedAllGyms: ${isSucceedAllGyms},
isSucceedGymFeatured: ${isSucceedGymFeatured},
isSucceedFilteredGymList: ${isSucceedFilteredGymList},
isSucceedGymNearby: ${isSucceedGymNearby},
allGyms: ${allGyms},
errorMessage: ${errorMessage},
count: ${count},
pageLink: ${pageLink},
isSucceedGymDetails: ${isSucceedGymDetails},
detailGym: ${detailGym},
gymFeatured: ${gymFeatured},
filteredGymList: ${filteredGymList},
gymsNearby: ${gymsNearby}
    ''';
  }
}
