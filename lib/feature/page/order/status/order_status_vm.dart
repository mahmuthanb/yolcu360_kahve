import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:latlong2/latlong.dart';
import 'package:yolcu360_kahve/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:yolcu360_kahve/core/res/assets.gen.dart';
import 'package:yolcu360_kahve/core/util/polyline_ex.dart';

@injectable
class OrderStatusViewModel extends BaseViewModel {
  OrderStatusViewModel();

  late final customMarkers = <Marker>[
    buildHq(const LatLng(41.002663591970276, 29.07182584047572)),
    buildPin(const LatLng(40.99851198686524, 29.061593184136033)),
  ];
  Marker buildPin(LatLng point) => Marker(
        point: point,
        width: 60,
        height: 60,
        child: const Icon(Icons.location_pin, size: 60, color: Colors.black),
      );
  Marker buildHq(LatLng point) => Marker(
        point: point,
        width: 50,
        height: 50,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            image: DecorationImage(
              image: AppAssets.images.phYolcu360.provider(),
            ),
          ),
        ),
      );
  List<num> unalanMetro = [40.99851198686524, 29.061593184136033];
  List<num> yolcu360Hq = [41.002663591970276, 29.07182584047572];

  final coords = encodePolyline([
    [40.99851198686524, 29.061593184136033],
    [41.002663591970276, 29.07182584047572]
  ]);
  List<LatLng> get getCoordinates => decodePolyline(coords).unpackPolyline();
}
