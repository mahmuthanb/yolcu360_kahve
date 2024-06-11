import 'package:json_annotation/json_annotation.dart';
part 'driving_route_model.g.dart';

@JsonSerializable()
class DrivingRouteModel {
  String code;
  List<Route> routes;
  List<Waypoint> waypoints;

  DrivingRouteModel({
    required this.code,
    required this.routes,
    required this.waypoints,
  });

  factory DrivingRouteModel.fromJson(Map<String, dynamic> json) {
    return _$DrivingRouteModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DrivingRouteModelToJson(this);
}

@JsonSerializable()
class Route {
  Geometry geometry;
  Route({
    required this.geometry,
  });
  factory Route.fromJson(Map<String, dynamic> json) {
    return _$RouteFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RouteToJson(this);
}

@JsonSerializable()
class Geometry {
  List<List<double>> coordinates;
  String type;

  Geometry({
    required this.coordinates,
    required this.type,
  });
  factory Geometry.fromJson(Map<String, dynamic> json) {
    return _$GeometryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}

@JsonSerializable()
class Waypoint {
  String hint;
  double distance;
  String name;
  List<double> location;

  Waypoint({
    required this.hint,
    required this.distance,
    required this.name,
    required this.location,
  });
  factory Waypoint.fromJson(Map<String, dynamic> json) {
    return _$WaypointFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WaypointToJson(this);
}
