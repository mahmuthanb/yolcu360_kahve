// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:yolcu360_kahve/core/config/app_config.dart';
import 'package:yolcu360_kahve/core/di/locator.dart';
import 'package:yolcu360_kahve/core/interceptor/error_interceptor.dart';
import 'package:yolcu360_kahve/core/interceptor/log_interceptor.dart';
import 'package:yolcu360_kahve/feature/data/service/app_service.dart';
import 'package:yolcu360_kahve/feature/data/service/mock_app_service.dart';

@module
abstract class ApiModule {
  @LazySingleton(order: -998)
  Dio get injectRetrofitAPI {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: getIt<AppConfig>().baseUrl,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "accept": "*/*",
        },
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
        sendTimeout: const Duration(minutes: 1),
      ),
    );
    dio.interceptors.add(ErrorInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(LoggerInterceptor());
    }
    return dio;
  }

  @Environment(Environment.prod)
  @lazySingleton
  AppService get appService => AppService(injectRetrofitAPI);

  @lazySingleton
  MapService get mapService {
    Dio dio2 = Dio(
      BaseOptions(
        baseUrl: getIt<AppConfig>().mapBase,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "accept": "*/*",
        },
        queryParameters: getIt<AppConfig>().mapQuery,
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
        sendTimeout: const Duration(minutes: 1),
      ),
    );
    dio2.interceptors.add(ErrorInterceptor());
    if (kDebugMode) {
      dio2.interceptors.add(LoggerInterceptor());
    }
    return MapService(dio2);
  }

  @Environment(Environment.dev)
  @Environment(Environment.test)
  @lazySingleton
  AppService get appServiceMock => MockAppService();
}
