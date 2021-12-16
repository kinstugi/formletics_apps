// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'gym_panel_data_sources.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GymPanelAPISource implements GymPanelAPISource {
  _GymPanelAPISource(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<GymPanelTrainerListResponseModel>> getTrainers4GymPanel() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('api/gym/trainers/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => GymPanelTrainerListResponseModel.fromJson(
            i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<GymPanelAddTrainerResponseModel> addNewTrainer4GymPanel(
      newTrainer) async {
    ArgumentError.checkNotNull(newTrainer, 'newTrainer');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(newTrainer?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/gym/addTrainer/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GymPanelAddTrainerResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<GymPanelAddTrainerResponseModel> removeTrainer4GymPanel(
      removeTrainer) async {
    ArgumentError.checkNotNull(removeTrainer, 'removeTrainer');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(removeTrainer?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/gym/removeTrainer/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GymPanelAddTrainerResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<GymPanelManagerListResponseModel>> getManager4GymPanel() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('api/gym/managers/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => GymPanelManagerListResponseModel.fromJson(
            i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<GymPanelAddManagerResponseModel> addNewManager4GymPanel(
      newManager) async {
    ArgumentError.checkNotNull(newManager, 'newManager');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(newManager?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/gym/addManager/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GymPanelAddManagerResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<GymPanelAddManagerResponseModel> removeManager4GymPanel(
      removeManager) async {
    ArgumentError.checkNotNull(removeManager, 'removeManager');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(removeManager?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/gym/removeManager/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GymPanelAddManagerResponseModel.fromJson(_result.data);
    return value;
  }
}
