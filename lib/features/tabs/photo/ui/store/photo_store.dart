import 'package:formletics/common/api_client/api_client.dart';
import 'package:formletics/features/tabs/photo/data/models/photo_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/utils/alerts/alerts.dart';

part 'photo_store.g.dart';

@lazySingleton
class PhotoStore extends _PhotoStoreBase with _$PhotoStore {
  @override
  ApiClient apiClient;

  @override
  Alerts alerts;

  PhotoStore(
    this.apiClient,
    this.alerts,
  ) : super(alerts);
}

abstract class _PhotoStoreBase with Store {
  ApiClient apiClient;

  Alerts alerts;

  _PhotoStoreBase(this.alerts);

  @observable
  List<PhotoResponseModel> photoList = [];

  @observable
  bool success = false;

  @observable
  StateStatus isSucceed = StateStatus.INITIAL;

  @observable
  String errorMessage;
}
