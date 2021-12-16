// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'payment_pay_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PaymentAPI3DSource implements PaymentAPI3DSource {
  _PaymentAPI3DSource(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<Payment3DResponseModel> makePayment(payment) async {
    ArgumentError.checkNotNull(payment, 'payment');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(payment?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'en/mobile/api/payment/pay3D/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Payment3DResponseModel.fromJson(_result.data);
    return value;
  }
}
