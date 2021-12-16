// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'gym_panel_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GymPanelStore on _GymPanelStore, Store {
  final _$errorMessageAtom = Atom(name: '_GymPanelStore.errorMessage');

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

  final _$isSucceedGetTrainerAtom =
      Atom(name: '_GymPanelStore.isSucceedGetTrainer');

  @override
  StateStatus get isSucceedGetTrainer {
    _$isSucceedGetTrainerAtom.reportRead();
    return super.isSucceedGetTrainer;
  }

  @override
  set isSucceedGetTrainer(StateStatus value) {
    _$isSucceedGetTrainerAtom.reportWrite(value, super.isSucceedGetTrainer, () {
      super.isSucceedGetTrainer = value;
    });
  }

  final _$isSucceedAddTrainerAtom =
      Atom(name: '_GymPanelStore.isSucceedAddTrainer');

  @override
  StateStatus get isSucceedAddTrainer {
    _$isSucceedAddTrainerAtom.reportRead();
    return super.isSucceedAddTrainer;
  }

  @override
  set isSucceedAddTrainer(StateStatus value) {
    _$isSucceedAddTrainerAtom.reportWrite(value, super.isSucceedAddTrainer, () {
      super.isSucceedAddTrainer = value;
    });
  }

  final _$isSucceedRemoveTrainerAtom =
      Atom(name: '_GymPanelStore.isSucceedRemoveTrainer');

  @override
  StateStatus get isSucceedRemoveTrainer {
    _$isSucceedRemoveTrainerAtom.reportRead();
    return super.isSucceedRemoveTrainer;
  }

  @override
  set isSucceedRemoveTrainer(StateStatus value) {
    _$isSucceedRemoveTrainerAtom
        .reportWrite(value, super.isSucceedRemoveTrainer, () {
      super.isSucceedRemoveTrainer = value;
    });
  }

  final _$trainersAtom = Atom(name: '_GymPanelStore.trainers');

  @override
  List<GymPanelNestedTrainers> get trainers {
    _$trainersAtom.reportRead();
    return super.trainers;
  }

  @override
  set trainers(List<GymPanelNestedTrainers> value) {
    _$trainersAtom.reportWrite(value, super.trainers, () {
      super.trainers = value;
    });
  }

  final _$isSucceedGetManagerAtom =
      Atom(name: '_GymPanelStore.isSucceedGetManager');

  @override
  StateStatus get isSucceedGetManager {
    _$isSucceedGetManagerAtom.reportRead();
    return super.isSucceedGetManager;
  }

  @override
  set isSucceedGetManager(StateStatus value) {
    _$isSucceedGetManagerAtom.reportWrite(value, super.isSucceedGetManager, () {
      super.isSucceedGetManager = value;
    });
  }

  final _$isSucceedAddManagerAtom =
      Atom(name: '_GymPanelStore.isSucceedAddManager');

  @override
  StateStatus get isSucceedAddManager {
    _$isSucceedAddManagerAtom.reportRead();
    return super.isSucceedAddManager;
  }

  @override
  set isSucceedAddManager(StateStatus value) {
    _$isSucceedAddManagerAtom.reportWrite(value, super.isSucceedAddManager, () {
      super.isSucceedAddManager = value;
    });
  }

  final _$isSucceedRemoveManagerAtom =
      Atom(name: '_GymPanelStore.isSucceedRemoveManager');

  @override
  StateStatus get isSucceedRemoveManager {
    _$isSucceedRemoveManagerAtom.reportRead();
    return super.isSucceedRemoveManager;
  }

  @override
  set isSucceedRemoveManager(StateStatus value) {
    _$isSucceedRemoveManagerAtom
        .reportWrite(value, super.isSucceedRemoveManager, () {
      super.isSucceedRemoveManager = value;
    });
  }

  final _$managersAtom = Atom(name: '_GymPanelStore.managers');

  @override
  List<String> get managers {
    _$managersAtom.reportRead();
    return super.managers;
  }

  @override
  set managers(List<String> value) {
    _$managersAtom.reportWrite(value, super.managers, () {
      super.managers = value;
    });
  }

  final _$getTrainers4GymPanelAsyncAction =
      AsyncAction('_GymPanelStore.getTrainers4GymPanel');

  @override
  Future<void> getTrainers4GymPanel() {
    return _$getTrainers4GymPanelAsyncAction
        .run(() => super.getTrainers4GymPanel());
  }

  final _$addNewTrainer4GymPanelAsyncAction =
      AsyncAction('_GymPanelStore.addNewTrainer4GymPanel');

  @override
  Future<void> addNewTrainer4GymPanel(GymPanelTrainerRequestModel newTrainer) {
    return _$addNewTrainer4GymPanelAsyncAction
        .run(() => super.addNewTrainer4GymPanel(newTrainer));
  }

  final _$removeTrainer4GymPanelAsyncAction =
      AsyncAction('_GymPanelStore.removeTrainer4GymPanel');

  @override
  Future<void> removeTrainer4GymPanel(
      GymPanelTrainerRequestModel removeTrainer) {
    return _$removeTrainer4GymPanelAsyncAction
        .run(() => super.removeTrainer4GymPanel(removeTrainer));
  }

  final _$getManagers4GymPanelAsyncAction =
      AsyncAction('_GymPanelStore.getManagers4GymPanel');

  @override
  Future<void> getManagers4GymPanel() {
    return _$getManagers4GymPanelAsyncAction
        .run(() => super.getManagers4GymPanel());
  }

  final _$addNewManager4GymPanelAsyncAction =
      AsyncAction('_GymPanelStore.addNewManager4GymPanel');

  @override
  Future<void> addNewManager4GymPanel(GymPanelManagerRequestModel newManager) {
    return _$addNewManager4GymPanelAsyncAction
        .run(() => super.addNewManager4GymPanel(newManager));
  }

  final _$removeManager4GymPanelAsyncAction =
      AsyncAction('_GymPanelStore.removeManager4GymPanel');

  @override
  Future<void> removeManager4GymPanel(GymPanelManagerRequestModel newManager) {
    return _$removeManager4GymPanelAsyncAction
        .run(() => super.removeManager4GymPanel(newManager));
  }

  final _$_GymPanelStoreActionController =
      ActionController(name: '_GymPanelStore');

  @override
  void resetTrainers() {
    final _$actionInfo = _$_GymPanelStoreActionController.startAction(
        name: '_GymPanelStore.resetTrainers');
    try {
      return super.resetTrainers();
    } finally {
      _$_GymPanelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetManagers() {
    final _$actionInfo = _$_GymPanelStoreActionController.startAction(
        name: '_GymPanelStore.resetManagers');
    try {
      return super.resetManagers();
    } finally {
      _$_GymPanelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
isSucceedGetTrainer: ${isSucceedGetTrainer},
isSucceedAddTrainer: ${isSucceedAddTrainer},
isSucceedRemoveTrainer: ${isSucceedRemoveTrainer},
trainers: ${trainers},
isSucceedGetManager: ${isSucceedGetManager},
isSucceedAddManager: ${isSucceedAddManager},
isSucceedRemoveManager: ${isSucceedRemoveManager},
managers: ${managers}
    ''';
  }
}
