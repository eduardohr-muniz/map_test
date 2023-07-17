import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_test/src/modules/map/aplication/utils/map_utils.dart';
import 'package:map_test/src/modules/map/ui/widgets/marker_icon.dart';

class AddMarkerUsecase {
  List<Marker> call({required LatLng point, required MapUtils utils}) {
    List<Marker> markers = [];
    final marker =
        Marker(anchorPos: AnchorPos.exactly(Anchor(-3, -11)), width: 9, height: 9, point: point, builder: (context) => const MarkerIcon());
    markers.add(marker);
    markers.addAll(utils.markers.value);
    return markers;
  }
}
