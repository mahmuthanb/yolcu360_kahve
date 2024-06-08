import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';

part 'app_service.g.dart';

@RestApi()
abstract class AppService {
  factory AppService(Dio dio, {String baseUrl}) = _AppService;

  @GET("/app/version")
  Future<String> getAppVersion();

  @GET("/kahve/coffee")
  Future<List<CoffeeModel>> getCoffeeList();
}
