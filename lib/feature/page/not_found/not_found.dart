import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yolcu360_kahve/core/base/base_widget.dart';
import 'package:route_map/route_map.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';
import 'package:yolcu360_kahve/core/res/icons.dart';
import 'package:yolcu360_kahve/core/res/l10n/l10n.dart';
import 'package:yolcu360_kahve/feature/page/not_found/not_found_vm.dart';

@RouteMap()
class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});
  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends BaseState<NotFoundViewModel, NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: AppColors.grey,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.grey,
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(AppDimens.m),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  AppIcons.warning,
                  color: AppColors.primarySwatch,
                  size: 50,
                ),
                Text(
                  context.l10n.lblNotFoundPage,
                  style: const TextStyle(
                    color: AppColors.primarySwatch,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
