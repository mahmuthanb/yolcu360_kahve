import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yolcu360_kahve/core/source/app_storage.dart';
import 'package:injectable/injectable.dart';

abstract class LocalDataSource {
  Locale get locale;
  Future setLocale(Locale locale);

  ThemeMode get appearance;
  Future setAppearance(ThemeMode themeMode);
  Future<void> clear();

  String? get email;
  Future setEmail(String? email);

  bool get isLogged;
  Future setLogged(bool logged);

  String get favoritesList;
  Future setFavorites(String? id);
}

@Environment(Environment.prod)
@Environment(Environment.dev)
@Singleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final AppStorage _getStorage;
  LocalDataSourceImpl(this._getStorage);

  @override
  Future<void> clear() async {
    return;
  }

  @override
  ThemeMode get appearance =>
      ThemeMode.values[_getStorage.read<int>("appearance") ?? 0];

  @override
  Future setAppearance(ThemeMode themeMode) {
    return _getStorage.write("appearance", themeMode.index);
  }

  @override
  String? get email => _getStorage.read("email");

  @override
  Future setEmail(String? email) {
    return _getStorage.write("email", email);
  }

  @override
  Locale get locale => Locale(_getStorage.read<String>("locale") ?? "en");

  @override
  Future setLocale(Locale locale) {
    return _getStorage.write("locale", locale);
  }

  @override
  bool get isLogged => _getStorage.read<bool>("isLogged") ?? false;

  @override
  Future setLogged(bool logged) {
    return _getStorage.write("isLogged", logged);
  }

  @override
  String get favoritesList => _getStorage.read<String>("favoritesList") ?? "";

  @override
  Future setFavorites(String? list) {
    return _getStorage.write("favoritesList", list);
  }
}

@Environment(Environment.test)
@Singleton(as: LocalDataSource)
class TestLocalDataSourceImpl implements LocalDataSource {
  @override
  Future<void> clear() async {
    return;
  }

  String? _email;
  @override
  String? get email => _email;

  @override
  Future setEmail(String? email) async {
    _email = email;
    return;
  }

  Locale _locale = const Locale("en");
  @override
  Locale get locale => _locale;

  @override
  Future setLocale(Locale locale) async {
    _locale = locale;
    return;
  }

  ThemeMode _themeMode = ThemeMode.system;
  @override
  ThemeMode get appearance => _themeMode;

  @override
  Future setAppearance(ThemeMode themeMode) async {
    _themeMode = themeMode;
    return;
  }

  bool _isLogged = true;
  @override
  bool get isLogged => _isLogged;

  @override
  Future setLogged(bool logged) async {
    _isLogged = logged;
    return;
  }

  String _favoritesList = "1,2,3,4,5,6,7,8,9";
  @override
  String get favoritesList => _favoritesList;

  @override
  Future setFavorites(String? favoritesList) async {
    _favoritesList = favoritesList!;
    return;
  }
}
