import 'package:flutter/material.dart';
import 'package:ride_sync/colours.dart';

class MyVehicle extends StatelessWidget {
  const MyVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'My Vehicle',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        backgroundColor: deepGreen,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
