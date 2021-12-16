import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/top_highlights_model.dart';
part 'dashboard_data_source.g.dart';

// @RestApi(baseUrl: "https://79b5d16f1a9e.ngrok.io") //TODO remove this later
@RestApi(baseUrl: "")
abstract class DashboardApiSource{
  factory DashboardApiSource(Dio dio) = _DashboardApiSource;

  @GET("en/mobile/api/top-highlights/")
  Future<List<TopHighlightModel>> getTopHighlights();
}