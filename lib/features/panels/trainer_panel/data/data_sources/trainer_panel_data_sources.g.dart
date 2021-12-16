// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'trainer_panel_data_sources.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TrainerPanelAPISource implements TrainerPanelAPISource {
  _TrainerPanelAPISource(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<TrainerPanelServiceResponseModel>>
      getServices4TrainerPanel() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        'en/api/trainer/services/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => TrainerPanelServiceResponseModel.fromJson(
            i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<TrainerPanelServiceResponseModel> postService4TrainerPanel(
      service) async {
    ArgumentError.checkNotNull(service, 'service');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(service?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'en/api/trainer/addService/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TrainerPanelServiceResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<ServiceDeleteResponse> deleteService4TrainerPanel(serviceId) async {
    ArgumentError.checkNotNull(serviceId, 'serviceId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'en/api/trainer/deleteService/$serviceId/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ServiceDeleteResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<TrainerPanelServiceResponseModel> updateService4TrainerPanel(
      serviceId, service) async {
    ArgumentError.checkNotNull(serviceId, 'serviceId');
    ArgumentError.checkNotNull(service, 'service');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(serviceId?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'en/api/trainer/deleteService/$service/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TrainerPanelServiceResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<TrainerPanelApproveSportmenListResponseModel>>
      getSportsmen4TrainerPanel() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        'en/api/trainer/sportsmen/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            TrainerPanelApproveSportmenListResponseModel.fromJson(
                i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<TrainerPanelApproveChangeSportsmanResponseModel>
      putApproveChangeSportsman4TrainerPanel(sportmanId, status) async {
    ArgumentError.checkNotNull(sportmanId, 'sportmanId');
    ArgumentError.checkNotNull(status, 'status');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(status?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'en/api/trainer/changeSportsman/$sportmanId/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value =
        TrainerPanelApproveChangeSportsmanResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<TrainerPanelSportsmanResponseModel>>
      getNeedRoutines4TrainePanel() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        'en/api/trainer/sportsman/needRoutine/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => TrainerPanelSportsmanResponseModel.fromJson(
            i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<TrainerPanelSportsmanNestedExerciseObject>>
      getAllExercises4TrainerPanel(groupId) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        'en/api/trainer/sportsman/exercises/$groupId/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => TrainerPanelSportsmanNestedExerciseObject.fromJson(
            i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<TrainerPanelAddRoutineResponseModel> addRoutine4TrainerPanel(
      addRoutine) async {
    ArgumentError.checkNotNull(addRoutine, 'addRoutine');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addRoutine?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'en/api/trainer/addRoutine/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TrainerPanelAddRoutineResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<SportsmanChatResponseModel>> getTrainerSportsmanChat() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        'en/api/chat/trainer/sportsmen/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            SportsmanChatResponseModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<ProgressPhotoUploadResponseModel>> fetchProgressPhoto(
      sportsmanId) async {
    ArgumentError.checkNotNull(sportsmanId, 'sportsmanId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        'en/api/trainer/fetch-students-progress/$sportsmanId/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => ProgressPhotoUploadResponseModel.fromJson(
            i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
