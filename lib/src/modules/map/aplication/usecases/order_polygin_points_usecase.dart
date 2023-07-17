import 'package:latlong2/latlong.dart';
import 'package:map_test/src/modules/map/aplication/usecases/calculate_angle_polygon_usecase.dart';

class OrderPolyginPointsUsecase {
  List<LatLng> call({required List<LatLng> polygonPoints}) {
    var calculateAnglePolygonUsecase = CalculateAnglePolygonUsecase();
    // Esse cara encontra o ponto central do polígono
    double sumLat = 0;
    double sumLng = 0;
    for (final point in polygonPoints) {
      sumLat += point.latitude;
      sumLng += point.longitude;
    }
    final centerLat = sumLat / polygonPoints.length;
    final centerLng = sumLng / polygonPoints.length;
    final center = LatLng(centerLat, centerLng);

    // Esse cara ordena os pontos pelo ângulo que eles formam em relação ao ponto central
    polygonPoints.sort((a, b) {
      final angleA = calculateAnglePolygonUsecase(center, a);
      final angleB = calculateAnglePolygonUsecase(center, b);
      return angleA.compareTo(angleB);
    });

    return polygonPoints;
  }
}
