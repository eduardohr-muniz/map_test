import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_test/src/modules/map/aplication/flutter_map_controller.dart';

class MapMarkerPage extends StatefulWidget {
  const MapMarkerPage({super.key});

  @override
  State<MapMarkerPage> createState() => _MapMarkerPageState();
}

class _MapMarkerPageState extends State<MapMarkerPage> {
  final mapController = MapController();

  final controller = FlutterMapController();
  @override
  Widget build(BuildContext context) {
    double lat = 51.5;
    double lon = -0.09;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marker'),
      ),
      body: ValueListenableBuilder(
          valueListenable: controller.utils.markers,
          builder: (context, markers, __) {
            return Column(
              children: [
                Text(markers.length.toString()),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height - 76,
                  child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      // interactiveFlags: InteractiveFlag.none, // Esse cara é responsável por deixar ou não fazer o scroll do mapa
                      enableScrollWheel: false,
                      screenSize: const Size(300, 500),
                      center: LatLng(lat, lon),
                      zoom: 12,
                      minZoom: 10,
                      maxZoom: 15,
                      onTap: (tapPosition, point) {
                        controller.addMarker(point);
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
                      MarkerLayer(markers: markers)
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
