// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

// Project imports:
import 'package:yolcu360_kahve/core/base/base_view_model.dart';
import 'package:yolcu360_kahve/core/siren/siren.dart';
import 'package:yolcu360_kahve/core/source/local_data_source.dart';
import 'package:yolcu360_kahve/feature/data/repository/app_repository.dart';

@singleton
class AppViewModel extends BaseViewModel {
  final PackageInfo _packageInfo;
  final AppRepository _appRepository;
  final Connectivity _connectivity;
  final LocalDataSource _localDataSource;
  AppViewModel(this._localDataSource, this._packageInfo, this._connectivity,
      this._appRepository) {
    _checkConnectivity();
  }
  ConnectivityResult _connectivityStatus = ConnectivityResult.other;
  bool get isConnect => _connectivityStatus != ConnectivityResult.none;
  void _checkConnectivity() {
    _connectivity.onConnectivityChanged.listen((event) {
      _connectivityStatus = event;
      notifyListeners();
    });
  }

  Locale? get locale => _localDataSource.locale;
  Future setLocale(Locale locale) => _localDataSource.setLocale(locale);

  ThemeMode get appearance => _localDataSource.appearance;
  Future setDarkMode(ThemeMode appearance) =>
      _localDataSource.setAppearance(appearance).then((value) {
        notifyListeners();
      });
  SirenType sirenType = SirenType.none;
  String get packageName => _packageInfo.packageName;
}
