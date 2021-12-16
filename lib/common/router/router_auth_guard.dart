import 'package:auto_route/auto_route.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/features/login/data/controllers/login_controller.dart';

class RouterAuthGuard extends RouteGuard {
  final LoginController _loginController = getIt<LoginController>();

  @override
  Future<bool> canNavigate(
    ExtendedNavigatorState navigator,
    String routeName,
    Object arguments,
  ) async {
    final _deviceAuthenticationData =
        await _loginController.getDeviceAuthenticationData();

    if (_deviceAuthenticationData.data?.isAuthenticated ?? false) {
      return true;
    }

    navigator.push(
      Routes.loginScreen,
      arguments: LoginScreenArguments(
        redirectRouteName: Routes.homeScreen,
        redirectRouteArgs: arguments,
      ),
    );

    return false;
  }
}
