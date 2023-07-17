import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapUtils {
  final markers = ValueNotifier(<Marker>[]);
  List<LatLng> points = [];
}
