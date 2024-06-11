import 'package:yolcu360_kahve/feature/data/dummy_data.dart';
import 'package:yolcu360_kahve/feature/data/model/driving_route_model.dart';
import 'package:yolcu360_kahve/feature/data/service/app_service.dart';

class MockMapService implements MapService {
  MockMapService();

  @override
  Future<DrivingRouteModel> getDrivingRoute(String latLon) async {
    await Future.delayed(const Duration(seconds: 1));
    return DrivingRouteModel.fromJson(dummyMapData);
  }
}
