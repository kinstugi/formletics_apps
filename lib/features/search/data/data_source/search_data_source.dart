import 'package:dio/dio.dart';
import 'package:formletics/features/tabs/gym/data/models/gyms_list_card_model.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_list_card_model.dart';
import 'package:retrofit/http.dart';
import '../models/search_response_model.dart';

part 'search_data_source.g.dart';

// @RestApi(baseUrl: "https://79b5d16f1a9e.ngrok.io") //TODO remove this later https://www.formletics.com/
@RestApi(baseUrl: "https://www.formletics.com/")
abstract class SearchDataSource {
  factory SearchDataSource(Dio dio) = _SearchDataSource;

  @GET("mobile/api/all-gyms/")
  Future<List<GymListCardModel>> getGyms();

  @GET("mobile/api/all-trainers/")
  Future<List<TrainerListCardModel>> getTrainers();

  @GET("mobile/api/search/query={query}")
  Future<SearchResponseModel> searchApi(@Path("query") String query);
}