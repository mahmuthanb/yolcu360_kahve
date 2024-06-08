import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';

abstract class AppRepository {
  Future<List<CoffeeModel>> getCoffeeList();
}
