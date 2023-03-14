import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapT extends StatefulWidget {
  const MapT({Key? key}) : super(key: key);

  @override
  _MapTState createState() => _MapTState();
}

class _MapTState extends State<MapT> {
  late GoogleMapController mapController;
  late LatLng currentPosition;

  static final CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(0, 0),
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
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
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
              position: currentPosition,
            ),
        },
      ),
    );
  }
}
