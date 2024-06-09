import '/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrderDetailViewModel extends BaseViewModel {
  OrderDetailViewModel();
  List<bool> isSelected = [true, false];

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
