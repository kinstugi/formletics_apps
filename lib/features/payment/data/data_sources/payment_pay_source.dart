import 'package:dio/dio.dart';
import 'package:formletics/features/payment/data/models/payment_3d_request_model.dart';
import 'package:formletics/features/payment/data/models/payment_3d_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'payment_pay_source.g.dart';

@RestApi(baseUrl: "")
abstract class PaymentAPI3DSource {
  factory PaymentAPI3DSource(Dio dio) = _PaymentAPI3DSource;

  @POST('en/mobile/api/payment/pay3D/')
  Future<Payment3DResponseModel> makePayment(@Body() Payment3DRequestModel payment);
}
