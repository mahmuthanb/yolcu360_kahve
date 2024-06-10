import 'package:yolcu360_kahve/feature/data/dummy_data.dart';
import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';
import 'package:yolcu360_kahve/feature/data/service/app_service.dart';

class MockAppService implements AppService {
  MockAppService();

  @override
  Future<String> getAppVersion() async {
    String version = '1.1';
    await Future.delayed(const Duration(seconds: 1));
    return version;
  }

  @override
  Future<List<CoffeeModel>> getCoffeeList() async {
    List<CoffeeModel> data = [];
    await Future.delayed(const Duration(seconds: 3)).then((v) async {
      for (var e in dummyData) {
        data.add(CoffeeModel.fromJson(e));
      }
    });
    return data;
  }
}
