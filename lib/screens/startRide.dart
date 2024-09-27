import 'package:flutter/material.dart';
import 'package:ride_sync/colours.dart';

class StartRide extends StatefulWidget {
  const StartRide({super.key});

  @override
  State<StartRide> createState() => _StartRideState();
}

class _StartRideState extends State<StartRide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Start Ride',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: deepGreen,
      ),
      body: Column(),
    );
  }
}
