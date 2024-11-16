import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapDraw extends StatefulWidget {
  const MapDraw({super.key});

  @override
  State<MapDraw> createState() => _MapDrawState();
}

class _MapDrawState extends State<MapDraw> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  LatLng? currentPosition;

  @override
  void initState() {
    super.initState();
    Geolocator.getCurrentPosition().then((location) {
      setState(() {
        currentPosition = LatLng(location.latitude, location.longitude);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPosition == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(target: currentPosition!),
              mapType: MapType.hybrid,
              onMapCreated: (controller) {
                _controller.complete(controller);
              },
            ),
    );
  }
}
