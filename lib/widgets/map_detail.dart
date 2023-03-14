import 'dart:async';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapDetail extends StatefulWidget {
  final String locId;
  const MapDetail({required this.locId});

  @override
  State<MapDetail> createState() => _MapDetailState();
}

class _MapDetailState extends State<MapDetail> {
  late GoogleMapController mapController;
  LatLng? currentPosition;
  GeoPoint? _geoPoint;

  static final CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(-7.780883969201934, 110.37561674185413),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _getGeoPoint();
  }

  void _getGeoPoint() async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('orphanage')
            .doc(widget.locId)
            .get();
    setState(() {
      _geoPoint = documentSnapshot.get('location');
      currentPosition = _geoPoint != null
          ? LatLng(_geoPoint!.latitude, _geoPoint!.longitude)
          : LatLng(-7.780883969201934, 110.37561674185413);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Scaffold(
          body: currentPosition != null
              ? GoogleMap(
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                      mapController = controller;
                    });
                  },
                  markers: {
                    Marker(
                      markerId: MarkerId('orphanage'),
                      infoWindow: InfoWindow(title: "Orphanage"),
                      position: currentPosition!,
                    ),
                  },
                  initialCameraPosition: CameraPosition(
                    target: currentPosition!,
                    zoom: 13.4746,
                  ),
                )
              : Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    'There is no recorded location for this orphanage \nPlease manually search the location through the orphanage\'s website',
                    style: TextStyle(
                      color: Color.fromRGBO(77, 77, 77, 1),
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Nunito',
                      fontSize: 14,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
