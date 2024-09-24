import 'package:flutter/material.dart';
import 'package:ride_sync/colours.dart';

class ResultOfferPool extends StatefulWidget {
  const ResultOfferPool({super.key});

  @override
  State<ResultOfferPool> createState() => _ResultOfferpoolState();
}

class _ResultOfferpoolState extends State<ResultOfferPool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text(
            'Matching Riders',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          backgroundColor: deepGreen,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarpoolOfferCard(
                  profilePic:
                      'https://icon-library.com/images/user-icon-jpg/user-icon-jpg-0.jpg',
                  name: 'Joel Jino',
                  rating: 4.5,
                  totalPools: 7,
                  time: " 2:33 pm",
                  walk_1_dist: "820 m",
                  ride_dist: '14.13 km',
                  walk_2_dist: "160 m",
                  totalCo2Saved: 68.5),
              CarpoolOfferCard(
                  profilePic:
                      'https://icon-library.com/images/user-icon-jpg/user-icon-jpg-0.jpg',
                  name: 'Jerrin Thomas',
                  rating: 3.9,
                  totalPools: 11,
                  time: " 7:15 am",
                  walk_1_dist: "770 m",
                  ride_dist: '10.50 km',
                  walk_2_dist: "110 m",
                  totalCo2Saved: 55),
              CarpoolOfferCard(
                  profilePic:
                      'https://icon-library.com/images/user-icon-jpg/user-icon-jpg-0.jpg',
                  name: 'Rony Thomas',
                  rating: 4.1,
                  totalPools: 18,
                  time: " 7:15 pm",
                  walk_1_dist: "770 m",
                  ride_dist: '21.50 km',
                  walk_2_dist: "110 m",
                  totalCo2Saved: 65),
              CarpoolOfferCard(
                  profilePic:
                      'https://icon-library.com/images/user-icon-jpg/user-icon-jpg-0.jpg',
                  name: 'Jerrin Thomas',
                  rating: 3.9,
                  totalPools: 11,
                  time: " 7:15 am",
                  walk_1_dist: "770 m",
                  ride_dist: '10.50 km',
                  walk_2_dist: "110 m",
                  totalCo2Saved: 55),
            ],
          ),
        ));
  }
}

class CarpoolOfferCard extends StatelessWidget {
  final String profilePic;
  final String name;
  final double rating;
  final int totalPools;
  final String time;
  final String walk_1_dist;
  final String ride_dist;
  final String walk_2_dist;
  final double totalCo2Saved;

  CarpoolOfferCard(
      {super.key,
      required this.profilePic,
      required this.name,
      required this.rating,
      required this.totalPools,
      required this.time,
      required this.walk_1_dist,
      required this.ride_dist,
      required this.walk_2_dist,
      required this.totalCo2Saved});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          color: deepGreen.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(profilePic),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.verified_user_sharp,
                            color: Colors.green,
                            size: 18,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Text(
                            rating.toString(),
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            totalPools.toString(),
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.access_time, size: 16),
                          Text(time),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  //   decoration: BoxDecoration(
                  //     color: Colors.green[50],
                  //     borderRadius: BorderRadius.circular(5),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Text('Full match'),
                  //       SizedBox(width: 5),
                  //       Icon(Icons.star, color: Colors.amber, size: 16),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 16),

              // Distance and Route Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.directions_walk, size: 20),
                      Text(walk_1_dist, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  // Icon(Icons.more_horiz),
                  Icon(Icons.double_arrow),
                  Column(
                    children: [
                      Icon(Icons.directions_car, size: 20),
                      Text(ride_dist, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Icon(Icons.double_arrow),
                  Column(
                    children: [
                      Icon(Icons.directions_walk, size: 20),
                      Text(walk_2_dist, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.eco, color: Colors.green),
                      Text(
                        ' $totalCo2Saved kg CO2 saved',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Offer a seat',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: deepGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
