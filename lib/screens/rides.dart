import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ride_sync/colours.dart';

class RidesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'My Rides',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: deepGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            buildRideSection('Upcoming Rides', Colors.amber, "Upcoming"),
            buildRideSection('Completed Rides', Colors.green, "Completed"),
            buildRideSection('Cancelled Rides', Colors.red, "Cancelled"),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRideSection(String title, Color color, String status) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return RideCard(color: color, status: status);
          },
        ),
      ],
    );
  }
}

class RideCard extends StatelessWidget {
  final Color color;
  final String status;

  RideCard({super.key, required this.color, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ride details here
              Text(
                'SAT 03, AUG',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: titleGrey),
              ),
              Text(
                '11:30 AM',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Anekal',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 28, 108, 30),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(size: 28, Icons.arrow_right_alt),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Christ University',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 181, 24, 12),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
              right: 1,
              top: 3,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25),
                    color: color),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    status,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ))
        ],
      ),

      // ... other ride details
    );
  }
}
