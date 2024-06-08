import 'package:yolcu360_kahve/core/source/local_data_source.dart';

import '/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailViewModel extends BaseViewModel {
  final LocalDataSource _localDataSource;
  ProductDetailViewModel(this._localDataSource);

  addToFavorites(int id) {
    String? lastFavList = "";
    List<String> newList = favList.split(",").where((s) => !s.isEmpty).toList();
    if (!isFavorited) {
      newList.add(id.toString());
      // lastFavList = favList + '$id,';
    } else {
      newList.remove(id.toString());
    }
    if (newList.isEmpty) {
      lastFavList = null;
    } else if (newList.length < 2) {
      lastFavList = newList.first;
    } else {
      lastFavList = newList.join(',');
    }
    _localDataSource.setFavorites(lastFavList);
    checkFavlist(id);
  }

  bool _isFavorited = false;
  bool get isFavorited => _isFavorited;
  set ifIsFavorited(bool fav) {
    _isFavorited = fav;
  }

  String _favList = "";
  String get favList => _favList;

  set favList(String newList) {
    _favList = newList;
  }

  checkFavlist(int id) {
    favList = _localDataSource.favoritesList;
    ifIsFavorited = favList.split(",").toList().contains(id.toString());
    notifyListeners();
  }

  String _firstHalf = "";
  String get firstHalf => _firstHalf;
  set firstHalf(String text) {
    _firstHalf = text;
  }

  String _secondHalf = "";
  String get secondHalf => _secondHalf;
  set secondHalf(String text) {
    _secondHalf = text;
  }

  bool _flag = true;
  bool get flag => _flag;
  set setFlag(bool f) {
    _flag = f;
    notifyListeners();
  }

  checkTextLength(String text) {
    if (text.length > 50) {
      firstHalf = text.substring(0, 50);
      secondHalf = text.substring(50, text.length);
    } else {
      firstHalf = text;
      secondHalf = "";
    }
    notifyListeners();
  }
}
