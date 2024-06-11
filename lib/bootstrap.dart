// Dart imports:
import 'dart:async';
import 'dart:developer';

// Flutter imports:
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:yolcu360_kahve/core/di/locator.dart';
import 'package:yolcu360_kahve/core/logger.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder, String env) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (details) {
      log(details.exceptionAsString(), stackTrace: details.stack);
      FlutterError.dumpErrorToConsole(details);
    };
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    await setupDI(env);
    runApp(await builder());
  }, (error, stackTrace) {
    Log.e(error.toString(), tag: "Zone Error");
    Log.e(stackTrace.toString(), tag: "Zone StackTrace");
  });
}
