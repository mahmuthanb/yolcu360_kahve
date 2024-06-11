// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

// Project imports:
import 'package:yolcu360_kahve/core/base/base_view_model.dart';
import 'package:yolcu360_kahve/core/res/assets.gen.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/util/formatter.dart';
import 'package:yolcu360_kahve/feature/data/repository/app_repository.dart';

@injectable
class OrderStatusViewModel extends BaseViewModel {
  final AppRepository _appRepository;
  OrderStatusViewModel(this._appRepository);

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  set setIsLoading(bool data) {
    _isLoading = data;
  }

  var userPhotoUrl = "https://picsum.photos/400";
  String urlTemplate = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
  LatLng yolcu360Hq = const LatLng(41.002663591970276, 29.07182584047572);
  LatLng unalanMetro = const LatLng(40.99851198686524, 29.061593184136033);
  List<LatLng> routpoints = [];
  PolylineLayer polLineLayer = const PolylineLayer(polylines: []);
  String latLonText = "";

  // 0 means first level
  int _statusLevel = 0;
  int get statusLevel => _statusLevel;
  setStatus() {
    _statusLevel = _statusLevel++;
    notifyListeners();
  }

  getWayPoints() async {
    latLonText = '${yolcu360Hq.stringify()};${unalanMetro.stringify()}';
    var response2 = await _appRepository.getDrivingRoute(latLonText);
    var ruter = response2.routes.first.geometry.coordinates;
    for (int i = 0; i < ruter.length; i++) {
      var reep = ruter[i].toString();
      reep = reep.replaceAll("[", "");
      reep = reep.replaceAll("]", "");
      var lat1 = reep.split(',');
      var long1 = reep.split(",");
      routpoints.add(LatLng(double.parse(lat1[1]), double.parse(long1[0])));
    }
    setIsLoading = false;
    notifyListeners();
  }

  late final customMarkers = <Marker>[
    buildHq(yolcu360Hq),
    buildPin(unalanMetro),
  ];
  Marker buildPin(LatLng point) => Marker(
        point: point,
        width: 50,
        height: 50,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.white),
          child: SvgPicture.asset(AppAssets.images.motorbikeDelivery),
        ),
      );
  Marker buildHq(LatLng point) => Marker(
        point: point,
        width: 50,
        height: 50,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AppAssets.images.phYolcu360.provider(),
            ),
          ),
        ),
      );
}
