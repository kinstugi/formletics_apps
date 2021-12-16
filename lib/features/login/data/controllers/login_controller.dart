import 'package:formletics/features/login/data/models/gym_register_model.dart';
import 'package:formletics/features/login/data/models/post_register_request_model.dart';
import 'package:formletics/features/login/data/models/trainer_register_model.dart';
import 'package:injectable/injectable.dart';
import 'package:data_channel/data_channel.dart';
import 'package:formletics/features/login/data/models/authentication_model.dart';
import 'package:formletics/features/login/data/models/post_login_request_model.dart';
import 'package:formletics/features/login/data/models/post_login_response_model.dart';
import 'package:formletics/features/login/data/repositories/login_repository.dart';

@lazySingleton
class LoginController {
  final LoginRepository _loginRepository;

  LoginController(this._loginRepository);

  Future<DC<Exception, PostLoginResponseModel>> postLogin(
    PostLoginRequestModel params,
  ) async {
    final _postLoginData = await _loginRepository.postLogin(params);

    if (_postLoginData.hasError || _postLoginData.data?.token == null) {
      return DC.error(
        _postLoginData.error,
      );
    }

    final _localCacheData = await _loginRepository.setDeviceAuthenticationCache(
      AuthenticationModel(token: _postLoginData.data?.token),
    );

    if (_localCacheData.hasError) {
      return DC.error(
        _localCacheData.error,
      );
    }

    //check if user is trainer
    _loginRepository
        .checkIsUserTrainer(_localCacheData.data.token)
        .then((value) => value)
        .then((value) => _loginRepository.setIsUserTrainer(value))
        .catchError((err) {
      print(err);
    });

    return DC.data(
      _postLoginData.data,
    );
  }

  Future<DC<Exception, PostRegisterRequestModel>> postRegister(
    PostRegisterRequestModel params,
  ) async {
    final _postLoginData = await _loginRepository.postRegister(params);

    return DC.data(
      _postLoginData.data,
    );
  }

  Future<dynamic> postTrainerRegister(
    TrainerRegisterModel params,
  ) async {
    final _postLoginData = await _loginRepository.postTrainerRegister(params);
    return _postLoginData;
  }

  Future<Map<String, dynamic>> postGymRegister(GymRegisterModel params) async {
    final _postLoginData = await _loginRepository.postGymRegister(params);
    return _postLoginData;
  }

  // todo init -> fetch token from url -> validate -> refresh
  Future<DC<Exception, AuthenticationModel>> getAuthenticationData() async {
    return _loginRepository.getAuthenticationData();
  }

  Future<DC<Exception, AuthenticationModel>>
      getDeviceAuthenticationData() async {
    return _loginRepository.getDeviceAuthenticationData();
  }

  Future<DC<Exception, bool>> logout() async {
    return _loginRepository.deleteDeviceAuthenticationCache();
  }

  Future<DC<Exception, bool>> getIsTrainer() async {
    return _loginRepository.checkIsUserTrainerLocally();
  }
}
