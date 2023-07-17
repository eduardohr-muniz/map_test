import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});
  @override
  Widget build(BuildContext context) {
    const myPositon = LatLng(46.497488, -73.979681);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: myPositon,
          zoom: 13.0,
          minZoom: 5,
          maxZoom: 20,
        ),
        nonRotatedChildren: [
          TileLayer(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/eduardohrmuniz/clk5lkar602a101pc3if2e5k5/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZWR1YXJkb2hybXVuaXoiLCJhIjoiY2xpNG9rdGtxMmU2NTNucDlndmsyczFnNiJ9.CNYt7belU4xgeBx_6bz1Kw",
            additionalOptions: const {
              'accessToen': 'pk.eyJ1IjoiZWR1YXJkb2hybXVuaXoiLCJhIjoiY2xpNG9rdGtxMmU2NTNucDlndmsyczFnNiJ9.CNYt7belU4xgeBx_6bz1Kw',
              'id': 'mapbox.mapbox-streets-v8'
            },
          ),
        ],
      ),
    );
  }
}
