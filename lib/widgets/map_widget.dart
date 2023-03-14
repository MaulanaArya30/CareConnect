import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
  });

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;
  LatLng? currentPosition;

  static final CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(-7.780883969201934, 110.37561674185413),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _getCurrentLocation().then((position) {
      setState(() {
        currentPosition = LatLng(position.latitude, position.longitude);
      });
    });
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location service not enabled';
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Location permission denied';
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  Widget build(BuildContext context) {
    if (currentPosition == null) {
      return Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color.fromRGBO(254, 250, 238, 1),
        ),
        child: Text(
          textAlign: TextAlign.center,
          'You did not gave permission to your location \nPlease allow permission in the settings of your device \nIf you have enabled it, please wait a bit...',
          style: TextStyle(
            color: Color.fromRGBO(77, 77, 77, 1),
            fontWeight: FontWeight.w800,
            fontFamily: 'Nunito',
            fontSize: 14,
          ),
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        height: 140,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Scaffold(
            body: Container(
              child: GoogleMap(
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  setState(() {
                    mapController = controller;
                  });
                },
                markers: {
                  if (currentPosition != null)
                    Marker(
                      markerId: MarkerId('current'),
                      infoWindow: InfoWindow(title: "Your Location"),
                      position: currentPosition!,
                    ),

                  //deviceLocationMarker,
                  // _kLakeMarker,
                },
                // polylines: {
                //   _kPolyline,
                // },
                // polygons: {
                //   _kPolygon,
                // },
                initialCameraPosition: CameraPosition(
                  target: currentPosition!,
                  zoom: 13.4746,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
