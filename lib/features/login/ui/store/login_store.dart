import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/features/login/data/models/gym_register_model.dart';
import 'package:formletics/features/login/data/models/post_register_request_model.dart';
import 'package:formletics/features/login/data/models/trainer_register_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/common/exceptions/exceptions.dart';
import 'package:formletics/common/models/route_redirect_model.dart';
import 'package:formletics/constants/errors.dart';
import 'package:formletics/features/login/data/controllers/login_controller.dart';
import 'package:formletics/features/login/data/models/post_login_request_model.dart';
import 'package:formletics/common/helpers/navigation_helper.dart';
import 'package:formletics/utils/alerts/alerts_model.dart';
import 'package:formletics/utils/alerts/alerts.dart';

part 'login_store.g.dart';

@lazySingleton
class LoginStore extends _LoginStoreBase with _$LoginStore {
  @override
  LoginController loginController;

  @override
  Alerts alerts;

  LoginStore(
    this.loginController,
    this.alerts,
  ) : super(loginController, alerts);
}

abstract class _LoginStoreBase with Store {
  LoginController loginController;

  Alerts alerts;

  _LoginStoreBase(this.loginController, this.alerts);

  @observable
  StateStatus isLoggedInStatus = StateStatus.INITIAL;

  @observable
  StateStatus isRegisterInStatus = StateStatus.INITIAL;

  @observable
  bool isLoggedIn = false;

  @observable
  String errorMessage;

  @observable
  bool isTrainer = false;

  @action
  Future<void> doLogin(
    BuildContext context,
    PostLoginRequestModel params, {
    RouteRedirectModel redirectOnLogin,
  }) async {
    isLoggedInStatus = StateStatus.LOADING;
    final loginData = await loginController.postLogin(params);
    isLoggedInStatus = StateStatus.SUCCESS;

    loginData.pick(
      onError: (error) {
        isLoggedIn = false;

        if (error is UnauthenticatedException) {
          alerts.setAlert(context, Errors.INVALID_AUTHENTICATION_MESSAGE);

          return;
        }

        alerts.setException(context, error);
      },
      onData: (data) {
        if (!data.isAuthenticated) {
          isLoggedIn = false;

          return;
        }

        if (redirectOnLogin?.routeName != null) {
          navigateToRouteAndReplace(
            context,
            redirectOnLogin.routeName,
            routeArgs: redirectOnLogin.arguments,
          );
        } else {
          popCurrentRoute(context);
          navigateToHome(context); // TODO pop and replace with home
          isLoggedIn = true;

          alerts.setAlert(
            context,
            'Login was successful',
            type: AlertsTypeEnum.SUCCESS,
          );
        }
        //TODO get userType

        isLoggedIn = true;
      },
      onNoData: () {
        isLoggedIn = false;
      },
    );
  }

  @action
  Future<void> doRegistration(
    BuildContext context,
    PostRegisterRequestModel params, {
    RouteRedirectModel redirectOnRegister,
  }) async {
    isRegisterInStatus = StateStatus.LOADING;
    final loginData = await loginController.postRegister(params);
    isRegisterInStatus = StateStatus.SUCCESS;

    loginData.pick(
      onError: (error) {
        isLoggedIn = false;

        if (error is UnauthenticatedException) {
          alerts.setAlert(context, Errors.INVALID_AUTHENTICATION_MESSAGE);

          return;
        }

        alerts.setException(context, error);
      },
      onData: (data) {
        if (redirectOnRegister?.routeName != null) {
          navigateToRouteAndReplace(
            context,
            redirectOnRegister.routeName,
            routeArgs: redirectOnRegister.arguments,
          );
        } else {
          popCurrentRoute(context);
          navigateToRouteAndReplace(context, Routes.loginScreen);
          alerts.setAlert(
            context,
            'Register was successful',
            type: AlertsTypeEnum.SUCCESS,
          );
        }
      },
    );
  }

  @action
  Future<void> doTrainerRegistration(TrainerRegisterModel params) async {
    isRegisterInStatus = StateStatus.LOADING;
    final loginData = await loginController.postTrainerRegister(params);

    isRegisterInStatus = StateStatus.SUCCESS;

    print(loginData);
  }

  @action
  Future<void> doGymRegistration(GymRegisterModel params) async {
    isRegisterInStatus = StateStatus.LOADING;
    final loginData = await loginController.postGymRegister(params);

    isRegisterInStatus = StateStatus.SUCCESS;

    print(loginData);
  }

  @action
  Future<void> getAuthentication(BuildContext context) async {
    isLoggedInStatus = StateStatus.LOADING;
    final loginData = await loginController.getAuthenticationData();
    isLoggedInStatus = StateStatus.SUCCESS;

    loginData.pick(
      onError: (error) {
        isLoggedIn = false;

        if (error is UnauthenticatedException) {
          logout(context, redirectToHome: false);
        }
      },
      onData: (data) {
        if (data.isAuthenticated) {
          canPopCurrentRoute(context);

          isLoggedIn = true;

          return;
        }

        isLoggedIn = false;
      },
      onNoData: () {
        isLoggedIn = false;
      },
    );
  }

  @action
  Future<void> isUserAuthenticated(BuildContext context) async {
    final loginData = await loginController.getAuthenticationData();

    loginData.pick(
      onData: (data){
        print(">>>>>>>>>>>>>>>>>>");
        print(data.token);
        print(">>>>>>>>>>>>>>>>>>");
      },
    );
  }

  @action
  Future<void> logout(BuildContext context, {bool redirectToHome}) async {
    final _redirectToHome = redirectToHome ?? true;

    final logoutData = await loginController.logout();

    logoutData.pick(
      onError: (error) {
        if (error is! CacheException) {
          isLoggedIn = false;
        }

        alerts.setException(context, error);
      },
      onData: (data) {
        if (_redirectToHome) {
          navigateToHome(context);
        }

        isLoggedIn = false;
      },
      onNoData: () {
        isLoggedIn = false;
      },
    );
  }

  @action
  Future<void> checkIsUserTrainer() async {
    final logoutData = await loginController.getIsTrainer();

    logoutData.pick(
      onError: (error) {
        isTrainer = false;
      },
      onData: (data) {
        isTrainer = data;
      },
      onNoData: () {
        isTrainer = false;
      },
    );
  }
}
