import 'package:flutter/material.dart';
import 'package:map_test/src/modules/map/ui/map_marker_page.dart';
import 'package:map_test/src/modules/map/ui/map_page.dart';
import 'package:map_test/src/modules/map/ui/map_polygon_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map',
      initialRoute: "/polygon/",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const MapPage(),
        "/marker/": (context) => const MapMarkerPage(),
        "/polygon/": (context) => const MapPolygonPage(),
      },
    );
  }
}
