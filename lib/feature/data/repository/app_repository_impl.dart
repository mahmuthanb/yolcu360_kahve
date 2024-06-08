import 'package:injectable/injectable.dart';
import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';
import 'package:yolcu360_kahve/feature/data/service/app_service.dart';
import 'package:yolcu360_kahve/feature/data/repository/app_repository.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImpl extends AppRepository {
  final AppService _appService;
  AppRepositoryImpl(this._appService);

  @override
  Future<List<CoffeeModel>> getCoffeeList() {
    return _appService.getCoffeeList();
  }
}
