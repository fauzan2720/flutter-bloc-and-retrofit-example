import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:starter_app/repository/models/product_model.dart';

part 'escuelajs_api_service.g.dart';

@RestApi(baseUrl: "https://api.escuelajs.co/api/v1/")
abstract class EscuelajsApiService {
  factory EscuelajsApiService(Dio dio, {String baseUrl}) = _EscuelajsApiService;

  @GET("products")
  Future<List<ProductModel>> getProducts();
}
