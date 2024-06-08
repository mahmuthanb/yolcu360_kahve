import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yolcu360_kahve/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';
import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';
import 'package:yolcu360_kahve/feature/data/repository/app_repository.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  final AppRepository _appRepository;
  HomeViewModel(this._appRepository);

  final List<String> coffeeTypes = [
    "Cappucino",
    "Machiato",
    "Latte",
    "Americano"
  ];

  final sliverGridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 2 / 3,
    crossAxisSpacing: AppDimens.s,
    mainAxisSpacing: AppDimens.s,
  );

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set setIsLoading(bool loading) {
    _isLoading = loading;
  }

  initStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.black,
      ),
    );
    notifyListeners();
  }

  List<CoffeeModel> _coffeeList = [];
  List<CoffeeModel> get coffeeList => _coffeeList;
  getCoffeList() async {
    setIsLoading = true;
    return _appRepository.getCoffeeList().then((value) {
      if (value.isNotEmpty) {
        _coffeeList = value;
      }
      setIsLoading = false;
      notifyListeners();
    });
  }
}
