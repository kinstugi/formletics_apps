// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$isLoggedInStatusAtom = Atom(name: '_LoginStoreBase.isLoggedInStatus');

  @override
  StateStatus get isLoggedInStatus {
    _$isLoggedInStatusAtom.reportRead();
    return super.isLoggedInStatus;
  }

  @override
  set isLoggedInStatus(StateStatus value) {
    _$isLoggedInStatusAtom.reportWrite(value, super.isLoggedInStatus, () {
      super.isLoggedInStatus = value;
    });
  }

  final _$isRegisterInStatusAtom =
      Atom(name: '_LoginStoreBase.isRegisterInStatus');

  @override
  StateStatus get isRegisterInStatus {
    _$isRegisterInStatusAtom.reportRead();
    return super.isRegisterInStatus;
  }

  @override
  set isRegisterInStatus(StateStatus value) {
    _$isRegisterInStatusAtom.reportWrite(value, super.isRegisterInStatus, () {
      super.isRegisterInStatus = value;
    });
  }

  final _$isLoggedInAtom = Atom(name: '_LoginStoreBase.isLoggedIn');

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_LoginStoreBase.errorMessage');

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

  final _$isTrainerAtom = Atom(name: '_LoginStoreBase.isTrainer');

  @override
  bool get isTrainer {
    _$isTrainerAtom.reportRead();
    return super.isTrainer;
  }

  @override
  set isTrainer(bool value) {
    _$isTrainerAtom.reportWrite(value, super.isTrainer, () {
      super.isTrainer = value;
    });
  }

  final _$doLoginAsyncAction = AsyncAction('_LoginStoreBase.doLogin');

  @override
  Future<void> doLogin(BuildContext context, PostLoginRequestModel params,
      {RouteRedirectModel redirectOnLogin}) {
    return _$doLoginAsyncAction.run(
        () => super.doLogin(context, params, redirectOnLogin: redirectOnLogin));
  }

  final _$doRegistrationAsyncAction =
      AsyncAction('_LoginStoreBase.doRegistration');

  @override
  Future<void> doRegistration(
      BuildContext context, PostRegisterRequestModel params,
      {RouteRedirectModel redirectOnRegister}) {
    return _$doRegistrationAsyncAction.run(() => super.doRegistration(
        context, params,
        redirectOnRegister: redirectOnRegister));
  }

  final _$doTrainerRegistrationAsyncAction =
      AsyncAction('_LoginStoreBase.doTrainerRegistration');

  @override
  Future<void> doTrainerRegistration(TrainerRegisterModel params) {
    return _$doTrainerRegistrationAsyncAction
        .run(() => super.doTrainerRegistration(params));
  }

  final _$doGymRegistrationAsyncAction =
      AsyncAction('_LoginStoreBase.doGymRegistration');

  @override
  Future<void> doGymRegistration(GymRegisterModel params) {
    return _$doGymRegistrationAsyncAction
        .run(() => super.doGymRegistration(params));
  }

  final _$getAuthenticationAsyncAction =
      AsyncAction('_LoginStoreBase.getAuthentication');

  @override
  Future<void> getAuthentication(BuildContext context) {
    return _$getAuthenticationAsyncAction
        .run(() => super.getAuthentication(context));
  }

  final _$isUserAuthenticatedAsyncAction =
      AsyncAction('_LoginStoreBase.isUserAuthenticated');

  @override
  Future<void> isUserAuthenticated(BuildContext context) {
    return _$isUserAuthenticatedAsyncAction
        .run(() => super.isUserAuthenticated(context));
  }

  final _$logoutAsyncAction = AsyncAction('_LoginStoreBase.logout');

  @override
  Future<void> logout(BuildContext context, {bool redirectToHome}) {
    return _$logoutAsyncAction
        .run(() => super.logout(context, redirectToHome: redirectToHome));
  }

  final _$checkIsUserTrainerAsyncAction =
      AsyncAction('_LoginStoreBase.checkIsUserTrainer');

  @override
  Future<void> checkIsUserTrainer() {
    return _$checkIsUserTrainerAsyncAction
        .run(() => super.checkIsUserTrainer());
  }

  @override
  String toString() {
    return '''
isLoggedInStatus: ${isLoggedInStatus},
isRegisterInStatus: ${isRegisterInStatus},
isLoggedIn: ${isLoggedIn},
errorMessage: ${errorMessage},
isTrainer: ${isTrainer}
    ''';
  }
}
