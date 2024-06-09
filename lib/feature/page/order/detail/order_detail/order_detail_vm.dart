import '/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrderDetailViewModel extends BaseViewModel {
  OrderDetailViewModel();
  List<bool> isSelected = [true, false];
}
