import 'package:formletics/common/api_client/api_client.dart';
import 'package:formletics/features/panels/gym_panel/data/models/manager/request/gym_panel_manager_request_model.dart';
import 'package:formletics/features/panels/gym_panel/data/models/trainer/request/gym_panel_trainer_request_model.dart';
import 'package:formletics/features/panels/gym_panel/data/models/trainer/response/trainers.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/utils/alerts/alerts.dart';

part 'gym_panel_store.g.dart';

@lazySingleton
class GymPanelStore extends _GymPanelStore with _$GymPanelStore {
  @override
  ApiClient apiClient;

  @override
  Alerts alerts;

  GymPanelStore(
    this.apiClient,
    this.alerts,
  ) : super(alerts);
}

abstract class _GymPanelStore with Store {
  ApiClient apiClient;

  Alerts alerts;

  _GymPanelStore(this.alerts);

  @observable
  String errorMessage;

  // Trainer
  @observable
  StateStatus isSucceedGetTrainer = StateStatus.INITIAL;

  @observable
  StateStatus isSucceedAddTrainer = StateStatus.INITIAL;

  @observable
  StateStatus isSucceedRemoveTrainer = StateStatus.INITIAL;

  @observable
  List<GymPanelNestedTrainers> trainers;

  // Gym
  @observable
  StateStatus isSucceedGetManager = StateStatus.INITIAL;

  @observable
  StateStatus isSucceedAddManager = StateStatus.INITIAL;

  @observable
  StateStatus isSucceedRemoveManager = StateStatus.INITIAL;

  @observable
  List<String> managers;

  // Trainer
  @action
  void resetTrainers() {
    errorMessage = null;
    isSucceedGetTrainer = StateStatus.INITIAL;
    trainers = null;
  }

  @action
  Future<void> getTrainers4GymPanel() async {
    isSucceedGetTrainer = StateStatus.LOADING;
    final responseData = await apiClient.getTrainers4GymPanel();
    responseData.pick(
      onData: (data) {
        if (data != null) {
          trainers = data[0].trainers;
        }
        isSucceedGetTrainer = StateStatus.SUCCESS;
      },
    );
  }

  @action
  Future<void> addNewTrainer4GymPanel(
      GymPanelTrainerRequestModel newTrainer) async {
    isSucceedAddTrainer = StateStatus.LOADING;
    final responseData = await apiClient.addNewTrainer4GymPanel(newTrainer);
    responseData.pick(
      onData: (data) {
        if (data != null) {
          if (data.successCode == 1) {
            isSucceedAddTrainer = StateStatus.SUCCESS;
          }
        }
      },
    );
  }

  @action
  Future<void> removeTrainer4GymPanel(
      GymPanelTrainerRequestModel removeTrainer) async {
    isSucceedRemoveTrainer = StateStatus.LOADING;
    final responseData = await apiClient.removeTrainer4GymPanel(removeTrainer);
    responseData.pick(
      onData: (data) {
        if (data != null) {
          if (data.successCode == 1) {
            isSucceedRemoveTrainer = StateStatus.SUCCESS;
          }
        }
      },
    );
  }

  // Managers
  @action
  void resetManagers() {
    errorMessage = null;
    isSucceedGetManager = StateStatus.INITIAL;
    managers = null;
  }

  @action
  Future<void> getManagers4GymPanel() async {
    isSucceedGetTrainer = StateStatus.LOADING;
    final responseData = await apiClient.getManagers4GymPanel();
    responseData.pick(
      onData: (data) {
        if (data != null) {
          managers = data[0].managers;
        }
        isSucceedGetTrainer = StateStatus.SUCCESS;
      },
    );
  }

  @action
  Future<void> addNewManager4GymPanel(
      GymPanelManagerRequestModel newManager) async {
    isSucceedAddManager = StateStatus.LOADING;
    final responseData = await apiClient.addNewManager4GymPanel(newManager);
    responseData.pick(
      onData: (data) {
        if (data != null) {
          if (data.successCode == 1) {
            isSucceedAddManager = StateStatus.SUCCESS;
          }
        }
      },
    );
  }

  @action
  Future<void> removeManager4GymPanel(
      GymPanelManagerRequestModel newManager) async {
    isSucceedRemoveManager = StateStatus.LOADING;
    final responseData = await apiClient.removeManager4GymPanel(newManager);
    responseData.pick(
      onData: (data) {
        if (data != null) {
          if (data.successCode == 1) {
            isSucceedRemoveManager = StateStatus.SUCCESS;
          }
        }
      },
    );
  }
}
