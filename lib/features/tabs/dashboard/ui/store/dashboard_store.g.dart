// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashBoardStore on _TodoStoreBase, Store {
  final _$isSucceedAllTopHighlightsAtom =
      Atom(name: '_TodoStoreBase.isSucceedAllTopHighlights');

  @override
  StateStatus get isSucceedAllTopHighlights {
    _$isSucceedAllTopHighlightsAtom.reportRead();
    return super.isSucceedAllTopHighlights;
  }

  @override
  set isSucceedAllTopHighlights(StateStatus value) {
    _$isSucceedAllTopHighlightsAtom
        .reportWrite(value, super.isSucceedAllTopHighlights, () {
      super.isSucceedAllTopHighlights = value;
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

  final _$topHighlightsAtom = Atom(name: '_TodoStoreBase.topHighlights');

  @override
  List<TopHighlightModel> get topHighlights {
    _$topHighlightsAtom.reportRead();
    return super.topHighlights;
  }

  @override
  set topHighlights(List<TopHighlightModel> value) {
    _$topHighlightsAtom.reportWrite(value, super.topHighlights, () {
      super.topHighlights = value;
    });
  }

  final _$getAllTopHighlightsAsyncAction =
      AsyncAction('_TodoStoreBase.getAllTopHighlights');

  @override
  Future<void> getAllTopHighlights() {
    return _$getAllTopHighlightsAsyncAction
        .run(() => super.getAllTopHighlights());
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
  String toString() {
    return '''
isSucceedAllTopHighlights: ${isSucceedAllTopHighlights},
errorMessage: ${errorMessage},
topHighlights: ${topHighlights}
    ''';
  }
}
