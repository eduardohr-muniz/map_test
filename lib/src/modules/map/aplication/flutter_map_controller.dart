import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_test/src/modules/map/aplication/usecases/add_marker_usecase.dart';
import 'package:map_test/src/modules/map/aplication/usecases/add_point_polygon_usecase.dart';
import 'package:map_test/src/modules/map/aplication/usecases/order_polygin_points_usecase.dart';
import 'package:map_test/src/modules/map/aplication/utils/map_utils.dart';

class FlutterMapController extends ChangeNotifier {
  final utils = MapUtils();

  addMarker(LatLng point) {
    List<Marker> markers = AddMarkerUsecase()(point: point, utils: utils);
    utils.markers.value = markers;
  }

  addPoint(LatLng point) {
    AddPointPolygonUsecase().call(point: point, utils: utils);
    var ordering = OrderPolyginPointsUsecase()(polygonPoints: utils.points);
    utils.points = ordering;
    notifyListeners();
  }

  removePointMarker(LatLng latLng) {
    utils.points.remove(latLng);
    var ordering = OrderPolyginPointsUsecase()(polygonPoints: utils.points);
    utils.points = ordering;
    notifyListeners();
  }
}
