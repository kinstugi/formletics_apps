import 'package:dio/dio.dart' hide Headers;
import 'package:formletics/features/payment/data/models/basket_add_request_model.dart';
import 'package:formletics/features/payment/data/models/basket_add_response_model.dart';
import 'package:formletics/features/payment/data/models/basket_change_quantity_request_model.dart';
import 'package:formletics/features/payment/data/models/basket_product_model.dart';
import 'package:formletics/features/payment/data/models/basket_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'payment_data_source.g.dart';

@RestApi(baseUrl: "")
abstract class PaymentAPISource {
  factory PaymentAPISource(Dio dio) = _PaymentAPISource;

  /*Get Il*/
  // ignore: prefer_interpolation_to_compose_strings
  @GET("en/payment/getBasket/")
  Future<List<BasketResponseModel>> getBasket();

  @PATCH("en/payment/changeQuantity/{productId}/")
  Future<BasketProductModel> patchChangeQuantity(
      @Path("productId") int productId,
      @Body() BasketChangeQuantityRequestModel count);

  @DELETE("en/payment/removeProductBasket/{productId}/")
  Future<void> removeProductBasket(@Path() int productId);

  @DELETE("en/payment/removeServiceBasket/{serviceId}/")
  Future<void> removeServiceBasket(@Path() int serviceId);

  @POST("en/payment/addBasket/")
  Future<BasketAddResponseModel> addBasket(
      @Body() BasketAddRequestModel basket);

}
