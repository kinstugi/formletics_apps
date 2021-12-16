// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'dashboard_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _DashboardApiSource implements DashboardApiSource {
  _DashboardApiSource(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<TopHighlightModel>> getTopHighlights() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        'en/mobile/api/top-highlights/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            TopHighlightModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
