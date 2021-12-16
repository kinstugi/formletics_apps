// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoStore on _TodoStoreBase, Store {
  final _$titleAtom = Atom(name: '_TodoStoreBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$todoResponseAtom = Atom(name: '_TodoStoreBase.todoResponse');

  @override
  TodoResponseModel get todoResponse {
    _$todoResponseAtom.reportRead();
    return super.todoResponse;
  }

  @override
  set todoResponse(TodoResponseModel value) {
    _$todoResponseAtom.reportWrite(value, super.todoResponse, () {
      super.todoResponse = value;
    });
  }

  final _$isSucceedAtom = Atom(name: '_TodoStoreBase.isSucceed');

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

  final _$todoListAtom = Atom(name: '_TodoStoreBase.todoList');

  @override
  List<TodoResponseModel> get todoList {
    _$todoListAtom.reportRead();
    return super.todoList;
  }

  @override
  set todoList(List<TodoResponseModel> value) {
    _$todoListAtom.reportWrite(value, super.todoList, () {
      super.todoList = value;
    });
  }

  final _$isSucceedTodoListAtom =
      Atom(name: '_TodoStoreBase.isSucceedTodoList');

  @override
  StateStatus get isSucceedTodoList {
    _$isSucceedTodoListAtom.reportRead();
    return super.isSucceedTodoList;
  }

  @override
  set isSucceedTodoList(StateStatus value) {
    _$isSucceedTodoListAtom.reportWrite(value, super.isSucceedTodoList, () {
      super.isSucceedTodoList = value;
    });
  }

  final _$userListAtom = Atom(name: '_TodoStoreBase.userList');

  @override
  List<UserResponseModel> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(List<UserResponseModel> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  final _$isSucceedUserListAtom =
      Atom(name: '_TodoStoreBase.isSucceedUserList');

  @override
  StateStatus get isSucceedUserList {
    _$isSucceedUserListAtom.reportRead();
    return super.isSucceedUserList;
  }

  @override
  set isSucceedUserList(StateStatus value) {
    _$isSucceedUserListAtom.reportWrite(value, super.isSucceedUserList, () {
      super.isSucceedUserList = value;
    });
  }

  final _$isSucceedUserDetailAtom =
      Atom(name: '_TodoStoreBase.isSucceedUserDetail');

  @override
  StateStatus get isSucceedUserDetail {
    _$isSucceedUserDetailAtom.reportRead();
    return super.isSucceedUserDetail;
  }

  @override
  set isSucceedUserDetail(StateStatus value) {
    _$isSucceedUserDetailAtom.reportWrite(value, super.isSucceedUserDetail, () {
      super.isSucceedUserDetail = value;
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

  final _$getUserDetailAsyncAction =
      AsyncAction('_TodoStoreBase.getUserDetail');

  @override
  Future<void> getUserDetail() {
    return _$getUserDetailAsyncAction.run(() => super.getUserDetail());
  }

  @override
  String toString() {
    return '''
title: ${title},
todoResponse: ${todoResponse},
isSucceed: ${isSucceed},
todoList: ${todoList},
isSucceedTodoList: ${isSucceedTodoList},
userList: ${userList},
isSucceedUserList: ${isSucceedUserList},
isSucceedUserDetail: ${isSucceedUserDetail},
errorMessage: ${errorMessage}
    ''';
  }
}
