import 'package:yolcu360_kahve/core/source/local_data_source.dart';

import 'package:yolcu360_kahve/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends BaseViewModel {
  final LocalDataSource _localDataSource;
  LoginViewModel(this._localDataSource);

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set setIsLoading(bool loading) {
    _isLoading = loading;
  }

  verifyLogin(bool status) {
    setIsLoading = true;
    _localDataSource.setLogged(status);
  }
}
