import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:formletics/common/exceptions/exceptions.dart';
import 'package:data_channel/data_channel.dart';
import 'package:formletics/constants/shared_preferences_keys.dart';
import 'package:formletics/features/login/data/models/authentication_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LoginLocalDataSource {
  SharedPreferences sharedPreferences;

  LoginLocalDataSource(this.sharedPreferences);

  Future<DC<Exception, AuthenticationModel>> getAuthenticationData() async {
    try {
      final pref = sharedPreferences;

      final jsonString = pref.getString(SharedPreferencesKeys.AUTH_TOKEN);

      AuthenticationModel _authData;
      Exception _exception;

      if (jsonString != null) {
        _authData = AuthenticationModel.fromJson(
            json.decode(jsonString) as Map<String, dynamic>);
      } else {
        _exception = UnauthenticatedException();
      }

      if (_exception != null) {
        return DC.error(
          _exception,
        );
      }

      return DC.data(
        _authData,
      );
    } on Exception {
      return DC.error(
        CacheException(),
      );
    }
  }

  Future<DC<Exception, AuthenticationModel>> setAuthenticationCache(
    AuthenticationModel authData,
  ) async {
    try {
      final pref = sharedPreferences;

      await pref.setString(
        SharedPreferencesKeys.AUTH_TOKEN,
        json.encode(authData.toJson()),
      );

      return DC.data(
        authData,
      );
    } on Exception {
      return DC.error(
        CacheException(),
      );
    }
  }

  Future<DC<Exception, bool>> deleteAuthenticationCache() async {
    try {
      final pref = sharedPreferences;

      return DC.data(
        await pref.setString(SharedPreferencesKeys.AUTH_TOKEN, null),
      );
    } on Exception {
      return DC.error(
        CacheException(),
      );
    }
  }

  Future<DC<Exception, bool>> setIsUserTrainer(dynamic isTrainer) async {
    try {
      final pref = sharedPreferences;

      return DC.data(
        await pref.setBool("is_user_trainer", isTrainer as bool),
      );
    } on Exception {
      return DC.error(
        CacheException(),
      );
    }
  }

  Future<DC<Exception, bool>> getIsUserTrainer() async {
    try {
      final pref = sharedPreferences;

      return DC.data(
        pref.getBool("is_user_trainer"),
      );
    } on Exception {
      return DC.error(
        CacheException(),
      );
    }
  }
}
