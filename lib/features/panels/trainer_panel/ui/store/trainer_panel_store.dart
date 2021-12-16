//import 'package:flutter/material.dart';
import 'package:formletics/common/api_client/api_client.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/approve/request/change_sportsman.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/approve/response/approve.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/chat/response/chats_model_response.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/service/request/service.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/service/response/service.dart';
//import 'package:formletics/features/panels/trainer_panel/data/models/service/response/service_delete_response.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/add_routine.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/exercise_days.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/exercise_group.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/exercise_list.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/exercise_nested_exercise.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/group.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/service.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/sportsman.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/supplement_list.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/request/trainer_panel_sportsman_request_model.dart';
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/trainer_panel_sportsman_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/utils/alerts/alerts.dart';
import '../../data/models/sportsman/response/progress_photo_response_model.dart';

part 'trainer_panel_store.g.dart';

@lazySingleton
class TrainerPanelStore extends _TrainerPanelStore with _$TrainerPanelStore {
  @override
  ApiClient apiClient;

  @override
  Alerts alerts;

  TrainerPanelStore(
    this.apiClient,
    this.alerts,
  ) : super(alerts);
}

abstract class _TrainerPanelStore with Store {
  ApiClient apiClient;

  Alerts alerts;

  _TrainerPanelStore(this.alerts);

  @observable
  String errorMessage;

  // Service

  @observable
  StateStatus isSucceedGetServices4TrainerPanel = StateStatus.INITIAL;

  @observable
  StateStatus isSucceedPostService4TrainerPanel = StateStatus.INITIAL;

  @observable
  StateStatus isSucceedGet4SportsmenChat = StateStatus.INITIAL;

  @observable
  StateStatus isSucceedGet4SportsmenProgressPhotos = StateStatus.INITIAL;

  @observable
  List<TrainerPanelServiceResponseModel> services;

  @observable
  List<ProgressPhotoUploadResponseModel> progressPhotos;

  // Approve
  @observable
  StateStatus isSucceedGetSportsmen4TrainerPanel = StateStatus.INITIAL;

  @observable
  List<TrainerPanelApproveSportmenListResponseModel> sportsmen;

  @observable
  List<SportsmanChatResponseModel> sportsmenChats;

  @observable
  int statusResponse;

  // Sporsman
  @observable
  StateStatus isSucceedGetNeedRoutine = StateStatus.INITIAL;

  @observable
  List<TrainerPanelSportsmanResponseModel> needRoutine;

  // Create Routine
  @observable
  TrainerPanelSportsmanRequestModel requestModel;

  @observable
  StateStatus isReadyRequestModel = StateStatus.INITIAL;

  @observable
  List<TrainerPanelSportsmanNestedExerciseObject> exerciseList;

  @observable
  StateStatus isSucceedExerciseList = StateStatus.INITIAL;

  @observable
  StateStatus isSucceedAddRoutine = StateStatus.INITIAL;

  @observable
  StateStatus isSucceedUpdateService = StateStatus.INITIAL;

  // Service Action
  @action
  void resetServices() {
    errorMessage = null;
    services = null;
    isSucceedGetServices4TrainerPanel = StateStatus.INITIAL;
  }

  @action
  void resetPostService() {
    isSucceedPostService4TrainerPanel = StateStatus.INITIAL;
  }

  @action
  Future<void> getServices4TrainerPanel() async {
    isSucceedGetServices4TrainerPanel = StateStatus.LOADING;
    final responseData = await apiClient.getServices4TrainerPanel();
    responseData.pick(
      onData: (data) {
        if (data != null) {
          services = data;
        }
        isSucceedGetServices4TrainerPanel = StateStatus.SUCCESS;
      },
    );
  }

  @action
  Future<void> getSportsmenChat() async {
    isSucceedGet4SportsmenChat = StateStatus.LOADING;
    final responseData = await apiClient.fetchTrainerStudentChat();
    responseData.pick(onData: (data) {
      if (data != null) {
        sportsmenChats = data;
      }
      isSucceedGet4SportsmenChat = StateStatus.SUCCESS;
    });
  }

  @action
  Future<void> postService4TrainerPanel(
      TrainerPanelServiceRequestModel service) async {
    isSucceedPostService4TrainerPanel = StateStatus.LOADING;
    final responseData = await apiClient.postService4TrainerPanel(service);
    responseData.pick(
      onData: (data) {
        if (data.name.isNotEmpty) {
          isSucceedPostService4TrainerPanel = StateStatus.SUCCESS;
        }
      },
    );
  }

  // Approve Action
  @action
  void resetApprove() {
    errorMessage = null;
    sportsmen = null;
    isSucceedGetSportsmen4TrainerPanel = StateStatus.INITIAL;
  }

  @action
  void resetStatus() {
    statusResponse = null;
  }

  @action
  Future<void> fetchProgressPhoto4TrainerPanel(int sportsmanId) async {
    isSucceedGet4SportsmenProgressPhotos = StateStatus.LOADING;
    final responseData =
        await apiClient.fetchProgressPhoto4TrainerPanel(sportsmanId);
    responseData.pick(
      onData: (data) {
        if (data != null) {
          progressPhotos = data;
        }
        isSucceedGet4SportsmenProgressPhotos = StateStatus.SUCCESS;
      },
    );
  }

  @action
  Future<void> getSportsmen4TrainerPanel() async {
    isSucceedGetSportsmen4TrainerPanel = StateStatus.LOADING;
    final responseData = await apiClient.getSportsmen4TrainerPanel();
    responseData.pick(
      onData: (data) {
        if (data != null) {
          sportsmen = data;
        }
        isSucceedGetSportsmen4TrainerPanel = StateStatus.SUCCESS;
      },
    );
  }

  @action
  // ignore: missing_return
  Future<void> putApproveChangeSportsman(
    int sportsmanId,
    TrainerPanelApproveChangeSportsmanRequestModel status,
  ) async {
    final responseData = await apiClient.putApproveChangeSportsman4TrainerPanel(
        sportsmanId, status);
    responseData.pick(
      onData: (data) {
        if (data != null) {
          statusResponse = data.status;
        }
      },
    );
  }

  //Sportsman Action
  @action
  void resetSportsmen() {
    errorMessage = null;
    needRoutine = null;
    isSucceedGetNeedRoutine = StateStatus.INITIAL;
  }

  @action
  void resetAddRoutine() {
    errorMessage = null;
    isSucceedExerciseList = StateStatus.INITIAL;
    isSucceedGetNeedRoutine = StateStatus.INITIAL;
    needRoutine = null;
    exerciseList = null;
  }

  @action
  Future<List<TrainerPanelSportsmanNestedExerciseObject>>
      getAllExercises4TrainerPanel(int groupId) async {
    isSucceedExerciseList = StateStatus.LOADING;
    final responseData = await apiClient.getAllExercises4TrainerPanel(groupId);
    responseData.pick(
      onData: (data) {
        if (data != null) {
          exerciseList = [
            TrainerPanelSportsmanNestedExerciseObject(id: 0, name: "Seçiniz"),
          ];
          exerciseList.addAll(data);
        }
        isSucceedExerciseList = StateStatus.SUCCESS;
      },
    );
    return exerciseList;
  }

  @action
  void initRequestModel(TrainerPanelSportsmanNestedSportsman _sportsman,
      TrainerPanelSportsmanNestedService _service) {
    // Creating variables;
    List<TrainerPanelSportsmanNestedExerciseDays> _exerciseDays;
    TrainerPanelSportsmanNestedExerciseDays _exerciseDay;
    List<TrainerPanelSportsmanNestedExerciseList> _exerciseList;
    TrainerPanelSportsmanNestedExerciseList _exercise;
    List<TrainerPanelSportsmanNestedSupplementList> _supplementList;
    TrainerPanelSportsmanNestedSupplementList _supplement;
    List<TrainerPanelSportsmanNestedGroup> _groupList;
    TrainerPanelSportsmanNestedGroup _group;
    TrainerPanelSportsmanNestedGroupObject _nestedGroup;
    TrainerPanelSportsmanNestedExerciseObject _groupExercise;
    List<TrainerPanelSportsmanNestedExerciseObject> _groupExerciseList;
    String _nutritionList;
    DateTime _startDate;
    DateTime _endDate;
    String _note;

    // For Exercise Days
    _exercise = TrainerPanelSportsmanNestedExerciseList();

    _exerciseList = [
      _exercise,
    ];

    _nestedGroup = TrainerPanelSportsmanNestedGroupObject();
    _groupExercise =
        TrainerPanelSportsmanNestedExerciseObject(id: 0, name: "Select");
    _groupExerciseList = [
      _groupExercise,
    ];

    _group = TrainerPanelSportsmanNestedGroup(
        group: _nestedGroup, exercises: [], exerciseList: _exerciseList);

    _groupList = [
      _group,
    ];
    _exerciseDay = TrainerPanelSportsmanNestedExerciseDays(
        number: 1, group: _groupList, isBreak: false);
    _exerciseDays = [
      _exerciseDay,
    ];

    _supplementList = [
      _supplement,
    ];

    requestModel = TrainerPanelSportsmanRequestModel(
      sportsman: _sportsman,
      service: _service,
      exerciseDays: _exerciseDays,
      nutritionList: _nutritionList,
      supplementList: _supplementList,
      startDate: _startDate,
      endDate: _endDate,
      note: _note,
    );

    isReadyRequestModel = StateStatus.SUCCESS;
  }

  // Day Functions
  @action
  void addDay() {
    isReadyRequestModel == StateStatus.LOADING;
    requestModel.exerciseDays.add(TrainerPanelSportsmanNestedExerciseDays(
        number: requestModel
                .exerciseDays[requestModel.exerciseDays.length - 1].number +
            1,
        group: [
          TrainerPanelSportsmanNestedGroup(exerciseList: [
            TrainerPanelSportsmanNestedExerciseList(),
          ]),
        ],
        isBreak: false));
    isReadyRequestModel == StateStatus.SUCCESS;
  }

  @action
  void addBreakDay() {
    requestModel.exerciseDays.add(TrainerPanelSportsmanNestedExerciseDays(
        number: requestModel
                .exerciseDays[requestModel.exerciseDays.length - 1].number +
            1,
        group: [
          TrainerPanelSportsmanNestedGroup(exerciseList: [
            TrainerPanelSportsmanNestedExerciseList(),
          ]),
        ],
        isBreak: true));
  }

  void removeDay(int index) {
    if (requestModel.exerciseDays.length > 1 && index != 0) {
      requestModel.exerciseDays.removeAt(index);
    }
  }

  // Group Functions
  void addGroup(int index) {
    requestModel.exerciseDays[index].group.add(TrainerPanelSportsmanNestedGroup(
        group: TrainerPanelSportsmanNestedGroupObject(),
        exercises: [],
        exerciseList: [
          TrainerPanelSportsmanNestedExerciseList(),
        ]));
  }

  void removeGroup(int index, int j) {
    if (requestModel.exerciseDays[index].group.length > 1) {
      requestModel.exerciseDays[index].group.removeAt(j);
    }
  }

  void addGroupExercises(
      int index, int j, List<TrainerPanelSportsmanNestedExerciseObject> val) {
    requestModel.exerciseDays[index].group[j].exercises = val;
  }

  // Exercise Functions
  void addExercise(int index, int j, int k) {
    requestModel.exerciseDays[index].group[j].exerciseList
        .add(TrainerPanelSportsmanNestedExerciseList());
  }

  void removeExercise(int index, int j, int k) {
    if (requestModel.exerciseDays[index].group[j].exerciseList.length > 1) {
      requestModel.exerciseDays[index].group[j].exerciseList.removeAt(k);
    }
  }

  void changeSuperSet(int index, int j, int k, bool val) {
    requestModel.exerciseDays[index].group[j].exerciseList[k].super_set = val;
  }

  // Setters
  void changeGroup(
      int index, int j, TrainerPanelSportsmanNestedGroupObject val) {
    requestModel.exerciseDays[index].group[j].group = val;
  }

  void changeExerciseTimes(int index, int j, int k, String val) {
    requestModel.exerciseDays[index].group[j].exerciseList[k].times = val;
  }

  void changeExerciseSecond(int index, int j, int k, String val) {
    requestModel.exerciseDays[index].group[j].exerciseList[k].second = val;
  }

  void changeExercise(
      int index, int j, int k, TrainerPanelSportsmanNestedExerciseObject val) {
    requestModel.exerciseDays[index].group[j].exerciseList[k].exercise = val;
  }

  void changeNutrition(String val) {
    requestModel.nutritionList = val;
  }

  void changeStartDate(DateTime val) {
    requestModel.startDate = val;
  }

  void changeEndDate(DateTime val) {
    requestModel.endDate = val;
  }

  void changeNote(String val) {
    requestModel.note = val;
  }

  @action
  Future<void> getNeedRoutines4TrainePanel() async {
    isSucceedGetNeedRoutine = StateStatus.LOADING;
    final responseData = await apiClient.getNeedRoutines4TrainePanel();
    responseData.pick(
      onData: (data) {
        if (data != null) {
          needRoutine = data;
        }
        isSucceedGetNeedRoutine = StateStatus.SUCCESS;
      },
    );
  }

  @action
  Future<void> addRoutine4TrainerPanel() async {
    isSucceedAddRoutine = StateStatus.LOADING;
    final responseData = await apiClient.addRoutine4TrainerPanel(
        TrainerPanelAddRoutineRequestModel(addRoutine: requestModel));
    responseData.pick(
      onData: (data) {
        if (data != null) {
          if (data.successCode == 1) {
            isSucceedAddRoutine = StateStatus.SUCCESS;
          }
        }
      },
    );
  }

  @action
  Future<TrainerPanelServiceResponseModel> updateService4TrainerPanel(
      TrainerPanelServiceResponseModel service, int id) async {
    isSucceedUpdateService = StateStatus.LOADING;
    final responseData =
        await apiClient.updateService4TrainerPanel(service, id);
    responseData.pick(
      onData: (data) {
        if (data != null) {
          isSucceedUpdateService = StateStatus.SUCCESS;
          return data;
        }
      },
    );
    return responseData.data;
  }

  @action
  Future<void> deleteService(int serviceId) async {
    final responseData = await apiClient.deleteService4TrainerPanel(serviceId);

    responseData.pick(onData: (data) {
      if (data != null) {}
    });
  }
}
