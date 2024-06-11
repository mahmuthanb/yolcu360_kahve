// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:yolcu360_kahve/core/base/base_widget.dart';
import 'package:yolcu360_kahve/core/res/l10n/app_localizations.dart';
import 'package:yolcu360_kahve/core/res/theme.dart';
import 'package:yolcu360_kahve/core/siren/siren.dart';
import 'package:yolcu360_kahve/feature/page/app/app_vm.dart';
import 'package:yolcu360_kahve/feature/page/no_connectivity/no_connectivity.dart';
import 'package:yolcu360_kahve/feature/router/app_router.dart';
import 'package:yolcu360_kahve/feature/router/app_router.routes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends BaseState<AppViewModel, App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: LightTheme().theme(),
        darkTheme: DarkTheme().theme(),
        themeMode: viewModel.appearance,
        debugShowCheckedModeBanner: false,
        initialRoute: RouteMaps.root,
        onGenerateRoute: onGenerateRoute,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        localeResolutionCallback: (locale, supportedLocales) {
          if (Platform.isAndroid) {
            return viewModel.locale;
          }
          viewModel.setLocale(Locale(locale!.languageCode.split("_")[0]));
          return Locale(locale.languageCode.split("_")[0]);
        },
        builder: (context, child) {
          if (viewModel.sirenType == SirenType.force) {
            return ForceUpdatePage(update: () {
              if (Platform.isIOS) {
                launchUrl(Uri.parse(
                    "https://apps.apple.com/tr/app/{appname}/{appId}"));
              }

              if (Platform.isAndroid) {
                launchUrl(Uri.parse(
                    "https://play.google.com/store/apps/details?id=${viewModel.packageName}"));
              }
            });
          }
          return GestureDetector(
            child: Stack(
              children: [
                child!,
                if (!viewModel.isConnect) const NoConnectivityPage()
              ],
            ),
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          );
        },
        supportedLocales: AppLocalizations.supportedLocales);
  }
}
