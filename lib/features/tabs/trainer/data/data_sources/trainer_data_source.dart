import 'package:dio/dio.dart' hide Headers;
import 'package:formletics/features/tabs/trainer/data/models/trainer_detail_response_model.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_list_card_model.dart';

import 'package:formletics/features/tabs/trainer/data/models/trainer_list_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'trainer_data_source.g.dart';

@RestApi(baseUrl: "")
abstract class TrainerAPISource {
  factory TrainerAPISource(Dio dio) = _TrainerAPISource;

  /*Get All Trainer's API for All Trainers Page*/
  // ignore: prefer_interpolation_to_compose_strings
  @GET("en/api/mobile/trainer/list/")
  Future<TrainerListResponseModel> getAllTrainers();

  @GET("en/mobile/api/trainer-featured/")
  Future<List<TrainerListCardModel>> getAllFeaturedTrainers();

  @GET("en/mobile/api/trainer-highlight/")
  Future<List<TrainerListCardModel>> getAllTrainersHighlight();

  @GET("{page}")
  Future<TrainerListResponseModel> getAllTrainersByPage(
      @Path("page") String page);

  @GET("en/api/mobile/trainer/detail/{trainerId}/")
  Future<TrainerDetailResponseModel> getTrainerDetail(
      @Path("trainerId") int trainerId);
}
