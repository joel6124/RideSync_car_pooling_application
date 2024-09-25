import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ride_sync/colours.dart';

class ResultFindPool extends StatefulWidget {
  const ResultFindPool({super.key});

  @override
  State<ResultFindPool> createState() => _ResultFindPoolState();
}

class _ResultFindPoolState extends State<ResultFindPool> {
  final _poolOffers = FirebaseFirestore.instance.collection('PoolOffers');
  final _users = FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Matching Ride Givers',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: deepGreen,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _poolOffers.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> poolSnapshot) {
                if (poolSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: deepGreen,
                    ),
                  );
                }
                if (poolSnapshot.hasData &&
                    poolSnapshot.data!.docs.isNotEmpty) {
                  List<Future<DocumentSnapshot>> userDetails =
                      poolSnapshot.data!.docs.map((poolOfferSnapshot) {
                    return _users.doc(poolOfferSnapshot['userId']).get();
                  }).toList();

                  return FutureBuilder(
                    future: Future.wait(userDetails),
                    builder: (context,
                        AsyncSnapshot<List<DocumentSnapshot>> userSnapshots) {
                      if (userSnapshots.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: deepGreen,
                          ),
                        );
                      }

                      if (userSnapshots.hasData) {
                        return ListView.builder(
                          itemCount: poolSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot poolOfferSnapshot =
                                poolSnapshot.data!.docs[index];
                            final DocumentSnapshot userSnapshot =
                                userSnapshots.data![index];

                            final userData =
                                userSnapshot.data() as Map<String, dynamic>;

                            return CarpoolOfferCard(
                              profilePic: userData['imgURL'] ??
                                  'https://icon-library.com/images/user-icon-jpg/user-icon-jpg-0.jpg',
                              name: userData['name'],
                              rating: (userData['rating'] is int)
                                  ? userData['rating'].toDouble()
                                  : userData['rating'] ?? 0.0,
                              totalPools: userData['totalPools'] ?? 0,
                              time: DateFormat('HH:mm')
                                  .format(poolOfferSnapshot['time'].toDate()),
                              walk_1_dist: '820 m', // Hardcoded for now
                              ride_dist: '14.13 km', // Hardcoded for now
                              walk_2_dist: '160 m', // Hardcoded for now
                              totalCo2Saved: (userData['totalCo2Saved'] is int)
                                  ? userData['totalCo2Saved'].toDouble()
                                  : userData['totalCo2Saved'] ?? 0.0,
                              isVerifiedGender: false,
                            );
                          },
                        );
                      }

                      return const Text('Error fetching user data');
                    },
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.directions_car,
                          color: lightGreen,
                          size: 100,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'No matching offers found!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: deepGreen,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Try searching again later!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
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
  final bool isVerifiedGender;

  CarpoolOfferCard({
    required this.profilePic,
    required this.name,
    required this.rating,
    required this.totalPools,
    required this.time,
    required this.walk_1_dist,
    required this.ride_dist,
    required this.walk_2_dist,
    required this.totalCo2Saved,
    required this.isVerifiedGender,
  });

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
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(profilePic),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          isVerifiedGender
                              ? const Icon(
                                  Icons.verified_user_sharp,
                                  color: Colors.green,
                                  size: 18,
                                )
                              : const Row(
                                  children: [
                                    Icon(
                                      Icons.error_outline,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      'Gender Not Verified',
                                      style: TextStyle(
                                          color: titleGrey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          Text(
                            rating.toString(),
                            style: const TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            '$totalPools Pools',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.access_time, size: 16),
                          Text(time),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.directions_walk, size: 20),
                      Text(walk_1_dist, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  const Icon(Icons.double_arrow),
                  Column(
                    children: [
                      const Icon(Icons.directions_car, size: 20),
                      Text(ride_dist, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  const Icon(Icons.double_arrow),
                  Column(
                    children: [
                      const Icon(Icons.directions_walk, size: 20),
                      Text(walk_2_dist, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.eco, color: Colors.green),
                      Text(
                        ' $totalCo2Saved kg CO2 saved',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Request Seat',
                        style: TextStyle(color: Colors.white)),
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
