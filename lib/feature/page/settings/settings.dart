// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_settings/app_settings.dart';
import 'package:restart_app/restart_app.dart';
import 'package:route_map/route_map.dart';

// Project imports:
import 'package:yolcu360_kahve/core/base/base_widget.dart';
import 'package:yolcu360_kahve/core/di/locator.dart';
import 'package:yolcu360_kahve/core/res/icons.dart';
import 'package:yolcu360_kahve/core/res/l10n/app_localizations.dart';
import 'package:yolcu360_kahve/core/res/l10n/l10n.dart';
import 'package:yolcu360_kahve/feature/page/app/app_vm.dart';
import 'package:yolcu360_kahve/feature/page/settings/settings_vm.dart';

@RouteMap(name: "settings")
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends BaseState<SettingsViewModel, SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settings),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            ListTile(
              onTap: () {
                if (Platform.isIOS) {
                  AppSettings.openAppSettings(type: AppSettingsType.appLocale);
                } else if (Platform.isAndroid) {
                  showModalBottomSheet<Locale?>(
                      showDragHandle: true,
                      context: context,
                      useRootNavigator: true,
                      builder: (c) => ListView.builder(
                          shrinkWrap: true,
                          itemCount: AppLocalizations.supportedLocales.length,
                          itemBuilder: (c, i) {
                            var item = AppLocalizations.supportedLocales[i];
                            return ListTile(
                              onTap: () {
                                Navigator.pop(c, item);
                              },
                              title: Text(item.fullName()),
                            );
                          })).then((value) {
                    if (value != null) {
                      getIt<AppViewModel>().setLocale(value);
                      Restart.restartApp();
                    }
                  });
                }
              },
              title: Text(context.l10n.language),
              leading: const Icon(AppIcons.language),
              trailing: const Icon(AppIcons.chevronRight),
            ),
            const Divider(),
            ListTile(
              title: Text(context.l10n.version),
              leading: const Icon(AppIcons.version),
              subtitle: Text(viewModel.appVersion),
            ),
            const Divider(),
            ListTile(
              title: Text(context.l10n.licenses),
              leading: const Icon(AppIcons.license),
              trailing: const Icon(AppIcons.chevronRight),
              onTap: () {
                showLicensePage(
                    context: context,
                    useRootNavigator: true,
                    applicationName: viewModel.appName,
                    applicationVersion: viewModel.appVersion,
                    applicationLegalese: "@mahmuthanb");
              },
            )
          ],
        ),
      ),
    );
  }
}
