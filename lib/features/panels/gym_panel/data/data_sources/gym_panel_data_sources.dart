import 'package:dio/dio.dart' hide Headers;
import 'package:formletics/features/panels/gym_panel/data/models/manager/request/gym_panel_manager_request_model.dart';
import 'package:formletics/features/panels/gym_panel/data/models/manager/response/gym_panel_add_manager_response_model.dart';
import 'package:formletics/features/panels/gym_panel/data/models/manager/response/gym_panel_manager_list_response_model.dart';
import 'package:formletics/features/panels/gym_panel/data/models/trainer/request/gym_panel_trainer_request_model.dart';
import 'package:formletics/features/panels/gym_panel/data/models/trainer/response/gym_panel_add_trainer_response_model.dart';
import 'package:formletics/features/panels/gym_panel/data/models/trainer/response/gym_panel_trainer_list_response_model.dart';

import 'package:retrofit/retrofit.dart';

part 'gym_panel_data_sources.g.dart';

@RestApi(baseUrl: "")
abstract class GymPanelAPISource {
  factory GymPanelAPISource(Dio dio) = _GymPanelAPISource;

  /* Gym Panel */

  /* Trainers */

  // ignore: prefer_interpolation_to_compose_strings
  @GET("api/gym/trainers/")
  Future<List<GymPanelTrainerListResponseModel>> getTrainers4GymPanel();

  @POST("api/gym/addTrainer/")
  Future<GymPanelAddTrainerResponseModel> addNewTrainer4GymPanel(
      @Body() GymPanelTrainerRequestModel newTrainer);

  @POST("api/gym/removeTrainer/")
  Future<GymPanelAddTrainerResponseModel> removeTrainer4GymPanel(
      @Body() GymPanelTrainerRequestModel removeTrainer);

  /* Managers */

  @GET("api/gym/managers/")
  Future<List<GymPanelManagerListResponseModel>> getManager4GymPanel();

  @POST("api/gym/addManager/")
  Future<GymPanelAddManagerResponseModel> addNewManager4GymPanel(
      @Body() GymPanelManagerRequestModel newManager);

  @POST("api/gym/removeManager/")
  Future<GymPanelAddManagerResponseModel> removeManager4GymPanel(
      @Body() GymPanelManagerRequestModel removeManager);
}
