// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';
import 'package:yolcu360_kahve/feature/data/model/driving_route_model.dart';
import 'package:yolcu360_kahve/feature/data/repository/app_repository.dart';
import 'package:yolcu360_kahve/feature/data/service/app_service.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImpl extends AppRepository {
  final AppService _appService;
  final MapService _mapService;
  AppRepositoryImpl(this._appService, this._mapService);

  @override
  Future<List<CoffeeModel>> getCoffeeList() {
    return _appService.getCoffeeList();
  }

  @override
  Future<DrivingRouteModel> getDrivingRoute(String latLon) {
    return _mapService.getDrivingRoute(latLon);
  }
}
