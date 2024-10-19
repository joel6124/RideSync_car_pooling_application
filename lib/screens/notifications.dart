import 'package:flutter/material.dart';
import 'package:ride_sync/colours.dart';
import 'package:ride_sync/screens/startRide.dart'; // Custom colors

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Seat Request',
      'message': 'Kevin has requested 2 seats in your pool.',
      'time': '23 Sep, 2024 5:30 PM',
      'type': 'request',
      'requestedSeats': 2,
      'senderName': 'Kevin',
      'status': 'pending',
    },
    {
      'title': 'Seat Request Confirmed',
      'message': 'Your seat request has been accepted!',
      'time': '23 Sep, 2024 6:00 PM',
      'type': 'confirmed',
      'senderName': 'Rony',
      'status': 'confirmed',
    },
    {
      'title': 'Seat Request Declined',
      'message': 'Rayn has declined your request for 2 seats.',
      'time': '23 Sep, 2024 6:05 PM',
      'type': 'declined',
      'senderName': 'Rayn',
    },
    {
      'title': 'New Ride Offer',
      'message':
          'A new ride is available from Christ University to City Chandapura Check it out!',
      'time': '24 Sep, 2024 8:00 AM',
      'type': 'ride_offer',
      'senderName': 'ride_offer_123',
    },
    {
      'title': 'Ride Canceled',
      'message': 'The user who offered the ride has canceled the ride.',
      'time': '24 Sep, 2024 10:30 AM',
      'type': 'ride_canceled',
      'senderName': 'Jerry',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: deepGreen,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          final notificationType = notification['type'];
          switch (notificationType) {
            case 'request':
              return _buildSeatRequestNotification(notification);
            case 'confirmed':
              return _buildConfirmationNotification(notification, true);
            case 'declined':
              return _buildConfirmationNotification(notification, false);
            case 'ride_offer':
              return _buildRideOfferNotification(notification);
            case 'ride_canceled':
              return _buildCanceledNotification(notification);

            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildSeatRequestNotification(Map<String, dynamic> notification) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: deepGreen.withOpacity(0.1),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 25,
              child: Icon(
                Icons.event_seat,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification['title']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification['message']!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    notification['time']!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('Seat Request Accepted');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: deepGreen,
                        ),
                        child: const Text(
                          'Accept',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          print('Seat Request Declined');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor:
                              const Color.fromARGB(255, 152, 18, 8),
                        ),
                        child: const Text(
                          'Decline',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build a seat confirmation or decline notification (for Rider)
  Widget _buildConfirmationNotification(
      Map<String, dynamic> notification, bool isAccepted) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: deepGreen.withOpacity(0.1),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: isAccepted ? Colors.green : Colors.red,
                  radius: 25,
                  child: Icon(
                    isAccepted
                        ? Icons.check_circle_outline
                        : Icons.cancel_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification['title']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notification['message']!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        notification['time']!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // if (isAccepted)
            //   ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => StartRide(
            //                   isOfferer: true,
            //                   startTime: 'ygyg',
            //                   endTime: 'kjjn',
            //                   duration: 'kok',
            //                   amount: 1515,
            //                 )),
            //       );
            //     },
            //     style: ElevatedButton.styleFrom(
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(8)),
            //       backgroundColor: deepGreen,
            //     ),
            //     child: const Text(
            //       'Start Ride',
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold, color: Colors.white),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }

  // Widget to build a ride offer notification (for potential Riders)
  Widget _buildRideOfferNotification(Map<String, dynamic> notification) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: deepGreen.withOpacity(0.1),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.purple,
              radius: 25,
              child: Icon(
                Icons.directions_car,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification['title']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification['message']!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    notification['time']!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCanceledNotification(Map<String, dynamic> notification) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: deepGreen.withOpacity(0.1),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.red,
              radius: 25,
              child: Icon(
                Icons.cancel_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification['title']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification['message']!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    notification['time']!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
