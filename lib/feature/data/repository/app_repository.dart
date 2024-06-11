import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';
import 'package:yolcu360_kahve/feature/data/model/driving_route_model.dart';

abstract class AppRepository {
  Future<List<CoffeeModel>> getCoffeeList();
  Future<DrivingRouteModel> getDrivingRoute(String latLon);
}
