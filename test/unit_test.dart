// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as i;

// Project imports:
import 'package:yolcu360_kahve/core/di/locator.dart';
import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';
import 'package:yolcu360_kahve/feature/data/repository/app_repository.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await setupDI(i.Environment.test);
  });
  group('Fetch Coffee List', () {
    test('Coffelist should be greater than or equal to 1', () async {
      var appRepository = getIt<AppRepository>();
      List<CoffeeModel> coffeeList = [];
      coffeeList = await appRepository.getCoffeeList();
      expect(coffeeList.length, greaterThanOrEqualTo(1));
    });
  });
}
