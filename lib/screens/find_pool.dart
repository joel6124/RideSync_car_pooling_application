import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_sync/colours.dart';

class FindPool extends StatefulWidget {
  const FindPool({super.key});

  @override
  State<FindPool> createState() => _FindPoolState();
}

class _FindPoolState extends State<FindPool> {
  final Completer<GoogleMapController> controllerGoogleMap =
      Completer<GoogleMapController>();
  GoogleMapController? newGoogleMapController;

  Position? currentPosition;
  String? currentAddress;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Find Pool',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: deepGreen,
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            width: double.infinity,
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;
              },
            ),
          ),
          Container(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.clear),
                    labelText: 'Outlined',
                    hintText: 'hint text',
                    helperText: 'supporting text',
                    border: OutlineInputBorder(),
                  ),
                )
              ],
            ),
          )
          //Map,
          //textFields for input of details
        ],
      ),
    );
  }
}
