import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ride_sync/colours.dart';
import 'package:ride_sync/screens/home.dart';
import 'package:ride_sync/widgets/custom_buttom.dart';

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
          crossAxisAlignment: CrossAxisAlignment.end,
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
                icon: Icon(
                  Icons.add,
                  color: deepGreen,
                  weight: 16,
                ),
                label: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Create Ride',
                    style: TextStyle(
                        color: deepGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Custom shape here
                  ),
                ),
              ),
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
          itemCount: 1,
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
        color: deepGreen.withOpacity(0.1),
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Icon(Icons.circle, color: Colors.green, size: 12),
                      SizedBox(height: 5),
                      Column(
                        children: List.generate(
                            3,
                            (index) => Icon(Icons.more_vert,
                                color: Colors.grey, size: 12)),
                      ),
                      SizedBox(height: 5),
                      Icon(Icons.location_on, color: Colors.red, size: 20),
                    ],
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MPQ5+7FX, Hompalaghatta, Karnataka 562106, India',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Christ University, Hosur Main Road, Bhavani Nagar, Post, Bengaluru, Karnataka, India',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
              right: 1,
              top: 3,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: color),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    status,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
