// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'trainer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TrainerStore on _TodoStoreBase, Store {
  final _$isSucceedAllTrainersAtom =
      Atom(name: '_TodoStoreBase.isSucceedAllTrainers');

  @override
  StateStatus get isSucceedAllTrainers {
    _$isSucceedAllTrainersAtom.reportRead();
    return super.isSucceedAllTrainers;
  }

  @override
  set isSucceedAllTrainers(StateStatus value) {
    _$isSucceedAllTrainersAtom.reportWrite(value, super.isSucceedAllTrainers,
        () {
      super.isSucceedAllTrainers = value;
    });
  }

  final _$isSucceedAllFeaturedTrainersAtom =
      Atom(name: '_TodoStoreBase.isSucceedAllFeaturedTrainers');

  @override
  StateStatus get isSucceedAllFeaturedTrainers {
    _$isSucceedAllFeaturedTrainersAtom.reportRead();
    return super.isSucceedAllFeaturedTrainers;
  }

  @override
  set isSucceedAllFeaturedTrainers(StateStatus value) {
    _$isSucceedAllFeaturedTrainersAtom
        .reportWrite(value, super.isSucceedAllFeaturedTrainers, () {
      super.isSucceedAllFeaturedTrainers = value;
    });
  }

  final _$isSucceedAllTrainersHighlightAtom =
      Atom(name: '_TodoStoreBase.isSucceedAllTrainersHighlight');

  @override
  StateStatus get isSucceedAllTrainersHighlight {
    _$isSucceedAllTrainersHighlightAtom.reportRead();
    return super.isSucceedAllTrainersHighlight;
  }

  @override
  set isSucceedAllTrainersHighlight(StateStatus value) {
    _$isSucceedAllTrainersHighlightAtom
        .reportWrite(value, super.isSucceedAllTrainersHighlight, () {
      super.isSucceedAllTrainersHighlight = value;
    });
  }

  final _$allTrainersAtom = Atom(name: '_TodoStoreBase.allTrainers');

  @override
  TrainerListResponseModel get allTrainers {
    _$allTrainersAtom.reportRead();
    return super.allTrainers;
  }

  @override
  set allTrainers(TrainerListResponseModel value) {
    _$allTrainersAtom.reportWrite(value, super.allTrainers, () {
      super.allTrainers = value;
    });
  }

  final _$allFeaturedTrainersAtom =
      Atom(name: '_TodoStoreBase.allFeaturedTrainers');

  @override
  List<TrainerListCardModel> get allFeaturedTrainers {
    _$allFeaturedTrainersAtom.reportRead();
    return super.allFeaturedTrainers;
  }

  @override
  set allFeaturedTrainers(List<TrainerListCardModel> value) {
    _$allFeaturedTrainersAtom.reportWrite(value, super.allFeaturedTrainers, () {
      super.allFeaturedTrainers = value;
    });
  }

  final _$allTrainersHighlightAtom =
      Atom(name: '_TodoStoreBase.allTrainersHighlight');

  @override
  List<TrainerListCardModel> get allTrainersHighlight {
    _$allTrainersHighlightAtom.reportRead();
    return super.allTrainersHighlight;
  }

  @override
  set allTrainersHighlight(List<TrainerListCardModel> value) {
    _$allTrainersHighlightAtom.reportWrite(value, super.allTrainersHighlight,
        () {
      super.allTrainersHighlight = value;
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

  final _$isSucceedTrainerDetailsAtom =
      Atom(name: '_TodoStoreBase.isSucceedTrainerDetails');

  @override
  StateStatus get isSucceedTrainerDetails {
    _$isSucceedTrainerDetailsAtom.reportRead();
    return super.isSucceedTrainerDetails;
  }

  @override
  set isSucceedTrainerDetails(StateStatus value) {
    _$isSucceedTrainerDetailsAtom
        .reportWrite(value, super.isSucceedTrainerDetails, () {
      super.isSucceedTrainerDetails = value;
    });
  }

  final _$detailTrainerAtom = Atom(name: '_TodoStoreBase.detailTrainer');

  @override
  TrainerDetailResponseModel get detailTrainer {
    _$detailTrainerAtom.reportRead();
    return super.detailTrainer;
  }

  @override
  set detailTrainer(TrainerDetailResponseModel value) {
    _$detailTrainerAtom.reportWrite(value, super.detailTrainer, () {
      super.detailTrainer = value;
    });
  }

  final _$isAddBasketAtom = Atom(name: '_TodoStoreBase.isAddBasket');

  @override
  bool get isAddBasket {
    _$isAddBasketAtom.reportRead();
    return super.isAddBasket;
  }

  @override
  set isAddBasket(bool value) {
    _$isAddBasketAtom.reportWrite(value, super.isAddBasket, () {
      super.isAddBasket = value;
    });
  }

  final _$getAllFeaturedTrainersAsyncAction =
      AsyncAction('_TodoStoreBase.getAllFeaturedTrainers');

  @override
  Future<void> getAllFeaturedTrainers() {
    return _$getAllFeaturedTrainersAsyncAction
        .run(() => super.getAllFeaturedTrainers());
  }

  final _$getAllTrainersHighlightAsyncAction =
      AsyncAction('_TodoStoreBase.getAllTrainersHighlight');

  @override
  Future<void> getAllTrainersHighlight() {
    return _$getAllTrainersHighlightAsyncAction
        .run(() => super.getAllTrainersHighlight());
  }

  final _$getAllTrainersAsyncAction =
      AsyncAction('_TodoStoreBase.getAllTrainers');

  @override
  Future<void> getAllTrainers() {
    return _$getAllTrainersAsyncAction.run(() => super.getAllTrainers());
  }

  final _$getAllTrainerByPageAsyncAction =
      AsyncAction('_TodoStoreBase.getAllTrainerByPage');

  @override
  Future<void> getAllTrainerByPage(String page) {
    return _$getAllTrainerByPageAsyncAction
        .run(() => super.getAllTrainerByPage(page));
  }

  final _$getTrainerDetailAsyncAction =
      AsyncAction('_TodoStoreBase.getTrainerDetail');

  @override
  Future<void> getTrainerDetail(int trainerId) {
    return _$getTrainerDetailAsyncAction
        .run(() => super.getTrainerDetail(trainerId));
  }

  final _$addBasketFromTrainerAsyncAction =
      AsyncAction('_TodoStoreBase.addBasketFromTrainer');

  @override
  Future<void> addBasketFromTrainer(int serviceId, String period) {
    return _$addBasketFromTrainerAsyncAction
        .run(() => super.addBasketFromTrainer(serviceId, period));
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
isSucceedAllTrainers: ${isSucceedAllTrainers},
isSucceedAllFeaturedTrainers: ${isSucceedAllFeaturedTrainers},
isSucceedAllTrainersHighlight: ${isSucceedAllTrainersHighlight},
allTrainers: ${allTrainers},
allFeaturedTrainers: ${allFeaturedTrainers},
allTrainersHighlight: ${allTrainersHighlight},
errorMessage: ${errorMessage},
count: ${count},
pageLink: ${pageLink},
isSucceedTrainerDetails: ${isSucceedTrainerDetails},
detailTrainer: ${detailTrainer},
isAddBasket: ${isAddBasket}
    ''';
  }
}
