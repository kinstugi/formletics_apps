import 'package:formletics/common/api_client/api_client.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/features/tabs/gym/data/models/gyms_list_card_model.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_list_card_model.dart';
import 'package:formletics/utils/alerts/alerts.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'search_store.g.dart';

@lazySingleton
class SearchStore extends _TodoStoreBase with _$SearchStore {
  @override
  ApiClient apiClient;

  @override
  Alerts alerts;


  SearchStore(
      this.apiClient,
      this.alerts,
      ) : super(alerts);
}


abstract class _TodoStoreBase with Store {
  ApiClient apiClient;
  Alerts alerts;

  _TodoStoreBase(this.alerts);

  @observable
  StateStatus isSucceedAllGyms = StateStatus.INITIAL;

  @observable
  StateStatus isSucceedAllTrainers = StateStatus.INITIAL;

  @observable
  StateStatus isSucceedAllModels = StateStatus.INITIAL;

  @observable
  List<GymListCardModel> gyms = [];

  @observable
  List<TrainerListCardModel> trainers = [];

  @observable
  String searchQuery = "";

  @observable
  List<GymListCardModel> gymSearchResults = [];

  @observable
  List<TrainerListCardModel> trainerSearchResults = [];

  @action
  Future<void> getAllGyms() async{
    isSucceedAllGyms = StateStatus.LOADING;
    final responseData = await apiClient.searchApiGetAllGyms();
    responseData.pick(
      onData: (data) {
        if (data != null) {
          gyms = data;
        }
        isSucceedAllGyms = StateStatus.SUCCESS;
      },
    );
  }


  @action
  Future<void> getAllTrainers() async{
    isSucceedAllTrainers = StateStatus.LOADING;
    final responseData = await apiClient.searchApiGetAllTrainers();
    responseData.pick(
      onData: (data) {
        if (data != null) {
          trainers = data;
        }
        isSucceedAllTrainers = StateStatus.SUCCESS;
      },
    );
  }


  @action
  void searchGyms(String query) {
    final String q = query.toLowerCase();

    gymSearchResults = gyms.where((element){
      return element.name.toLowerCase().contains(q);
    }).toList();
  }

  @action
  void searchTrainers(String query){
    final String q = query.toLowerCase();

    trainerSearchResults = trainers.where((element){
      return element.name.toLowerCase().contains(q);
    }).toList();
  }

}