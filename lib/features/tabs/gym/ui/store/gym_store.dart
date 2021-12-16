import 'package:formletics/common/api_client/api_client.dart';
import 'package:formletics/features/tabs/gym/data/models/gym_detail_response_model.dart';
import 'package:formletics/features/tabs/gym/data/models/gym_list_response_model.dart';
import 'package:formletics/features/tabs/gym/data/models/gyms_list_card_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/utils/alerts/alerts.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'gym_store.g.dart';

@lazySingleton
class GymStore extends _TodoStoreBase with _$GymStore {
  @override
  ApiClient apiClient;

  @override
  Alerts alerts;

  GymStore(
    this.apiClient,
    this.alerts,
  ) : super(alerts);
}

abstract class _TodoStoreBase with Store {
  ApiClient apiClient;
  SharedPreferences _preferences;
  Alerts alerts;

  _TodoStoreBase(this.alerts);

  // Trainer List

  @observable
  StateStatus isSucceedAllGyms = StateStatus.INITIAL;

  @observable
  StateStatus isSucceedGymFeatured= StateStatus.INITIAL;

  @observable
  StateStatus isSucceedFilteredGymList= StateStatus.INITIAL;

  @observable
  StateStatus isSucceedGymNearby= StateStatus.INITIAL;

  @observable
  GymListResponseModel allGyms;

  @observable
  String errorMessage;

  @observable
  int count = 0;

  @observable
  String pageLink;


  // Trainer Detail

  @observable
  StateStatus isSucceedGymDetails = StateStatus.INITIAL;

  @observable
  GymDetailResponseModel detailGym;

  @observable
  List<GymListCardModel> gymFeatured;

  //TODO adding new endpoints
  List<GymListCardModel> gymsByIl;

  List<GymListCardModel> gymsByIlce;

  List<GymListCardModel> gymsBySemt;

  List<GymListCardModel> gymsByMahalle;

  @observable
  List<GymListCardModel> filteredGymList;

  @observable
  List<GymListCardModel> gymsNearby;

  @action
  void resetList() {
    count = 0;
    pageLink = null;
    errorMessage = null;
    isSucceedAllGyms = StateStatus.INITIAL;
    allGyms = null;
  }

  @action
  void resetDetail() {
    isSucceedGymDetails = StateStatus.INITIAL;
    detailGym = null;
  }

  // Trainer List

  @action
  Future<void> getAllGyms() async {
    isSucceedAllGyms = StateStatus.LOADING;
    final responseData = await apiClient.getAllGyms();
    responseData.pick(
      onData: (data) {
        if (data != null) {
          allGyms = data;
          count = allGyms.results.length;
          pageLink = data.next;
        }
        isSucceedAllGyms = StateStatus.SUCCESS;
      },
    );
  }

  @action
  Future<void> getAllGymsByPage(String page) async {
    final responseData = await apiClient.getAllGymsByPage(page);
    responseData.pick(
      onData: (data) {
        if (data != null) {
          allGyms.results.addAll(data.results);
          count = count + data.results.length;
          pageLink = data.next;
        }
      },
    );
  }

  // Trainer Detail
  @action
  Future<void> getGymDetail(int gymId) async {
    isSucceedGymDetails = StateStatus.LOADING;
    final responseData = await apiClient.getGymDetail(gymId);
    responseData.pick(
      onData: (data) {
        if (data != null) {
          detailGym = data;
        }
        isSucceedGymDetails = StateStatus.SUCCESS;
      },
    );
  }

  // Gym Featured
  @action
  Future<void> getGymFeatured() async {
    isSucceedGymFeatured = StateStatus.LOADING;
    final responseData = await apiClient.getGymFeatured();
    responseData.pick(
      onData: (data) {
        if (data != null) {
          gymFeatured = data;
        }
        isSucceedGymFeatured = StateStatus.SUCCESS;
      },
    );
  }

  // this will get the get the gyms nearby
  @action
  Future<void> getGymsNearby() async {
    _preferences = await SharedPreferences.getInstance();
    final int il = _preferences.getInt('il');
    isSucceedGymFeatured = StateStatus.LOADING;
    final responseData = await apiClient.getGymsByIl(il);

    responseData.pick(
      onData: (data) {
        if (data != null) {
          gymsNearby = data;
        }
        isSucceedGymNearby = StateStatus.SUCCESS;
      },
    );
  }

  //TODO added this point where I combined all queries into one
  Future<void> getGymsByIl() async {
    _preferences = await SharedPreferences.getInstance();
    final int il = _preferences.getInt('il');

    final responseData = await apiClient.getGymsByIl(il);
    responseData.pick(
      onData: (data) {
        if (data != null) {
          gymsByIl = data;
        }
      },
    );
  }

  Future<void> getGymsByIlce() async {
    _preferences = await SharedPreferences.getInstance();
    final int il = _preferences.getInt('ilce');

    if(il != null){
      final responseData = await apiClient.getGymsByIlce(il);
      responseData.pick(
        onData: (data) {
          if (data != null) {
            gymsByIlce = data;
          }
        },
      );
    }else{
      gymsByIlce = [];
    }

  }

  Future<void> getGymsBySemt() async {
    _preferences = await SharedPreferences.getInstance();
    final int il = _preferences.getInt('semt');
    if(il != null){
      final responseData = await apiClient.getGymsBySemt(il);
      responseData.pick(
        onData: (data) {
          if (data != null) {
            gymsBySemt = data;
          }
        },
      );
    }else{
      gymsBySemt = [];
    }
  }

  Future<void> getGymsByMahalle() async {
    _preferences = await SharedPreferences.getInstance();
    final int il = _preferences.getInt('mahalle');
    //Check if user entered the mahalle
    if (il != null){
      final responseData = await apiClient.getGymsByMahalle(il);
      responseData.pick(
        onData: (data) {
          if (data != null) {
            gymsByMahalle = data;
          }
        },
      );
    }else{
      gymsByMahalle = [];
    }
  }

  //this function will combine all the query data from the filter
  @action
  Future<void> getGymsByLocationFilter() async{
    isSucceedFilteredGymList = StateStatus.LOADING;
    await getGymsByIl();
    await getGymsByIlce();
    await getGymsBySemt();
    await getGymsByMahalle();
    filteredGymList = gymsByMahalle; // assigned filtered gym list to mahalle
    for (final gym in gymsBySemt){
      bool alreadyContained = false;

      for (final b in filteredGymList){
        if (b.id == gym.id){
          alreadyContained = true;
          break;
        }
      }

      if (!alreadyContained){
        filteredGymList.add(gym);
      }
    }

    for (final gym in gymsByIlce){
      bool alreadyContained = false;

      for (final b in filteredGymList){
        if (b.id == gym.id){
          alreadyContained = true;
          break;
        }
      }

      if (!alreadyContained){
        filteredGymList.add(gym);
      }
    }

    for (final gym in gymsByIl){
      bool alreadyContained = false;

      for (final b in filteredGymList){
        if (b.id == gym.id){
          alreadyContained = true;
          break;
        }
      }

      if (!alreadyContained){
        filteredGymList.add(gym);
      }
    }
    isSucceedFilteredGymList = StateStatus.SUCCESS;
  }
}
