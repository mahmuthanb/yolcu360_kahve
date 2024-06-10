import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yolcu360_kahve/core/base/base_widget.dart';
import 'package:route_map/route_map.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';
import 'package:yolcu360_kahve/feature/page/order/status/order_status_vm.dart';

@RouteMap()
class OrderStatusPage extends StatefulWidget {
  const OrderStatusPage({super.key});
  @override
  State<OrderStatusPage> createState() => _OrderStatusPageState();
}

class _OrderStatusPageState
    extends BaseState<OrderStatusViewModel, OrderStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          systemNavigationBarColor: AppColors.grey,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.l),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppDimens.s),
                      ),
                      padding: const EdgeInsets.all(AppDimens.s),
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: AppColors.black,
                          size: 35,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppDimens.s),
                      ),
                      padding: const EdgeInsets.all(AppDimens.s),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.my_location,
                          color: AppColors.black,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
