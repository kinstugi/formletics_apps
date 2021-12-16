// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'routine_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RoutineStore on _RoutineStoreBase, Store {
  final _$isSucceedMyTrainersAtom =
      Atom(name: '_RoutineStoreBase.isSucceedMyTrainers');

  @override
  StateStatus get isSucceedMyTrainers {
    _$isSucceedMyTrainersAtom.reportRead();
    return super.isSucceedMyTrainers;
  }

  @override
  set isSucceedMyTrainers(StateStatus value) {
    _$isSucceedMyTrainersAtom.reportWrite(value, super.isSucceedMyTrainers, () {
      super.isSucceedMyTrainers = value;
    });
  }

  final _$myTrainersAtom = Atom(name: '_RoutineStoreBase.myTrainers');

  @override
  List<RoutineListResponseModel> get myTrainers {
    _$myTrainersAtom.reportRead();
    return super.myTrainers;
  }

  @override
  set myTrainers(List<RoutineListResponseModel> value) {
    _$myTrainersAtom.reportWrite(value, super.myTrainers, () {
      super.myTrainers = value;
    });
  }

  final _$sportsmanServicesAtom =
      Atom(name: '_RoutineStoreBase.sportsmanServices');

  @override
  List<ServiceResponseModel> get sportsmanServices {
    _$sportsmanServicesAtom.reportRead();
    return super.sportsmanServices;
  }

  @override
  set sportsmanServices(List<ServiceResponseModel> value) {
    _$sportsmanServicesAtom.reportWrite(value, super.sportsmanServices, () {
      super.sportsmanServices = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_RoutineStoreBase.errorMessage');

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

  final _$isSucceedMyServicesAtom =
      Atom(name: '_RoutineStoreBase.isSucceedMyServices');

  @override
  StateStatus get isSucceedMyServices {
    _$isSucceedMyServicesAtom.reportRead();
    return super.isSucceedMyServices;
  }

  @override
  set isSucceedMyServices(StateStatus value) {
    _$isSucceedMyServicesAtom.reportWrite(value, super.isSucceedMyServices, () {
      super.isSucceedMyServices = value;
    });
  }

  final _$isSucceedSportsmanServicesAtom =
      Atom(name: '_RoutineStoreBase.isSucceedSportsmanServices');

  @override
  StateStatus get isSucceedSportsmanServices {
    _$isSucceedSportsmanServicesAtom.reportRead();
    return super.isSucceedSportsmanServices;
  }

  @override
  set isSucceedSportsmanServices(StateStatus value) {
    _$isSucceedSportsmanServicesAtom
        .reportWrite(value, super.isSucceedSportsmanServices, () {
      super.isSucceedSportsmanServices = value;
    });
  }

  final _$myServicesAtom = Atom(name: '_RoutineStoreBase.myServices');

  @override
  List<RoutineServiceListResponseModel> get myServices {
    _$myServicesAtom.reportRead();
    return super.myServices;
  }

  @override
  set myServices(List<RoutineServiceListResponseModel> value) {
    _$myServicesAtom.reportWrite(value, super.myServices, () {
      super.myServices = value;
    });
  }

  final _$sportsmanChatsAtom = Atom(name: '_RoutineStoreBase.sportsmanChats');

  @override
  List<SportsmanChatResponseModel> get sportsmanChats {
    _$sportsmanChatsAtom.reportRead();
    return super.sportsmanChats;
  }

  @override
  set sportsmanChats(List<SportsmanChatResponseModel> value) {
    _$sportsmanChatsAtom.reportWrite(value, super.sportsmanChats, () {
      super.sportsmanChats = value;
    });
  }

  final _$isSucceedSportsmanChatsAtom =
      Atom(name: '_RoutineStoreBase.isSucceedSportsmanChats');

  @override
  StateStatus get isSucceedSportsmanChats {
    _$isSucceedSportsmanChatsAtom.reportRead();
    return super.isSucceedSportsmanChats;
  }

  @override
  set isSucceedSportsmanChats(StateStatus value) {
    _$isSucceedSportsmanChatsAtom
        .reportWrite(value, super.isSucceedSportsmanChats, () {
      super.isSucceedSportsmanChats = value;
    });
  }

  final _$getMyTrainersAsyncAction =
      AsyncAction('_RoutineStoreBase.getMyTrainers');

  @override
  Future<void> getMyTrainers() {
    return _$getMyTrainersAsyncAction.run(() => super.getMyTrainers());
  }

  final _$getMyServicesAsyncAction =
      AsyncAction('_RoutineStoreBase.getMyServices');

  @override
  Future<void> getMyServices(int trainerId) {
    return _$getMyServicesAsyncAction.run(() => super.getMyServices(trainerId));
  }

  final _$fetchSportsmanServicesAsyncAction =
      AsyncAction('_RoutineStoreBase.fetchSportsmanServices');

  @override
  Future<void> fetchSportsmanServices() {
    return _$fetchSportsmanServicesAsyncAction
        .run(() => super.fetchSportsmanServices());
  }

  final _$fetchSportsmanTrainersChatAsyncAction =
      AsyncAction('_RoutineStoreBase.fetchSportsmanTrainersChat');

  @override
  Future<void> fetchSportsmanTrainersChat() {
    return _$fetchSportsmanTrainersChatAsyncAction
        .run(() => super.fetchSportsmanTrainersChat());
  }

  final _$_RoutineStoreBaseActionController =
      ActionController(name: '_RoutineStoreBase');

  @override
  void resetMyTrainers() {
    final _$actionInfo = _$_RoutineStoreBaseActionController.startAction(
        name: '_RoutineStoreBase.resetMyTrainers');
    try {
      return super.resetMyTrainers();
    } finally {
      _$_RoutineStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetService() {
    final _$actionInfo = _$_RoutineStoreBaseActionController.startAction(
        name: '_RoutineStoreBase.resetService');
    try {
      return super.resetService();
    } finally {
      _$_RoutineStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSucceedMyTrainers: ${isSucceedMyTrainers},
myTrainers: ${myTrainers},
sportsmanServices: ${sportsmanServices},
errorMessage: ${errorMessage},
isSucceedMyServices: ${isSucceedMyServices},
isSucceedSportsmanServices: ${isSucceedSportsmanServices},
myServices: ${myServices},
sportsmanChats: ${sportsmanChats},
isSucceedSportsmanChats: ${isSucceedSportsmanChats}
    ''';
  }
}
