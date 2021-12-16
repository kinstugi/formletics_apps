import 'package:data_channel/data_channel.dart';
import 'package:dio/dio.dart';
import 'package:formletics/features/apitest/data/data_source/todo_data_source.dart';
import 'package:formletics/features/apitest/data/models/user_detail_response_model.dart';
import 'package:formletics/features/location/data/data_sources/location_data_source.dart';
import 'package:formletics/features/location/data/models/location_response_model.dart';
import 'package:formletics/features/panels/gym_panel/data/data_sources/gym_panel_data_sources.dart';
import 'package:formletics/features/panels/gym_panel/data/models/manager/request/gym_panel_manager_request_model.dart';
import 'package:formletics/features/panels/gym_panel/data/models/manager/response/gym_panel_add_manager_response_model.dart';
import 'package:formletics/features/panels/gym_panel/data/models/manager/response/gym_panel_manager_list_response_model.dart';
import 'package:formletics/features/panels/gym_panel/data/models/trainer/request/gym_panel_trainer_request_model.dart';
import 'package:formletics/features/panels/gym_panel/data/models/trainer/response/gym_panel_add_trainer_response_model.dart';
import 'package:formletics/features/panels/gym_panel/data/models/trainer/response/gym_panel_trainer_list_response_model.dart';
import 'package:formletics/features/panels/trainer_panel/data/data_sources/trainer_panel_data_sources.dart';
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

import 'package:formletics/features/payment/data/data_sources/payment_data_source.dart';
import 'package:formletics/features/payment/data/data_sources/payment_pay_source.dart';
import 'package:formletics/features/payment/data/models/basket_add_request_model.dart';
import 'package:formletics/features/payment/data/models/basket_add_response_model.dart';
import 'package:formletics/features/payment/data/models/basket_change_quantity_request_model.dart';
import 'package:formletics/features/payment/data/models/basket_product_model.dart';
import 'package:formletics/features/payment/data/models/basket_response_model.dart';
import 'package:formletics/features/payment/data/models/payment_3d_request_model.dart';
import 'package:formletics/features/payment/data/models/payment_3d_response_model.dart';
import 'package:formletics/features/search/data/data_source/search_data_source.dart';
import 'package:formletics/features/search/data/models/search_response_model.dart';
import 'package:formletics/features/tabs/dashboard/data/data_sources/dashboard_data_source.dart';
import 'package:formletics/features/tabs/dashboard/data/models/top_highlights_model.dart';
import 'package:formletics/features/tabs/gym/data/data_sources/gym_data_source.dart';
import 'package:formletics/features/tabs/gym/data/models/gym_detail_response_model.dart';
import 'package:formletics/features/tabs/gym/data/models/gym_list_response_model.dart';
import 'package:formletics/features/tabs/gym/data/models/gyms_list_card_model.dart';
import 'package:formletics/features/tabs/routine/data/data_sources/routine_data_source.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_list_model.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_service_list.dart';
import 'package:formletics/features/tabs/routine/data/models/service_response_model.dart';
import 'package:formletics/features/tabs/trainer/data/data_sources/trainer_data_source.dart';
// import 'package:formletics/features/tabs/trainer/data/models/trainer_cut_response_model.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_detail_response_model.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_list_card_model.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_list_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:formletics/common/api_client/api_errors/api_error_message_error.dart';
import 'package:formletics/common/api_client/api_errors/bad_network_api_error.dart';
import 'package:formletics/common/api_client/api_errors/internal_server_api_error.dart';
import 'package:formletics/common/api_client/api_errors/unauthorized_api_error.dart';
//import 'package:formletics/common/api_client/interceptors/api_error_message_interceptor.dart';
import 'package:formletics/common/api_client/interceptors/auth_interceptor.dart';
import 'package:formletics/common/api_client/interceptors/bad_network_error_interceptor.dart';
import 'package:formletics/common/api_client/interceptors/internal_server_error_interceptor.dart';
import 'package:formletics/common/api_client/interceptors/unauthorized_interceptor.dart';
import 'package:formletics/common/exceptions/exceptions.dart';
import 'package:formletics/constants/env.dart';
import '../../features/panels/trainer_panel/data/models/sportsman/response/progress_photo_response_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@lazySingleton
class ApiClient {
  final Dio dio;
  /* Tabs */
  LocationAPISource locationAPISource;
  TrainerAPISource trainerAPISource;
  GymAPISource gymAPISource;
  RoutineAPISource routineAPISource;
  PaymentAPISource paymentAPISource;
  PaymentAPI3DSource paymentAPI3DSource;
  DashboardApiSource dashboardApiSource;
  SearchDataSource searchDataApiSource;

  TodoAPISource todoAPISource;

  /* Panel */
  TrainerPanelAPISource trainerPanelAPISource;
  GymPanelAPISource gymPanelAPISource;

  ApiClient(this.dio) {
    dio.options.baseUrl = Env.data.apiBaseUrl;
    dio.options.connectTimeout = const Duration(minutes: 3).inMilliseconds;
    dio.options.receiveTimeout = const Duration(minutes: 3).inMilliseconds;
    dio.interceptors.add(BadNetworkErrorInterceptor());
    dio.interceptors.add(InternalServerErrorInterceptor());
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(UnauthorizedInterceptor());
    //dio.interceptors.add(ApiErrorMessageInterceptor());

    if (Env.data.debugApiClient) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        //responseBody: true,
        //error: true,
        //compact: true,
      ));
    }

    /* Tabs */
    locationAPISource = LocationAPISource(dio);
    trainerAPISource = TrainerAPISource(dio);
    gymAPISource = GymAPISource(dio);
    routineAPISource = RoutineAPISource(dio);
    paymentAPISource = PaymentAPISource(dio);
    paymentAPI3DSource = PaymentAPI3DSource(dio);
    dashboardApiSource = DashboardApiSource(dio);
    searchDataApiSource = SearchDataSource(dio);

    /* Panels */
    todoAPISource = TodoAPISource(dio);
    trainerPanelAPISource = TrainerPanelAPISource(dio);
    gymPanelAPISource = GymPanelAPISource(dio);
  }
/* Buraya apiler gelecek. */

  // İlk Gerçek API zaaaaa xDé List API SOURCE

  Future<DC<Exception, UserDetailResponseModel>> getUserDetail() async {
    try {
      final userDetailResponse = await todoAPISource.getUserDetail();
      return DC.data(userDetailResponse);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  /* --- Shared: Location APIs --- */

  // Get İl via GET
  Future<DC<Exception, List<LocationResponseModel>>> getIl() async {
    try {
      final data = await locationAPISource.getIl();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Get İlçe via GET (w/ Path Parameter)
  Future<DC<Exception, List<LocationResponseModel>>> getIlce(int il_id) async {
    try {
      final data = await locationAPISource.getIlce(il_id);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Get Semt via GET (w/ Path Parameter)
  Future<DC<Exception, List<LocationResponseModel>>> getSemt(
      int ilce_id) async {
    try {
      final data = await locationAPISource.getSemt(ilce_id);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Get Mahalle via GET (w/ Path Parameter)
  Future<DC<Exception, List<LocationResponseModel>>> getMahalle(
      int semt_id) async {
    try {
      final data = await locationAPISource.getMahalle(semt_id);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  /* search page*/
  Future<DC<Exception, SearchResponseModel>> searchApiDirectly(
      String query) async {
    try {
      final data = await searchDataApiSource.searchApi(query);
      return DC.data(data);
    } on Exception catch (error) {
      return DC.error(error);
    }
  }

  Future<DC<Exception, List<GymListCardModel>>> searchApiGetAllGyms() async {
    try {
      final data = await searchDataApiSource.getGyms();
      return DC.data(data);
    } on Exception catch (error) {
      return DC.error(error);
    }
  }

  Future<DC<Exception, List<TrainerListCardModel>>>
      searchApiGetAllTrainers() async {
    try {
      final data = await searchDataApiSource.getTrainers();
      return DC.data(data);
    } on Exception catch (error) {
      return DC.error(error);
    }
  }

  /* -- Tabs: Dashboard --*/

  //get dashboard highlights
  Future<DC<Exception, List<TopHighlightModel>>>
      getDashboardTopHighlights() async {
    try {
      final data = await dashboardApiSource.getTopHighlights();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  /* --- Tabs: Trainer --- */

  // Get Trainers via GET
  Future<DC<Exception, TrainerListResponseModel>> getAllTrainers() async {
    try {
      final data = await trainerAPISource.getAllTrainers();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Get Trainers via GET

  Future<DC<Exception, List<TrainerListCardModel>>>
      getAllFeaturedTrainers() async {
    try {
      final data = await trainerAPISource.getAllFeaturedTrainers();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  Future<DC<Exception, List<TrainerListCardModel>>>
      getAllTrainersHighlight() async {
    try {
      final data = await trainerAPISource.getAllTrainersHighlight();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Get Trainers per Page via GET (w/ Path Parameter)
  Future<DC<Exception, TrainerListResponseModel>> getAllTrainersByPage(
      String page) async {
    try {
      final data = await trainerAPISource.getAllTrainersByPage(page);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Get Trainer Detail via GET (w/ Path Parameter)
  Future<DC<Exception, TrainerDetailResponseModel>> getTrainerDetail(
      int trainerId) async {
    try {
      final data = await trainerAPISource.getTrainerDetail(trainerId);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  /* --- Tabs: GYMs --- */

  // Get All Gyms via GET
  Future<DC<Exception, GymListResponseModel>> getAllGyms() async {
    try {
      final data = await gymAPISource.getAllGyms();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Get Gyms per page via GET (w/ Path Parameter)
  Future<DC<Exception, GymListResponseModel>> getAllGymsByPage(
      String page) async {
    try {
      final data = await gymAPISource.getAllGymsByPage(page);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Get Gym Detail via GET (w/ Path Parameter)
  Future<DC<Exception, GymDetailResponseModel>> getGymDetail(int gymId) async {
    try {
      final data = await gymAPISource.getGymDetail(gymId);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  //TODO this is the code I added
  // Get Gym Featured via GET
  Future<DC<Exception, List<GymListCardModel>>> getGymFeatured() async {
    try {
      final data = await gymAPISource.getGymFeatured();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Get gyms in IL
  Future<DC<Exception, List<GymListCardModel>>> getGymsByIl(int il) async {
    try {
      final data = await gymAPISource.getGymsByIl(il);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Get gyms in Ilce
  Future<DC<Exception, List<GymListCardModel>>> getGymsByIlce(int ilce) async {
    try {
      final data = await gymAPISource.getGymsByIlce(ilce);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Get gyms in Semt
  Future<DC<Exception, List<GymListCardModel>>> getGymsBySemt(int semt) async {
    try {
      final data = await gymAPISource.getGymsBySemt(semt);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Get gyms in Mahalle
  Future<DC<Exception, List<GymListCardModel>>> getGymsByMahalle(int mh) async {
    try {
      final data = await gymAPISource.getGymsByMahalle(mh);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  /* --- Tabs: Routine APIs --- */

  // Get Users/My Trainers via GET
  Future<DC<Exception, List<RoutineListResponseModel>>> getMyTrainers() async {
    try {
      final data = await routineAPISource.getMyTrainers();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Get User's Services By Selected Trainer via via GET (w/ Path Parameter)
  Future<DC<Exception, List<RoutineServiceListResponseModel>>> getMyServices(
      int trainerId) async {
    try {
      final data = await routineAPISource.getMyServices(trainerId);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  Future<DC<Exception, List<ServiceResponseModel>>> fetchMyServices() async {
    try {
      final data = await routineAPISource.fetchSportsmanServices();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(e);
    }
  }

  /* --- PAYMENT APIs --- */

  // Get User's Basket for all pages via GET
  Future<DC<Exception, List<BasketResponseModel>>> getBasket() async {
    try {
      final data = await paymentAPISource.getBasket();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Change Quantity of Product via PATCH (w/ Parameter)
  Future<DC<Exception, BasketProductModel>> patchChangeQuantity(
      int productId, BasketChangeQuantityRequestModel count) async {
    try {
      final data = await paymentAPISource.patchChangeQuantity(productId, count);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Remove Product from Basket via DELETE (w/ Path Parameter)
  Future<DC<Exception, void>> removeProductBasket(int productId) async {
    try {
      final data = await paymentAPISource.removeProductBasket(productId);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Remove Service from Basket via DELETE (w/ Path Parameter)
  Future<DC<Exception, void>> removeServiceBasket(int serviceId) async {
    try {
      final data = await paymentAPISource.removeServiceBasket(serviceId);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Add Service to Basket via POST (w/ Body Parameter)
  Future<DC<Exception, BasketAddResponseModel>> addBasket(
      BasketAddRequestModel basket) async {
    try {
      final data = await paymentAPISource.addBasket(basket);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  Future<DC<Exception, Payment3DResponseModel>> makePayment(
      Payment3DRequestModel payment) async {
    try {
      final data = await paymentAPI3DSource.makePayment(payment);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(e);
    }
  }

  /* --- Panels: Trainer Panel APIs --- */

  /* Services */

  // Get Services via GET
  Future<DC<Exception, List<TrainerPanelServiceResponseModel>>>
      getServices4TrainerPanel() async {
    try {
      final data = await trainerPanelAPISource.getServices4TrainerPanel();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Add Services for Create Service via POST (w/ Body Parameter)
  Future<DC<Exception, TrainerPanelServiceResponseModel>>
      postService4TrainerPanel(TrainerPanelServiceRequestModel service) async {
    try {
      final data =
          await trainerPanelAPISource.postService4TrainerPanel(service);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  Future<DC<Exception, List<SportsmanChatResponseModel>>>
      fetchTrainerStudentChat() async {
    try {
      final data = await trainerPanelAPISource.getTrainerSportsmanChat();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(e);
    }
  }

  Future<DC<Exception, List<SportsmanChatResponseModel>>>
      fetchStudentTrainersChat() async {
    try {
      final data = await routineAPISource.getSportsmanTrainerChat();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(e);
    }
  }

  Future<DC<Exception, TrainerPanelServiceResponseModel>>
      updateService4TrainerPanel(
          TrainerPanelServiceResponseModel service, int id) async {
    try {
      final data =
          await trainerPanelAPISource.updateService4TrainerPanel(service, id);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  //delete service for trainer panel
  Future<DC<Exception, ServiceDeleteResponse>> deleteService4TrainerPanel(
      int serviceId) async {
    try {
      final data =
          await trainerPanelAPISource.deleteService4TrainerPanel(serviceId);
      print(data.message);
      return DC.data(data);
    } on Exception catch (e) {
      print(e);
      print("failed >>>>>>>>>>>>>>>>");
      return DC.error(e);
    }
  }

  /* Approve */

  // Get Sportsmen for Trainer Panel: Aprrove via GET
  Future<DC<Exception, List<TrainerPanelApproveSportmenListResponseModel>>>
      getSportsmen4TrainerPanel() async {
    try {
      final data = await trainerPanelAPISource.getSportsmen4TrainerPanel();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Approve or Reject Sportsman via PUT (w/ Body Parameter)
  Future<DC<Exception, TrainerPanelApproveChangeSportsmanResponseModel>>
      putApproveChangeSportsman4TrainerPanel(int sportsmanId,
          TrainerPanelApproveChangeSportsmanRequestModel status) async {
    try {
      final data = await trainerPanelAPISource
          .putApproveChangeSportsman4TrainerPanel(sportsmanId, status);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  /* Sportsman */

  // Get Need Routines for Trainer via GET
  Future<DC<Exception, List<TrainerPanelSportsmanResponseModel>>>
      getNeedRoutines4TrainePanel() async {
    try {
      final data = await trainerPanelAPISource.getNeedRoutines4TrainePanel();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  Future<DC<Exception, List<ProgressPhotoUploadResponseModel>>>
      fetchProgressPhoto4TrainerPanel(int sportsmanId) async {
    try {
      final data = await trainerPanelAPISource.fetchProgressPhoto(sportsmanId);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Get All Exercises via GET
  Future<DC<Exception, List<TrainerPanelSportsmanNestedExerciseObject>>>
      getAllExercises4TrainerPanel(int groupId) async {
    try {
      final data =
          await trainerPanelAPISource.getAllExercises4TrainerPanel(groupId);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Add New Routine via POST (w/ Body Parameter)
  Future<DC<Exception, TrainerPanelAddRoutineResponseModel>>
      addRoutine4TrainerPanel(
          TrainerPanelAddRoutineRequestModel addRoutine) async {
    try {
      final data =
          await trainerPanelAPISource.addRoutine4TrainerPanel(addRoutine);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  /* --- Panels: Gym Panel APIs --- */

  // Get Trainers via GET
  Future<DC<Exception, List<GymPanelTrainerListResponseModel>>>
      getTrainers4GymPanel() async {
    try {
      final data = await gymPanelAPISource.getTrainers4GymPanel();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Add Trainer via POST (w/ Body Parameter)
  Future<DC<Exception, GymPanelAddTrainerResponseModel>> addNewTrainer4GymPanel(
      GymPanelTrainerRequestModel newTrainer) async {
    try {
      final data = await gymPanelAPISource.addNewTrainer4GymPanel(newTrainer);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Remove Trainer via POST (w/ Body Parameter)
  Future<DC<Exception, GymPanelAddTrainerResponseModel>> removeTrainer4GymPanel(
      GymPanelTrainerRequestModel removeTrainer) async {
    try {
      final data =
          await gymPanelAPISource.removeTrainer4GymPanel(removeTrainer);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Get Managers via GET
  Future<DC<Exception, List<GymPanelManagerListResponseModel>>>
      getManagers4GymPanel() async {
    try {
      final data = await gymPanelAPISource.getManager4GymPanel();
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Add Managers via Post (w/ Body Parameter)
  Future<DC<Exception, GymPanelAddManagerResponseModel>> addNewManager4GymPanel(
      GymPanelManagerRequestModel newManager) async {
    try {
      final data = await gymPanelAPISource.addNewManager4GymPanel(newManager);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  // Remove Managers via POST (w/ Body Parameter)
  Future<DC<Exception, GymPanelAddManagerResponseModel>> removeManager4GymPanel(
      GymPanelManagerRequestModel removeManager) async {
    try {
      final data =
          await gymPanelAPISource.removeManager4GymPanel(removeManager);
      return DC.data(data);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  /* !!! API FINNISSH !!!!*/

  Future<Response> post(
    String path,
    dynamic data,
  ) async {
    try {
      return await dio.post(path, data: data);
    } on BadNetworkApiError {
      throw BadNetworkException();
    } on InternalServerApiError {
      throw InternalServerException();
    } on UnauthorizedApiError {
      throw UnauthenticatedException();
    } on ApiErrorMessageError catch (e) {
      throw ApiErrorMessageException(errorMessage: e.errorMessage);
    } on DioError {
      throw ApiException();
    }
  }

  Future<Response> put(String path, dynamic data) async {
    try {
      return await dio.put(path, data: data);
    } on BadNetworkApiError {
      throw BadNetworkException();
    } on InternalServerApiError {
      throw InternalServerException();
    } on UnauthorizedApiError {
      throw UnauthenticatedException();
    } on ApiErrorMessageError catch (e) {
      throw ApiErrorMessageException(errorMessage: e.errorMessage);
    } on DioError {
      throw ApiException();
    }
  }

  Future<Response> delete(String path) async {
    try {
      return await dio.delete(path);
    } on BadNetworkApiError {
      throw BadNetworkException();
    } on InternalServerApiError {
      throw InternalServerException();
    } on UnauthorizedApiError {
      throw UnauthenticatedException();
    } on ApiErrorMessageError catch (e) {
      throw ApiErrorMessageException(errorMessage: e.errorMessage);
    } on DioError {
      throw ApiException();
    }
  }

  Future<Response> get(String path) async {
    try {
      return await dio.get(path);
    } on BadNetworkApiError {
      throw BadNetworkException();
    } on InternalServerApiError {
      throw InternalServerException();
    } on UnauthorizedApiError {
      throw UnauthenticatedException();
    } on ApiErrorMessageError catch (e) {
      throw ApiErrorMessageException(errorMessage: e.errorMessage);
    } on DioError {
      throw ApiException();
    }
  }
}
