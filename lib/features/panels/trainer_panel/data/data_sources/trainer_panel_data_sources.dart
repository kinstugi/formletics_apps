import 'package:dio/dio.dart' hide Headers;
import 'package:formletics/features/panels/trainer_panel/data/models/approve/request/change_sportsman.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/approve/response/approve.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/approve/response/change_sportsman.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/chat/response/chats_model_response.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/service/request/service.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/service/response/service.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/service/response/service_delete_response.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/add_routine.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/exercise_nested_exercise.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/add_routine_response.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/trainer_panel_sportsman_response_model.dart';
import 'package:retrofit/retrofit.dart';
import '../models/sportsman/response/progress_photo_response_model.dart';

part 'trainer_panel_data_sources.g.dart';

@RestApi(baseUrl: "")
abstract class TrainerPanelAPISource {
  factory TrainerPanelAPISource(Dio dio) = _TrainerPanelAPISource;

  /* Service */

  // Get Service
  @GET("en/api/trainer/services/")
  Future<List<TrainerPanelServiceResponseModel>> getServices4TrainerPanel();

  // Add Service
  @POST("en/api/trainer/addService/")
  Future<TrainerPanelServiceResponseModel> postService4TrainerPanel(
      @Body() TrainerPanelServiceRequestModel service);

  //delete service
  @DELETE("en/api/trainer/deleteService/{serviceId}/")
  Future<ServiceDeleteResponse> deleteService4TrainerPanel(
      @Path() int serviceId);

  //update service
  @PUT("en/api/trainer/deleteService/{service}/")
  Future<TrainerPanelServiceResponseModel> updateService4TrainerPanel(
      @Body() TrainerPanelServiceResponseModel serviceId, @Path() int service);

  /* Approve */

  // Get Sportsmen
  @GET("en/api/trainer/sportsmen/")
  Future<List<TrainerPanelApproveSportmenListResponseModel>>
      getSportsmen4TrainerPanel();

  // Approve or Reject Sportsman
  @PUT("en/api/trainer/changeSportsman/{sportmanId}/")
  Future<TrainerPanelApproveChangeSportsmanResponseModel>
      putApproveChangeSportsman4TrainerPanel(@Path("sportmanId") int sportmanId,
          @Body() TrainerPanelApproveChangeSportsmanRequestModel status);

  /* Sportsman */

  // Get Need Routines
  @GET("en/api/trainer/sportsman/needRoutine/")
  Future<List<TrainerPanelSportsmanResponseModel>>
      getNeedRoutines4TrainePanel();

  // Get Need Routines
  @GET("en/api/trainer/sportsman/exercises/{groupId}/")
  Future<List<TrainerPanelSportsmanNestedExerciseObject>>
      getAllExercises4TrainerPanel(@Path("groupId") int groupId);

  // Add New Routine via POST
  @POST("en/api/trainer/addRoutine/")
  Future<TrainerPanelAddRoutineResponseModel> addRoutine4TrainerPanel(
      @Body() TrainerPanelAddRoutineRequestModel addRoutine);

  /* Sportsman */
  @GET("en/api/chat/trainer/sportsmen/")
  Future<List<SportsmanChatResponseModel>> getTrainerSportsmanChat();

  @GET("en/api/trainer/fetch-students-progress/{sportsmanId}/")
  Future<List<ProgressPhotoUploadResponseModel>> fetchProgressPhoto(@Path() int sportsmanId);
}
