// Package imports:
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

// Project imports:
import 'package:yolcu360_kahve/core/base/base_view_model.dart';

@injectable
class SettingsViewModel extends BaseViewModel {
  final PackageInfo _packageInfo;
  SettingsViewModel(this._packageInfo);

  String get appVersion =>
      "${_packageInfo.version} (${_packageInfo.buildNumber})";
  String get appName => _packageInfo.appName;
}
