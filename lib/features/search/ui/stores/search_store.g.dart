// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _TodoStoreBase, Store {
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

  final _$isSucceedAllModelsAtom =
      Atom(name: '_TodoStoreBase.isSucceedAllModels');

  @override
  StateStatus get isSucceedAllModels {
    _$isSucceedAllModelsAtom.reportRead();
    return super.isSucceedAllModels;
  }

  @override
  set isSucceedAllModels(StateStatus value) {
    _$isSucceedAllModelsAtom.reportWrite(value, super.isSucceedAllModels, () {
      super.isSucceedAllModels = value;
    });
  }

  final _$gymsAtom = Atom(name: '_TodoStoreBase.gyms');

  @override
  List<GymListCardModel> get gyms {
    _$gymsAtom.reportRead();
    return super.gyms;
  }

  @override
  set gyms(List<GymListCardModel> value) {
    _$gymsAtom.reportWrite(value, super.gyms, () {
      super.gyms = value;
    });
  }

  final _$trainersAtom = Atom(name: '_TodoStoreBase.trainers');

  @override
  List<TrainerListCardModel> get trainers {
    _$trainersAtom.reportRead();
    return super.trainers;
  }

  @override
  set trainers(List<TrainerListCardModel> value) {
    _$trainersAtom.reportWrite(value, super.trainers, () {
      super.trainers = value;
    });
  }

  final _$searchQueryAtom = Atom(name: '_TodoStoreBase.searchQuery');

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  final _$gymSearchResultsAtom = Atom(name: '_TodoStoreBase.gymSearchResults');

  @override
  List<GymListCardModel> get gymSearchResults {
    _$gymSearchResultsAtom.reportRead();
    return super.gymSearchResults;
  }

  @override
  set gymSearchResults(List<GymListCardModel> value) {
    _$gymSearchResultsAtom.reportWrite(value, super.gymSearchResults, () {
      super.gymSearchResults = value;
    });
  }

  final _$trainerSearchResultsAtom =
      Atom(name: '_TodoStoreBase.trainerSearchResults');

  @override
  List<TrainerListCardModel> get trainerSearchResults {
    _$trainerSearchResultsAtom.reportRead();
    return super.trainerSearchResults;
  }

  @override
  set trainerSearchResults(List<TrainerListCardModel> value) {
    _$trainerSearchResultsAtom.reportWrite(value, super.trainerSearchResults,
        () {
      super.trainerSearchResults = value;
    });
  }

  final _$getAllGymsAsyncAction = AsyncAction('_TodoStoreBase.getAllGyms');

  @override
  Future<void> getAllGyms() {
    return _$getAllGymsAsyncAction.run(() => super.getAllGyms());
  }

  final _$getAllTrainersAsyncAction =
      AsyncAction('_TodoStoreBase.getAllTrainers');

  @override
  Future<void> getAllTrainers() {
    return _$getAllTrainersAsyncAction.run(() => super.getAllTrainers());
  }

  final _$_TodoStoreBaseActionController =
      ActionController(name: '_TodoStoreBase');

  @override
  void searchGyms(String query) {
    final _$actionInfo = _$_TodoStoreBaseActionController.startAction(
        name: '_TodoStoreBase.searchGyms');
    try {
      return super.searchGyms(query);
    } finally {
      _$_TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchTrainers(String query) {
    final _$actionInfo = _$_TodoStoreBaseActionController.startAction(
        name: '_TodoStoreBase.searchTrainers');
    try {
      return super.searchTrainers(query);
    } finally {
      _$_TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSucceedAllGyms: ${isSucceedAllGyms},
isSucceedAllTrainers: ${isSucceedAllTrainers},
isSucceedAllModels: ${isSucceedAllModels},
gyms: ${gyms},
trainers: ${trainers},
searchQuery: ${searchQuery},
gymSearchResults: ${gymSearchResults},
trainerSearchResults: ${trainerSearchResults}
    ''';
  }
}
