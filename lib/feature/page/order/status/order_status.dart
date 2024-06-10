import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
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
          child: Stack(children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: FlutterMap(
                mapController: MapController(),
                options: const MapOptions(
                  initialCenter: LatLng(41.00264914876056, 29.071838599282493),
                  initialZoom: 14,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    rotate: true,
                    markers: [
                      viewModel.customMarkers[0],
                      viewModel.customMarkers[1],
                    ],
                  ),
                  PolylineLayer(
                    polylines: [Polyline(points: viewModel.getCoordinates)],
                  )
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
          ]),
        ),
      ),
    );
  }
}
