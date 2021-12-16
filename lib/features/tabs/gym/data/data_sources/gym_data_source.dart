import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/cupertino.dart';
import 'package:formletics/features/tabs/gym/data/models/gym_detail_response_model.dart';
import 'package:formletics/features/tabs/gym/data/models/gym_list_response_model.dart';
import 'package:retrofit/retrofit.dart';
import '../models/gyms_list_card_model.dart';
part 'gym_data_source.g.dart';

@RestApi(baseUrl: "")
abstract class GymAPISource {
  factory GymAPISource(Dio dio) = _GymAPISource;

  /*Get All Trainer's API for All Trainers Page*/
  // ignore: prefer_interpolation_to_compose_strings
  @GET("en/api/mobile/gym/list/")
  Future<GymListResponseModel> getAllGyms();

  @GET("en/mobile/api/gym-featured/")
  Future<List<GymListCardModel>> getAllGymsCard();

  @GET("{page}")
  Future<GymListResponseModel> getAllGymsByPage(@Path("page") String page);

  @GET("en/api/mobile/gym/detail/{gymId}/")
  Future<GymDetailResponseModel> getGymDetail(@Path("gymId") int gymId);

  @GET("en/mobile/api/gym-featured/")
  Future<List<GymListCardModel>> getGymFeatured();

  //added new endpoints readers for filter TODO can delete this
  @GET("en/mobile/api/gym-nearby/{il}")
  Future<List<GymListCardModel>> getGymsByIl(@Path("il") int il);

  @GET("en/mobile/api/gym-nearby/ilce/{ilce}")
  Future<List<GymListCardModel>> getGymsByIlce(@Path("ilce") int ilce);

  @GET("en/mobile/api/gym-nearby/ilce/semt/{semt}")
  Future<List<GymListCardModel>> getGymsBySemt(@Path("semt") int semt);

  @GET("en/mobile/api/gym-nearby/ilce/semt/mahalle/{mh}")
  Future<List<GymListCardModel>> getGymsByMahalle(@Path("mh") int mh);

  //better endpoint for filtering

}
