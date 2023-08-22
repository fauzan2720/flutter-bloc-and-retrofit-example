import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:starter_app/repository/models/response_api.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://reqres.in/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("users")
  Future<ResponseApi> getUsers();

  @GET("users/{id}")
  Future<ResponseApi> getUserById(@Path('id') int id);
}
