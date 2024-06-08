import 'package:yolcu360_kahve/core/di/locator.dart';
import 'package:yolcu360_kahve/core/source/local_data_source.dart';
import 'package:yolcu360_kahve/feature/router/app_router.routes.dart';
import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';

@RouteMapInit(typeSafe: true)
Route? onGenerateRoute(RouteSettings routeSettings) => $onGenerateRoute(
      routeSettings,
      redirect: (routeName) {
        if (!getIt<LocalDataSource>().isLogged) {
          return RouteMaps.loginRoute;
        }
        return null;
      },
    );
