import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_test/src/modules/map/aplication/flutter_map_controller.dart';
import 'package:map_test/src/modules/map/ui/widgets/dot_marker_icon.dart';

class MapPolygonPage extends StatefulWidget {
  const MapPolygonPage({super.key});

  @override
  State<MapPolygonPage> createState() => _MapPolygonPageState();
}

class _MapPolygonPageState extends State<MapPolygonPage> {
  final mapController = MapController();

  final controller = FlutterMapController();
  @override
  Widget build(BuildContext context) {
    double lat = 51.5;
    double lon = -0.09;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Polygon'),
      ),
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return Column(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height - 56,
                  child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      // interactiveFlags: InteractiveFlag.none, // Esse cara é responsável por deixar ou não fazer o scroll do mapa
                      screenSize: const Size(300, 500),
                      center: LatLng(lat, lon),
                      zoom: 12,
                      minZoom: 10,
                      maxZoom: 15,
                      onTap: (tapPosition, point) {
                        controller.addPoint(point);
                      },
                    ),
                    nonRotatedChildren: [
                      TileLayer(
                        urlTemplate:
                            "https://api.mapbox.com/styles/v1/eduardohrmuniz/clk5lkar602a101pc3if2e5k5/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZWR1YXJkb2hybXVuaXoiLCJhIjoiY2xpNG9rdGtxMmU2NTNucDlndmsyczFnNiJ9.CNYt7belU4xgeBx_6bz1Kw",
                        additionalOptions: const {
                          'accessToen':
                              'pk.eyJ1IjoiZWR1YXJkb2hybXVuaXoiLCJhIjoiY2xpNG9rdGtxMmU2NTNucDlndmsyczFnNiJ9.CNYt7belU4xgeBx_6bz1Kw',
                          'id': 'mapbox.mapbox-streets-v8'
                        },
                      ),
                      PolygonLayer(
                        polygons: [
                          Polygon(
                              borderColor: Colors.blue,
                              borderStrokeWidth: 3,
                              disableHolesBorder: false,
                              label: "DOM BOSCO",
                              labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              isFilled: true,
                              color: Colors.blue.withOpacity(0.2),
                              points: controller.utils.points)
                        ],
                      ),
                      MarkerLayer(
                        markers: controller.utils.points
                            .map((e) => Marker(
                                  width: 18,
                                  height: 18,
                                  point: e,
                                  builder: (context) => DotMarkerIcon(
                                    latLng: e,
                                    onDoubleTap: () => controller.removePointMarker(e),
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
