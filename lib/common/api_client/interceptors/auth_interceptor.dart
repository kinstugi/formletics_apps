import 'package:dio/dio.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/features/login/data/controllers/login_controller.dart';

class AuthInterceptor extends Interceptor {
  LoginController get loginController => getIt<LoginController>();

  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    final authData = await loginController.getDeviceAuthenticationData();

    if (!authData.hasError &&
        authData.hasData &&
        authData.data.isAuthenticated) {
      options.headers['Authorization'] = 'TOKEN ${authData.data.token}';
    }

    return options;
  }
}
