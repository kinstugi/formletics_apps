import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:formletics/features/login/data/models/gym_register_model.dart';

import 'package:formletics/features/login/data/models/post_register_request_model.dart';
import 'package:formletics/features/login/data/models/trainer_register_model.dart';
import 'package:injectable/injectable.dart';
import 'package:formletics/common/api_client/api_client.dart';
import 'package:data_channel/data_channel.dart';
import 'package:formletics/features/login/data/models/user_model.dart';
import 'package:formletics/features/login/data/models/post_login_request_model.dart';
import 'package:formletics/features/login/data/models/post_login_response_model.dart';
import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
import '../../../../constants/urls.dart';

@lazySingleton
class LoginRemoteDataSource {
  final ApiClient _apiClient;

  LoginRemoteDataSource(this._apiClient);

  Future<DC<Exception, PostLoginResponseModel>> postLogin(
    PostLoginRequestModel params,
  ) async {
    try {
      final response = await _apiClient.post(
        'en/mobile/api/api-token-auth/',
        params,
      );

      return DC.data(
        PostLoginResponseModel.fromJson(response.data as Map<String, dynamic>),
      );
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  Future<DC<Exception, PostRegisterRequestModel>> postRegister(
      PostRegisterRequestModel params) async {
    try {
      final response =
          await _apiClient.post('en/mobile/api/user/register/', params);

      return DC.data(PostRegisterRequestModel.fromJson(
          response.data as Map<String, dynamic>));
    } on Exception catch (e) {
      return DC.error(e);
    }
  }

  Future<DC<Exception, UserModel>> getLogin() async {
    try {
      final response = await _apiClient.get('api/v1/users/getLogin');

      return DC.data(
        UserModel.fromJson(
          response.data as Map<String, dynamic>,
        ),
      );
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  Future<bool> getIsTrainer(String token) async {
    final http.Client _client = http.Client();
    final headers = {"Authorization": "TOKEN $token"};
    final String _baseUrl = UrlConstants.DEV_API_BASE_URL;
    final url = "${_baseUrl}en/mobile/api/user/is_trainer/";

    return _client
        .get(url, headers: headers)
        .then((value) => json.decode(value.body))
        .then((value) {
      print(value);
      return value["is_trainer"] as bool;
    }).catchError((e) => false);
  }

  Future<Map<dynamic, dynamic>> trainerRegister(
      TrainerRegisterModel data) async {
    print(">>>>>>>>>>>>>>><<<<<<<<<>>>>>>>>>>>>>>");

    final _baseUrl = UrlConstants.DEV_API_BASE_URL;
    final url = "${_baseUrl}en/mobile/api/user/trainer/register/";
    final form = await data.formData();

    print(url);

    return Dio().post(url, data: form).then((value) {
      print(value.statusCode);

      return {"ok": "kill"};
    }).catchError((err) {
      return {"error": "$err"};
    });
  }

  Future<Map<String, dynamic>> gymRegister(GymRegisterModel data) async {
    final _baseUrl = UrlConstants.DEV_API_BASE_URL;
    final url = "${_baseUrl}en/mobile/api/user/gym/register/";

    print(">>>>>>********>>><>>>>>>>>>");
    final form = await data.formData();

    return Dio().post(url, data: form).then((value) {
      print("-------------------------");
      final data = json.decode(value.data.toString());
      print("-------------------------");

      if (value.statusCode != 201) {
        throw Exception("${data['message']}");
      }
      return data as Map<String, dynamic>;
    }).catchError((error) {
      return {"error": "$error"};
    });
  }
}
