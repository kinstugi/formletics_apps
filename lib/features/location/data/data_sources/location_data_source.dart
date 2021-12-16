import 'package:dio/dio.dart' hide Headers;
import 'package:formletics/features/location/data/models/location_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'location_data_source.g.dart';

@RestApi(baseUrl: "")
abstract class LocationAPISource {
  factory LocationAPISource(Dio dio) = _LocationAPISource;

  /*Get Il*/
  // ignore: prefer_interpolation_to_compose_strings
  @GET("api/il/")
  Future<List<LocationResponseModel>> getIl();

  /*Get Ilce*/
  // ignore: prefer_interpolation_to_compose_strings
  @GET("api/ilce/{il_id}/")
  Future<List<LocationResponseModel>> getIlce(@Path("il_id") int il_id);

  /*Get Semt*/
  // ignore: prefer_interpolation_to_compose_strings
  @GET("api/semt/{ilce_id}/")
  Future<List<LocationResponseModel>> getSemt(@Path("ilce_id") int ilce_id);

  /*Get Mahalle*/
  // ignore: prefer_interpolation_to_compose_strings
  @GET("api/mahalle/{semt_id}/")
  Future<List<LocationResponseModel>> getMahalle(@Path("semt_id") int semt_id);
}
