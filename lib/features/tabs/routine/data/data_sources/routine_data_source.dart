import 'package:dio/dio.dart' hide Headers;
import 'package:formletics/features/panels/trainer_panel/data/models/chat/response/chats_model_response.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_list_model.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_service_list.dart';
import 'package:formletics/features/tabs/routine/data/models/service_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'routine_data_source.g.dart';

@RestApi(baseUrl: "")
abstract class RoutineAPISource {
  factory RoutineAPISource(Dio dio) = _RoutineAPISource;

  /*Get All Trainer's API for All Trainers Page*/
  // ignore: prefer_interpolation_to_compose_strings
  @GET("en/api/sportsman/get/")
  Future<List<RoutineListResponseModel>> getMyTrainers();

  @GET("en/api/sportsman/routine/?trainer={trainerId}")
  Future<List<RoutineServiceListResponseModel>> getMyServices(
      @Path("trainerId") int trainerId);

  @GET("en/api/sportsman/fetch-services/")
  Future<List<ServiceResponseModel>> fetchSportsmanServices();

  @GET("en/api/chat/sportsman/trainers/")
  Future<List<SportsmanChatResponseModel>> getSportsmanTrainerChat();
}
