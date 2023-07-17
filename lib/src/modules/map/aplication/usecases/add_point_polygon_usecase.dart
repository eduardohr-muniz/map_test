import 'package:latlong2/latlong.dart';
import '../utils/map_utils.dart';

class AddPointPolygonUsecase {
  call({required LatLng point, required MapUtils utils}) {
    utils.points.add(point);
  }
}
