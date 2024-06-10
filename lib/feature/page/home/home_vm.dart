import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yolcu360_kahve/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';
import 'package:yolcu360_kahve/core/util/alert_message.dart';
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
    "Americano",
    "Fresh Filter"
  ];
  var userPhotoUrl = "https://picsum.photos/400";
  var userLocation = "Bilzen,Tanjungbalai";
  var sliderPhotoUrl = "https://picsum.photos/250";

  int _actCofCat = 0;
  int get actCofCat => _actCofCat;
  activeCoffeCat(int index) {
    _actCofCat = index;
    notifyListeners();
  }

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
        statusBarColor: AppColors.black,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.grey,
      ),
    );
    notifyListeners();
  }

  List<CoffeeModel> _coffeeList = [];
  List<CoffeeModel> get coffeeList => _coffeeList;
  Future getCoffeList(BuildContext ctx) async {
    setIsLoading = true;
    return _appRepository.getCoffeeList().then((value) {
      if (value.isNotEmpty) {
        _coffeeList = value;
      }
    }).onError((e, s) {
      ctx.showSnackBar(e.toString(), status: AlertStatus.error);
    }).whenComplete(() {
      setIsLoading = false;
      notifyListeners();
    });
  }
}
