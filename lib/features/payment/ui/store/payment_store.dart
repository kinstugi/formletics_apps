import 'package:formletics/common/api_client/api_client.dart';
import 'package:formletics/features/payment/data/models/basket_change_quantity_request_model.dart';
import 'package:formletics/features/payment/data/models/basket_response_model.dart';
import 'package:formletics/features/payment/data/models/payment_3d_request_model.dart';
import 'package:formletics/features/payment/data/models/payment_3d_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/utils/alerts/alerts.dart';

part 'payment_store.g.dart';

@lazySingleton
class PaymentStore extends _PaymentStoreBase with _$PaymentStore {
  @override
  ApiClient apiClient;

  @override
  Alerts alerts;

  PaymentStore(
    this.apiClient,
    this.alerts,
  ) : super(alerts);
}

abstract class _PaymentStoreBase with Store {
  ApiClient apiClient;

  Alerts alerts;

  _PaymentStoreBase(this.alerts);

  @observable
  String errorMessage;

  @observable
  StateStatus isSucceedGetBasket = StateStatus.INITIAL;

  @observable
  StateStatus isSucceedChangedQuantitiy = StateStatus.INITIAL;

  @observable
  BasketResponseModel basket;

  @observable
  int product_count = 0;

  @observable
  bool next;

  @action
  void resetBasket() {
    errorMessage = null;
    isSucceedGetBasket = StateStatus.INITIAL;
    basket = null;
  }

  @action
  Future<void> getBasket() async {
    isSucceedGetBasket = StateStatus.LOADING;
    final responseData = await apiClient.getBasket();
    responseData.pick(
      onData: (data) {
        if (data.isNotEmpty) {
          basket = data[0];
        }
        isSucceedGetBasket = StateStatus.SUCCESS;
      },
    );
  }

  @action
  Future<void> patchChangeQuantity(int oid, int productId, int count) async {
    if (count > 0) {
      product_count = count;
      if (count > 1 && oid == 0) {
        product_count -= 1;
        next = true;
      } else if (count == 1 && oid == 0) {
        next = false;
      } else if (oid == 1) {
        product_count += 1;
        next = true;
      }
    }

    if (next) {
      isSucceedChangedQuantitiy = StateStatus.LOADING;
      final responseData = await apiClient.patchChangeQuantity(
          productId, BasketChangeQuantityRequestModel(count: product_count));
      responseData.pick(
        onData: (data) {
          isSucceedGetBasket = StateStatus.SUCCESS;
        },
      );
    }
  }

  @action
  Future<void> removeProductBasket(int productId) async {
    await apiClient.removeProductBasket(productId);
    await getBasket();
  }

  @action
  Future<void> removeServiceBasket(int serviceId) async {
    await apiClient.removeServiceBasket(serviceId);
    await getBasket();
  }

  @action
  Future<Payment3DResponseModel> make3dPayment(
      Map<String, dynamic> details) async {
    final Payment3DRequestModel payment =
        Payment3DRequestModel.fromJson(details);
    final res = await apiClient.makePayment(payment);
    print(">>>>>>><><>>>>>\n${res.error}");
    return res.data;
  }
}
