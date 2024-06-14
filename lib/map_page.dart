import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _controller;
  double latitude = 7.8774222;
  double longitude = 80.7003428;
  LatLng googlePlex = LatLng(0, 0);

  @override
  void initState() {
    super.initState();
    FirebaseDatabase.instance.ref().child("latitude").onValue.listen((event) {
      setState(() {
        latitude = double.parse(event.snapshot.value.toString());
        googlePlex = LatLng(latitude, longitude);
        _controller?.animateCamera(CameraUpdate.newLatLng(googlePlex));
      });
    });
    FirebaseDatabase.instance.ref().child("longitude").onValue.listen((event) {
      setState(() {
        longitude = double.parse(event.snapshot.value.toString());
        googlePlex = LatLng(latitude, longitude);
        _controller?.animateCamera(CameraUpdate.newLatLng(googlePlex));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        initialCameraPosition: CameraPosition(target: googlePlex, zoom: 20),
        markers: {
          Marker(
            markerId: MarkerId("Pet's Location"),
            icon: BitmapDescriptor.defaultMarker,
            position: googlePlex,
          )
        },
      ),
    );
  }
}
