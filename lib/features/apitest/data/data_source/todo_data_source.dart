import 'package:dio/dio.dart' hide Headers;
import 'package:formletics/features/apitest/data/models/todo_response_model.dart';
import 'package:formletics/features/apitest/data/models/user_detail_response_model.dart';
import 'package:formletics/features/apitest/data/models/user_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'todo_data_source.g.dart';

@RestApi(baseUrl: "")
abstract class TodoAPISource {
  factory TodoAPISource(Dio dio) = _TodoAPISource;

  /*Get Todo Detail Api*/
  // ignore: prefer_interpolation_to_compose_strings
  @GET("todos/1")
  Future<TodoResponseModel> getTodo();

  /*Get TOdo Api for LIST*/
  // ignore: prefer_interpolation_to_compose_strings
  @GET("todos")
  Future<List<TodoResponseModel>> getTodos();

  /*Get User Api for LIST*/
  // ignore: prefer_interpolation_to_compose_strings
  @GET("users")
  Future<List<UserResponseModel>> getUsers();

  @GET("api/user/getUserDetail/")
  Future<UserDetailResponseModel> getUserDetail();
}
