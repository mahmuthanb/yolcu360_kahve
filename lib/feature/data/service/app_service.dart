// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';
import 'package:yolcu360_kahve/feature/data/model/driving_route_model.dart';

part 'app_service.g.dart';

@RestApi()
abstract class AppService {
  factory AppService(Dio dio, {String baseUrl}) = _AppService;

  @GET("/kahve/coffee")
  Future<List<CoffeeModel>> getCoffeeList();
}

@RestApi()
abstract class MapService {
  factory MapService(Dio dio, {String baseUrl}) = _MapService;
  @GET("/driving/{latLon}")
  Future<DrivingRouteModel> getDrivingRoute(@Path('latLon') String latLon);
}
