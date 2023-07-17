import 'dart:math';
import 'package:latlong2/latlong.dart';

class CalculateAnglePolygonUsecase {
  double call(LatLng center, LatLng point) {
    final latDiff = point.latitude - center.latitude;
    final lngDiff = point.longitude - center.longitude;
    final angle = (180.0 / pi) * atan2(latDiff, lngDiff);
    return angle >= 0 ? angle : angle + 360.0;
  }
}
