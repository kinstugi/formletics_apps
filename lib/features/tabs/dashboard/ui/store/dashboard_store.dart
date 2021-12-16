import 'package:formletics/common/api_client/api_client.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/utils/alerts/alerts.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import '../../data/models/top_highlights_model.dart';

part "dashboard_store.g.dart";

@lazySingleton
class DashBoardStore extends _TodoStoreBase with _$DashBoardStore {
  @override
  ApiClient apiClient;

  @override
  Alerts alerts;


  DashBoardStore(
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
  StateStatus isSucceedAllTopHighlights = StateStatus.INITIAL;

  @observable
  String errorMessage;

  @observable
  List<TopHighlightModel> topHighlights = [];


  @action
  void resetList() {
    errorMessage = null;
    isSucceedAllTopHighlights = StateStatus.INITIAL;
    topHighlights = null;
  }



  @action
  Future<void> getAllTopHighlights() async {
    isSucceedAllTopHighlights = StateStatus.LOADING;
    final responseData = await apiClient.getDashboardTopHighlights();

    responseData.pick(
      onData: (data) {
        if (data != null) {
          topHighlights = data;
        }
        isSucceedAllTopHighlights = StateStatus.SUCCESS;
      },
    );
  }


}
