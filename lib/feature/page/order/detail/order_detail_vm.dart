// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:yolcu360_kahve/core/base/base_view_model.dart';
import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';

@injectable
class OrderDetailViewModel extends BaseViewModel {
  OrderDetailViewModel();
  List<bool> isSelected = [true, false];

  CoffeeModel _coffee = CoffeeModel(
    title: "",
    description: "",
    ingredients: [""],
    image: "",
    id: 0,
    price: 1,
  );
  CoffeeModel get coffee => _coffee;
  set coffeeData(CoffeeModel data) {
    _coffee = data;
    notifyListeners();
  }

  int _orderCount = 1;
  int get orderCount => _orderCount;
  set setOrderCount(bool isIncrement) {
    if (_orderCount > 0 && isIncrement) {
      _orderCount++;
    } else if (_orderCount > 1 && !isIncrement) {
      _orderCount--;
    }
    notifyListeners();
  }
}
