// Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:yolcu360_kahve/core/source/app_storage.dart';

@module
abstract class AppModule {
  @Environment(Environment.dev)
  @Environment(Environment.prod)
  @preResolve
  Future<AppStorage> localDataSource() async {
    return SharedPreferences.getInstance().then((value) {
      return AppStorage(value);
    });
  }

  @Environment(Environment.dev)
  @Environment(Environment.prod)
  @preResolve
  Future<PackageInfo> info() => PackageInfo.fromPlatform();

  @Environment(Environment.dev)
  @Environment(Environment.prod)
  Connectivity get connectivity => Connectivity();

  @Environment(Environment.test)
  PackageInfo test() => PackageInfo(
        appName: "appName",
        packageName: "packageName",
        version: "version",
        buildNumber: "buildNumber",
      );

  @Environment(Environment.test)
  Connectivity get connectivityTest => Connectivity();
}
