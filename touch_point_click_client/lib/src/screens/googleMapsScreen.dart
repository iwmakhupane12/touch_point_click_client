import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  @override
  _GoogleMapsScreenState createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  Completer<GoogleMapController> _mapController = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Search here..."),
          ),
          Container(
            height: 300.0,
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _mapController.complete(controller);
              },
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(29.2673, 26.7261),
                zoom: 14.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
