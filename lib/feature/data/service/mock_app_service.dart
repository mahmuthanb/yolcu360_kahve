import 'package:yolcu360_kahve/feature/data/dummy_data.dart';
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
  Future<List<CoffeeModel>> getCoffeeList() async {
    List<CoffeeModel> data = [];
    await Future.delayed(Duration(seconds: 5)).then((v) async {
      dummyData.forEach((e) {
        data.add(CoffeeModel.fromJson(e));
      });
    });
    return data;
  }
}
