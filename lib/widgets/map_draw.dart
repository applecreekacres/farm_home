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

  LatLng? currentPosition = LatLng(46.7730432, -100.6764032);

  @override
  void initState() {
    super.initState();
    // Geolocator.getCurrentPosition().then((location) {
    //   setState(() {
    //     currentPosition = LatLng(location.latitude, location.longitude);
    //   });
    // });
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
              zoomControlsEnabled: true,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              onMapCreated: (controller) {
                _controller.complete(controller);
              },
            ),
    );
  }
}
