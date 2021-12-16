import 'package:dio/dio.dart' hide Headers;
import 'package:formletics/features/tabs/photo/data/models/photo_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'photo_data_source.g.dart';

@RestApi(baseUrl: "")
abstract class PhotoAPISource {
  factory PhotoAPISource(Dio dio) = _PhotoAPISource;

  /*Get User Detail Api*/
  // ignore: prefer_interpolation_to_compose_strings
  @GET("photos")
  Future<List<PhotoResponseModel>> getPhotos();
}
