import 'package:injectable/injectable.dart';

abstract class AppConfig {
  String get baseUrl;
}

@Environment(Environment.prod)
@Singleton(as: AppConfig)
class AppConfigProdImpl implements AppConfig {
  @override
  String get baseUrl => "https://apimocha.com";
}

@Environment(Environment.dev)
@Singleton(as: AppConfig)
class AppConfigDevImpl implements AppConfig {
  @override
  String get baseUrl => "https://apimocha.com";
}
