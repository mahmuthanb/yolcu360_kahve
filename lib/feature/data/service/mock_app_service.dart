import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';
import 'package:yolcu360_kahve/feature/data/service/app_service.dart';

class MockAppService implements AppService {
  MockAppService();

  @override
  Future<String> getAppVersion() {
    // TODO: implement getAppVersion
    throw UnimplementedError();
  }

  @override
  Future<List<CoffeeModel>> getCoffeeList() {
    // TODO: implement getCoffeeList
    throw UnimplementedError();
  }
}
