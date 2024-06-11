// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as i;

// Project imports:
import 'package:yolcu360_kahve/core/di/locator.dart';
import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';
import 'package:yolcu360_kahve/feature/data/model/driving_route_model.dart';
import 'package:yolcu360_kahve/feature/data/repository/app_repository.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await setupDI(i.Environment.test);
  });
  group('Fetch Repository Functions', () {
    test('Coffelist should be greater than or equal to 1', () async {
      var appRepository = getIt<AppRepository>();
      List<CoffeeModel> coffeeList = [];
      coffeeList = await appRepository.getCoffeeList();
      expect(coffeeList.length, greaterThanOrEqualTo(1));
    });
    test('Get OSRM Routes', () async {
      var appRepository = getIt<AppRepository>();
      DrivingRouteModel drivingRouteModel;
      drivingRouteModel = await appRepository.getDrivingRoute(
          '29.07182584047572,41.002663591970276;29.061593184136033,40.99851198686524');
      expect(drivingRouteModel.routes.first.geometry.coordinates.length, 10);
    });
  });
}
