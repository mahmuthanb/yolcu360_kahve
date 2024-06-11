// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_map/route_map.dart';

// Project imports:
import 'package:yolcu360_kahve/core/base/base_widget.dart';
import 'package:yolcu360_kahve/core/res/assets.gen.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';
import 'package:yolcu360_kahve/core/util/image_network.dart';
import 'package:yolcu360_kahve/feature/page/order/status/order_status_vm.dart';
import 'package:yolcu360_kahve/feature/page/order/status/widgets/status_bar.dart';

@RouteMap()
class OrderStatusPage extends StatefulWidget {
  const OrderStatusPage({super.key});
  @override
  State<OrderStatusPage> createState() => _OrderStatusPageState();
}

class _OrderStatusPageState
    extends BaseState<OrderStatusViewModel, OrderStatusPage> {
  @override
  void initState() {
    viewModel.getWayPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent),
        child: SafeArea(
          top: false,
          bottom: false,
          child: Stack(
            children: [
              if (!viewModel.isLoading)
                SizedBox(
                  width: size.width,
                  height: size.height * .7,
                  child: FlutterMap(
                    mapController: MapController(),
                    options: MapOptions(
                      initialCenter: viewModel.yolcu360Hq,
                      initialZoom: 14,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: viewModel.urlTemplate,
                        userAgentPackageName: 'com.example.app',
                      ),
                      PolylineLayer(polylines: [
                        Polyline(
                          points: viewModel.routpoints,
                          color: AppColors.primarySwatch,
                          strokeWidth: 5,
                        )
                      ]),
                      MarkerLayer(
                        rotate: true,
                        markers: [
                          viewModel.customMarkers[0],
                          viewModel.customMarkers[1],
                        ],
                      ),
                    ],
                  ),
                ),
              SafeArea(
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
                      ),
                    ],
                  ),
                ),
              ),
              DraggableScrollableSheet(
                maxChildSize: .5,
                minChildSize: .325,
                initialChildSize: .325,
                builder: (BuildContext context, myscrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimens.l),
                      color: AppColors.white,
                    ),
                    padding: const EdgeInsets.all(AppDimens.l),
                    height: size.height * .5,
                    child: Column(
                      children: [
                        const Text(
                          '10 Minutes Left',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 18,
                            ),
                            text: 'Delivery to ',
                            children: [
                              TextSpan(
                                text: 'JI.Kpg Sutoyo',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: AppDimens.m,
                            ),
                            width: size.width,
                            height: size.height * .01,
                            child: Row(
                              children: [
                                StatusBarWidget(
                                  index: 0,
                                  activeIndex: viewModel.statusLevel,
                                ),
                                const SizedBox(width: AppDimens.s),
                                StatusBarWidget(
                                  index: 1,
                                  activeIndex: viewModel.statusLevel,
                                ),
                                const SizedBox(width: AppDimens.s),
                                StatusBarWidget(
                                  index: 2,
                                  activeIndex: viewModel.statusLevel,
                                ),
                                const SizedBox(width: AppDimens.s),
                                StatusBarWidget(
                                  index: 3,
                                  activeIndex: viewModel.statusLevel,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppDimens.s,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppDimens.m,
                              ),
                              border: Border.all(
                                color: AppColors.semiGrey,
                                width: 2,
                              )),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppDimens.l),
                                child: Transform.scale(
                                  scaleX: -1,
                                  child: SvgPicture.asset(
                                    AppAssets.images.motorbikeDelivery,
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Delivered your order",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "We deliver your goods to you in the shortes possible time.",
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding:
                              const EdgeInsets.symmetric(vertical: AppDimens.m),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.semiGrey,
                                    width: 2,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(AppDimens.m),
                                ),
                                width: size.width * .125,
                                height: size.width * .125,
                                child: ImageNetwork(
                                    imageUrl: viewModel.userPhotoUrl),
                              ),
                              const SizedBox(width: AppDimens.s),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Johan Hawn"),
                                  Text("Personal Courier"),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.semiGrey,
                                    width: 2,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(AppDimens.m),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.phone_in_talk_rounded,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
