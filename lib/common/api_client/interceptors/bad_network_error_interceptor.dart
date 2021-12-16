import 'package:dio/dio.dart';
import 'package:formletics/common/api_client/api_errors/bad_network_api_error.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/network/network_info.dart';

class BadNetworkErrorInterceptor extends Interceptor {
  final NetworkInfo _networkInfo = getIt<NetworkInfo>();

  @override
  Future onRequest(RequestOptions options) async {
    return options;
  }

  @override
  Future onError(DioError error) async {
    if (error.response == null && !await _networkInfo.isConnected) {
      return BadNetworkApiError();
    }

    return null;
  }
}
