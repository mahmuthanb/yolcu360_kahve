import 'package:injectable/injectable.dart';

abstract class AppConfig {
  String get baseUrl;
  String get mapBase;
  Map<String, dynamic> get mapQuery;
}

@Environment(Environment.prod)
@Environment(Environment.dev)
@Singleton(as: AppConfig)
class AppConfigProdImpl implements AppConfig {
  @override
  String get baseUrl => "https://apimocha.com";

  @override
  String get mapBase => "http://router.project-osrm.org/route/v1";

  @override
  Map<String, dynamic> get mapQuery =>
      {"geometries": "geojson", "overview": "full"};
}
