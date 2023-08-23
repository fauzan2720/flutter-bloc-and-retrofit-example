import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:starter_app/repository/models/response_api.dart';

part 'reqres_api_service.g.dart';

@RestApi(baseUrl: "https://reqres.in/api/")
abstract class ReqresApiService {
  factory ReqresApiService(Dio dio, {String baseUrl}) = _ReqresApiService;

  @GET("users")
  Future<ResponseApi> getUsers();

  @GET("users/{id}")
  Future<ResponseApi> getUserById(@Path('id') int id);
}
