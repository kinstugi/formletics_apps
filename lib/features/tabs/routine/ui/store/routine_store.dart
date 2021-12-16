import 'package:formletics/common/api_client/api_client.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/chat/response/chats_model_response.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_list_model.dart';
import 'package:formletics/features/tabs/routine/data/models/routine_service_list.dart';
import 'package:formletics/features/tabs/routine/data/models/service_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/utils/alerts/alerts.dart';

part 'routine_store.g.dart';

@lazySingleton
class RoutineStore extends _RoutineStoreBase with _$RoutineStore {
  @override
  ApiClient apiClient;

  @override
  Alerts alerts;

  RoutineStore(
    this.apiClient,
    this.alerts,
  ) : super(alerts);
}

abstract class _RoutineStoreBase with Store {
  ApiClient apiClient;

  Alerts alerts;

  _RoutineStoreBase(this.alerts);

  // My Trainers

  @observable
  StateStatus isSucceedMyTrainers = StateStatus.INITIAL;

  @observable
  List<RoutineListResponseModel> myTrainers;

  @observable
  List<ServiceResponseModel> sportsmanServices;

  @observable
  String errorMessage;

  // My Services
  @observable
  StateStatus isSucceedMyServices = StateStatus.INITIAL;

  @observable
  StateStatus isSucceedSportsmanServices = StateStatus.INITIAL;

  @observable
  List<RoutineServiceListResponseModel> myServices;

  @observable
  List<SportsmanChatResponseModel> sportsmanChats;

  @observable
  StateStatus isSucceedSportsmanChats = StateStatus.INITIAL;

  @action
  void resetMyTrainers() {
    errorMessage = null;
    isSucceedMyTrainers = StateStatus.INITIAL;
    myTrainers = null;
  }

  @action
  void resetService() {
    isSucceedMyServices = StateStatus.INITIAL;
    myServices = null;
  }

  // My Trainers List for Routine Home Page

  @action
  Future<void> getMyTrainers() async {
    isSucceedMyTrainers = StateStatus.LOADING;
    final responseData = await apiClient.getMyTrainers();
    responseData.pick(
      onData: (data) {
        if (data != null) {
          myTrainers = data;
        }
        isSucceedMyTrainers = StateStatus.SUCCESS;
      },
    );
  }

  // My Services List for Routine 1 Page: Services
  @action
  Future<void> getMyServices(int trainerId) async {
    isSucceedMyServices = StateStatus.LOADING;
    final responseData = await apiClient.getMyServices(trainerId);
    responseData.pick(
      onData: (data) {
        if (data != null) {
          myServices = data;
        }
        isSucceedMyServices = StateStatus.SUCCESS;
      },
    );
  }

  // My Services List for Routine 1 Page: Services
  @action
  Future<void> fetchSportsmanServices() async {
    isSucceedSportsmanServices = StateStatus.LOADING;
    final responseData = await apiClient.fetchMyServices();
    responseData.pick(
      onData: (data) {
        if (data != null) {
          sportsmanServices = data;
        }
        isSucceedSportsmanServices = StateStatus.SUCCESS;
      },
    );
  }

  //fetchStudentTrainersChat
  @action
  Future<void> fetchSportsmanTrainersChat() async {
    isSucceedSportsmanChats = StateStatus.LOADING;
    final responseData = await apiClient.fetchStudentTrainersChat();
    responseData.pick(
      onData: (data) {
        if (data != null) {
          sportsmanChats = data;
        }
        isSucceedSportsmanChats = StateStatus.SUCCESS;
      },
    );
  }
}
