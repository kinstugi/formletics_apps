import 'package:formletics/common/api_client/api_client.dart';
import 'package:formletics/features/apitest/data/models/user_detail_response_model.dart';
import 'package:formletics/features/apitest/data/models/user_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/features/apitest/data/models/todo_response_model.dart';
import 'package:formletics/utils/alerts/alerts.dart';

part 'todo_store.g.dart';

@lazySingleton
class TodoStore extends _TodoStoreBase with _$TodoStore {
  @override
  ApiClient apiClient;

  @override
  Alerts alerts;

  TodoStore(
    this.apiClient,
    this.alerts,
  ) : super(alerts);
}

abstract class _TodoStoreBase with Store {
  ApiClient apiClient;

  Alerts alerts;

  _TodoStoreBase(this.alerts);

  @observable
  String title;

  @observable
  TodoResponseModel todoResponse;

  @observable
  StateStatus isSucceed = StateStatus.INITIAL;

  @observable
  List<TodoResponseModel> todoList = [];

  @observable
  StateStatus isSucceedTodoList = StateStatus.INITIAL;

  @observable
  List<UserResponseModel> userList = [];

  @observable
  StateStatus isSucceedUserList = StateStatus.INITIAL;

  UserDetailResponseModel userDetailResponse;

  @observable
  StateStatus isSucceedUserDetail = StateStatus.INITIAL;

  @observable
  String errorMessage;

  /* @action
  Future<void> getPhototos() async {
    isSucceed = StateStatus.LOADING;
    final photoData = await apiClient.getPhotos();

    photoData.pick(
      onData: (data) {
        if (data.isNotEmpty) {
          photoList = data;
        }
        isSucceed = StateStatus.SUCCESS;
      },
    );
  } */

  @action
  Future<void> getUserDetail() async {
    isSucceedUserDetail = StateStatus.LOADING;
    final userDetailData = await apiClient.getUserDetail();
    userDetailData.pick(
      onData: (data) {
        if (data != null) {
          userDetailResponse = data;
        }
        isSucceedUserDetail = StateStatus.SUCCESS;
      },
    );
  }
}
