import 'package:formletics/common/api_client/api_client.dart';
import 'package:formletics/features/location/data/models/location_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/utils/alerts/alerts.dart';
part 'location_store.g.dart';

@lazySingleton
class LocationStore extends _TodoStoreBase with _$LocationStore {
  @override
  ApiClient apiClient;

  @override
  Alerts alerts;

  LocationStore(
    this.apiClient,
    this.alerts,
  ) : super(alerts);
}

abstract class _TodoStoreBase with Store {
  ApiClient apiClient;

  Alerts alerts;

  _TodoStoreBase(this.alerts);

  @observable
  StateStatus isSucceedIl = StateStatus.INITIAL;

  @observable
  List<LocationResponseModel> ilList = [];

  @observable
  StateStatus isSucceedIlce = StateStatus.INITIAL;

  @observable
  List<LocationResponseModel> ilceList = [];

  @observable
  StateStatus isSucceedSemt = StateStatus.INITIAL;

  @observable
  List<LocationResponseModel> semtList = [];

  @observable
  StateStatus isSucceedMahalle = StateStatus.INITIAL;

  @observable
  List<LocationResponseModel> mahalleList = [];

  @observable
  String errorMessage;

  @action
  Future<void> getIl() async {
    isSucceedIl = StateStatus.LOADING;
    final responseData = await apiClient.getIl();
    responseData.pick(
      onData: (data) {
        if (data != null) {
          ilList = data;
        }
        isSucceedIl = StateStatus.SUCCESS;
      },
    );
  }

  @action
  Future<void> getIlce(int il_id) async {
    isSucceedIlce = StateStatus.LOADING;
    final responseData = await apiClient.getIlce(il_id);
    responseData.pick(
      onData: (data) {
        if (data != null) {
          ilceList = data;
        }
        isSucceedIlce = StateStatus.SUCCESS;
      },
    );
  }

  @action
  Future<void> getSemt(int ilce_id) async {
    isSucceedSemt = StateStatus.LOADING;
    final responseData = await apiClient.getSemt(ilce_id);
    responseData.pick(
      onData: (data) {
        if (data != null) {
          semtList = data;
        }
        isSucceedSemt = StateStatus.SUCCESS;
      },
    );
  }

  @action
  Future<void> getMahalle(int semt_id) async {
    isSucceedMahalle = StateStatus.LOADING;
    final responseData = await apiClient.getMahalle(semt_id);
    responseData.pick(
      onData: (data) {
        if (data != null) {
          mahalleList = data;
        }
        isSucceedMahalle = StateStatus.SUCCESS;
      },
    );
  }
}
