import 'package:formletics/common/api_client/api_client.dart';
import 'package:formletics/features/payment/data/models/basket_add_request_model.dart';
// import 'package:formletics/features/tabs/trainer/data/models/trainer_cut_response_model.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_detail_response_model.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_list_card_model.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_list_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/utils/alerts/alerts.dart';

part 'trainer_store.g.dart';

@lazySingleton
class TrainerStore extends _TodoStoreBase with _$TrainerStore {
  @override
  ApiClient apiClient;

  @override
  Alerts alerts;

  TrainerStore(
    this.apiClient,
    this.alerts,
  ) : super(alerts);
}

abstract class _TodoStoreBase with Store {
  ApiClient apiClient;

  Alerts alerts;

  _TodoStoreBase(this.alerts);

  // Trainer List

  @observable
  StateStatus isSucceedAllTrainers = StateStatus.INITIAL;

  //new addition
  @observable
  StateStatus isSucceedAllFeaturedTrainers = StateStatus.INITIAL;

  @observable
  StateStatus isSucceedAllTrainersHighlight = StateStatus.INITIAL;

  @observable
  TrainerListResponseModel allTrainers;

  @observable
  List<TrainerListCardModel> allFeaturedTrainers;

  @observable
  List<TrainerListCardModel> allTrainersHighlight;

  @observable
  String errorMessage;

  @observable
  int count = 0;

  @observable
  String pageLink;

  // Trainer Detail

  @observable
  StateStatus isSucceedTrainerDetails = StateStatus.INITIAL;

  @observable
  TrainerDetailResponseModel detailTrainer;

  @observable
  bool isAddBasket = false;

  @action
  void resetList() {
    count = 0;
    pageLink = null;
    errorMessage = null;
    isSucceedAllTrainers = StateStatus.INITIAL;
    allTrainers = null;
  }

  @action
  void resetDetail() {
    isSucceedTrainerDetails = StateStatus.INITIAL;
    detailTrainer = null;
  }

  // Trainer List

  @action
  Future<void> getAllFeaturedTrainers() async {
    isSucceedAllFeaturedTrainers = StateStatus.LOADING;
    final responseData = await apiClient.getAllFeaturedTrainers();

    print(">>>>>>>>>>>>>>>>>>>>>> trainers featured");
    print(responseData.data);

    responseData.pick(
      onData: (data) {
        if (data != null) {
          allFeaturedTrainers = data;
        }
        isSucceedAllFeaturedTrainers = StateStatus.SUCCESS;
      },
    );
  }

  @action
  Future<void> getAllTrainersHighlight() async {
    isSucceedAllTrainersHighlight = StateStatus.LOADING;
    final responseData = await apiClient.getAllTrainersHighlight();

    print(">>>>>>>>>>>>>>>>>>>>>> trainers highlights");
    print(responseData.data);

    responseData.pick(
      onData: (data) {
        if (data != null) {
          allTrainersHighlight = data;
        }
        isSucceedAllTrainersHighlight = StateStatus.SUCCESS;
      },
    );
  }

  @action
  Future<void> getAllTrainers() async {
    isSucceedAllTrainers = StateStatus.LOADING;
    final responseData = await apiClient.getAllTrainers();
    responseData.pick(
      onData: (data) {
        if (data != null) {
          allTrainers = data;
          count = allTrainers.results.length;
          pageLink = data.next;
        }
        isSucceedAllTrainers = StateStatus.SUCCESS;
      },
    );
  }

  @action
  Future<void> getAllTrainerByPage(String page) async {
    final responseData = await apiClient.getAllTrainersByPage(page);
    responseData.pick(
      onData: (data) {
        if (data != null) {
          allTrainers.results.addAll(data.results);
          count = count + data.results.length;
          pageLink = data.next;
        }
      },
    );
  }

  // Trainer Detail
  @action
  Future<void> getTrainerDetail(int trainerId) async {
    isSucceedTrainerDetails = StateStatus.LOADING;
    final responseData = await apiClient.getTrainerDetail(trainerId);

    print(">>>>>>>>>>>>>>>>>> trainer detail");
    print(responseData.data);

    responseData.pick(
      onData: (data) {
        if (data != null) {
          detailTrainer = data;
        }
        isSucceedTrainerDetails = StateStatus.SUCCESS;
      },
    );
  }

  // Add Service to User's Basket ball
  @action
  Future<void> addBasketFromTrainer(int serviceId, String period) async {
    isAddBasket = false;
    BasketAddNestedServiceModel basketServiceObj =
        BasketAddNestedServiceModel(id: serviceId, period: period);
    List<BasketAddNestedServiceModel> basketListObj = [];
    basketListObj.add(basketServiceObj);
    final BasketAddRequestModel basketRequestObj =
        BasketAddRequestModel(services: basketListObj);
    await apiClient.addBasket(basketRequestObj);
    isAddBasket = true;
  }
}
