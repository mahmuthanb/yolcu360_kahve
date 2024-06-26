// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:route_map/route_map.dart';

// Project imports:
import 'package:yolcu360_kahve/core/base/base_widget.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/l10n/l10n.dart';
import 'package:yolcu360_kahve/feature/page/not_found/not_found.dart';
import 'package:yolcu360_kahve/feature/page/root/root_vm.dart';
import 'package:yolcu360_kahve/feature/page/root/widgets/custom_bottom_bar.dart';
import 'package:yolcu360_kahve/feature/router/app_router.dart';
import 'package:yolcu360_kahve/feature/router/app_router.routes.dart';

@RouteMap(name: "/")
class RootPage extends StatefulWidget {
  const RootPage({super.key});
  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends BaseState<RootViewModel, RootPage> {
  final List<NavItemModel> _items = [
    NavItemModel(
      icon: Icons.home,
      label: (c) => c.l10n.home,
      route: RouteMaps.homeRoute,
      key: GlobalKey<NavigatorState>(),
    ),
    NavItemModel(
      icon: Icons.favorite,
      label: (c) => c.l10n.settings,
      route: RouteMaps.notFoundRoute,
      key: GlobalKey<NavigatorState>(),
    ),
    NavItemModel(
      icon: Icons.shopping_bag,
      label: (c) => c.l10n.settings,
      route: RouteMaps.notFoundRoute,
      key: GlobalKey<NavigatorState>(),
    ),
    NavItemModel(
      icon: Icons.settings,
      label: (c) => c.l10n.settings,
      route: RouteMaps.settingsRoute,
      key: GlobalKey<NavigatorState>(),
    ),
  ];
  int currentIndex = 0;
  Widget get content => TabSwitchingView(
      currentTabIndex: currentIndex,
      tabCount: _items.length,
      tabBuilder: (c, index) => Navigator(
          key: _items[index].key,
          initialRoute: _items[index].route,
          onUnknownRoute: (settings) =>
              MaterialPageRoute(builder: (_) => const NotFoundPage()),
          onGenerateRoute: onGenerateRoute));
  @override
  Widget build(BuildContext context) => Container(
      color: AppColors.primarySwatch,
      child: Scaffold(
          body: content,
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: CustomBottomBar(
            pageIndex: currentIndex,
            onTap: (p0) {
              currentIndex = p0;
              setState(() {});
            },
          )));
}

class NavItemModel {
  NavItemModel({
    required this.icon,
    required this.label,
    required this.route,
    required this.key,
  });
  final IconData icon;
  final String Function(BuildContext context) label;
  final String route;
  final GlobalKey<NavigatorState> key;
}
