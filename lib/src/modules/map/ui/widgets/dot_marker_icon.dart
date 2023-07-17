import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class DotMarkerIcon extends StatefulWidget {
  final LatLng latLng;
  final void Function()? onDoubleTap;

  const DotMarkerIcon({
    Key? key,
    required this.latLng,
    this.onDoubleTap,
  }) : super(key: key);

  @override
  State<DotMarkerIcon> createState() => _DotMarkerIconState();
}

class _DotMarkerIconState extends State<DotMarkerIcon> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onHover: (value) {
          setState(() {
            hover = value;
          });
        },
        onDoubleTap: widget.onDoubleTap,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              ),
            ),
            Visibility(
              visible: hover,
              child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      child: const Icon(
                        Icons.close,
                        size: 10,
                        color: Colors.red,
                      ))),
            ),
          ],
        ));
  }
}
