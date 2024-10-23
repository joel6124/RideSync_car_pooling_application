// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:ride_sync/colours.dart';

// class EcoDashboardScreen extends StatefulWidget {
//   @override
//   State<EcoDashboardScreen> createState() => _EcoDashboardScreenState();
// }

// class _EcoDashboardScreenState extends State<EcoDashboardScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.white,
//         ),
//         title: const Padding(
//           padding: EdgeInsets.symmetric(vertical: 20),
//           child: Text(
//             'Eco Dashboard',
//             style: TextStyle(
//                 color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//         ),
//         backgroundColor: deepGreen,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               buildScheduleList(),
//               SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   buildSummaryCard('CO2 emitted (KG)', '30', Icons.eco,
//                       Color.fromARGB(255, 40, 167, 18)),
//                   buildSummaryCard('Kilometers travelled', '70km',
//                       Icons.local_taxi, Colors.pink),
//                   buildSummaryCard(
//                       'Carpool shared', '7', Icons.commute, Colors.purple),
//                 ],
//               ),
//               SizedBox(height: 16),
//               Container(
//                 height: 200, // Adjust the height for the bar chart
//                 child: buildBarChart(), // Changed to Bar Chart
//               ),
//               SizedBox(height: 16),
//               Column(
//                 children: [
//                   Text(
//                     'Difference Between RideSync and Normal Users',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   Container(
//                     height: 270, // Adjust the height if needed
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Color(0xFF00492E).withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: buildPieChart(),
//                   ),
//                   SizedBox(height: 16),
//                   buildChartLegend(),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildSummaryCard(
//       String title, String value, IconData icon, Color color) {
//     return Container(
//       width: 80,
//       height: 120,
//       decoration: BoxDecoration(
//         color: Color(0xFF00492E).withOpacity(0.1),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: color),
//           SizedBox(height: 8),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Center(
//               child: Text(
//                 value,
//                 style: TextStyle(color: Colors.black, fontSize: 16),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           SizedBox(height: 4),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Center(
//               child: Text(
//                 title,
//                 style: TextStyle(color: Colors.black54, fontSize: 12),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildBarChart() {
//     return Container(
//       padding: EdgeInsets.all(22),
//       decoration: BoxDecoration(
//         color: Color(0xFF00492E).withOpacity(0.1),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: BarChart(
//         BarChartData(
//           borderData: FlBorderData(show: false),
//           titlesData: FlTitlesData(
//             bottomTitles: AxisTitles(
//               sideTitles: SideTitles(
//                 showTitles: true,
//                 getTitlesWidget: (value, meta) {
//                   switch (value.toInt()) {
//                     case 1:
//                       return Text('Ride 1');
//                     case 2:
//                       return Text('Ride 2');
//                     case 3:
//                       return Text('Ride 3');
//                     case 4:
//                       return Text('Ride 4');
//                     case 5:
//                       return Text('Ride 5');
//                     case 6:
//                       return Text('Ride 6');
//                     default:
//                       return Text('');
//                   }
//                 },
//                 reservedSize: 28,
//               ),
//             ),
//             leftTitles: AxisTitles(
//               sideTitles: SideTitles(
//                 showTitles: true,
//                 getTitlesWidget: (value, meta) {
//                   return Text('${value.toInt()}kg');
//                 },
//                 reservedSize: 28,
//               ),
//             ),
//             topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//             rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//           ),
//           barGroups: [
//             BarChartGroupData(
//               x: 1,
//               barRods: [
//                 BarChartRodData(toY: 4, color: Colors.green, width: 16)
//               ],
//               barsSpace: 5, // Reduced spacing between bars
//             ),
//             BarChartGroupData(
//               x: 2,
//               barRods: [
//                 BarChartRodData(toY: 6, color: Colors.green, width: 16)
//               ],
//               barsSpace: 5, // Reduced spacing between bars
//             ),
//             BarChartGroupData(
//               x: 3,
//               barRods: [
//                 BarChartRodData(toY: 8, color: Colors.green, width: 16)
//               ],
//               barsSpace: 5, // Reduced spacing between bars
//             ),
//             BarChartGroupData(
//               x: 4,
//               barRods: [
//                 BarChartRodData(toY: 10, color: Colors.green, width: 16)
//               ],
//               barsSpace: 5, // Reduced spacing between bars
//             ),
//             BarChartGroupData(
//               x: 5,
//               barRods: [
//                 BarChartRodData(toY: 7, color: Colors.green, width: 16)
//               ],
//               barsSpace: 5, // Reduced spacing between bars
//             ),
//             BarChartGroupData(
//               x: 6,
//               barRods: [
//                 BarChartRodData(toY: 5, color: Colors.green, width: 16)
//               ],
//               barsSpace: 5, // Reduced spacing between bars
//             ),
//           ],
//           groupsSpace:
//               10, // Reduce group space to make the bars closer together
//         ),
//       ),
//     );
//   }

//   Widget buildPieChart() {
//     return PieChart(
//       PieChartData(
//         sections: [
//           PieChartSectionData(
//             value: 20,
//             color: Color.fromARGB(255, 3, 172, 110),
//             title: 'RideSync\n20%',
//             radius: 40, // Reduce radius if needed
//             titleStyle: TextStyle(
//                 color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
//           ),
//           PieChartSectionData(
//             value: 80,
//             color: Color.fromARGB(255, 240, 165, 4),
//             title: 'Normal User\n80%',
//             radius: 40, // Reduce radius if needed
//             titleStyle: TextStyle(
//                 color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
//           ),
//         ],
//         sectionsSpace: 2, // Add a bit of spacing between sections
//         centerSpaceRadius: 40, // Adjust as necessary
//       ),
//     );
//   }

//   Widget buildScheduleList() {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: deepGreen.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: Text(
//               'RideSync Overview',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(height: 16),
//           buildScheduleItem('Carpool shared', '14'),
//           buildScheduleItem('Kilometers travelled', '70 KM'),
//           buildScheduleItem('Amount saved', 'Rs 447'),
//         ],
//       ),
//     );
//   }

//   Widget buildScheduleItem(String title, String time) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(title,
//                 style: TextStyle(color: Colors.black, fontSize: 14)),
//           ),
//           SizedBox(height: 4),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(time,
//                 style: TextStyle(color: Colors.black54, fontSize: 12)),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildChartLegend() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         buildLegendItem('Normal User', Color.fromARGB(255, 240, 165, 4)),
//         SizedBox(width: 16),
//         buildLegendItem('RideSync', Color(0xFF00492E)),
//       ],
//     );
//   }

//   Widget buildLegendItem(String label, Color color) {
//     return Row(
//       children: [
//         Container(width: 16, height: 16, color: color),
//         SizedBox(width: 4),
//         Text(label),
//       ],
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:ride_sync/colours.dart';

// class EcoDashboardScreen extends StatefulWidget {
//   @override
//   State<EcoDashboardScreen> createState() => _EcoDashboardScreenState();
// }

// class _EcoDashboardScreenState extends State<EcoDashboardScreen> {
//   double totalco2saved = 0.0;
//   double totaldistancecovered = 0.0;
//   int totalPools = 0;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   void initState() {
//     super.initState();
//     fetchUserData(); // Fetch data from Firestore when the screen is initialized
//   }

//   Future<void> fetchUserData() async {
//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         // Fetch the user's document from Firestore
//         DocumentSnapshot userDoc = await FirebaseFirestore.instance
//             .collection('Users')
//             .doc(user.uid)
//             .get();

//         if (userDoc.exists) {
//           setState(() {
//             // Update state variables with fetched data
//             totalco2saved = userDoc['totalCo2Saved'] ?? 0.0;
//             totaldistancecovered = userDoc['totalDistanceCovered'] ?? 0.0;
//             totalPools = userDoc['totalPools'] ?? 0;
//           });
//         }
//       }
//     } catch (e) {
//       print('Error fetching user data: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.white,
//         ),
//         title: const Padding(
//           padding: EdgeInsets.symmetric(vertical: 20),
//           child: Text(
//             'Eco Dashboard',
//             style: TextStyle(
//                 color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//         ),
//         backgroundColor: deepGreen,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               buildEcoTips(),
//               SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   buildSummaryCard('Total CO2 Saved','${totalco2saved.toStringAsFixed(2)} kg',
//                       Icons.eco, Color.fromARGB(255, 40, 167, 18)),
//                   buildSummaryCard(
//                       'Total Distance Travelled',
//                       '${totaldistancecovered.toStringAsFixed(2)} km',
//                       Icons.local_taxi,
//                       Colors.pink),
//                   buildSummaryCard('Total Pools', totalPools.toString(),
//                       Icons.commute, Colors.purple),
//                 ],
//               ),
//               SizedBox(height: 16),
//               Container(
//                 height: 200,
//                 child: buildBarChart(),
//               ),
//               SizedBox(height: 16),
//               Column(
//                 children: [
//                   Text(
//                     'Emission Comparison',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   Container(
//                     height: 270,
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Color(0xFF00492E).withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: buildPieChart(),
//                   ),
//                   SizedBox(height: 16),
//                   buildChartLegend(),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildSummaryCard(
//       String title, String value, IconData icon, Color color) {
//     return Expanded(
//       child: Container(
//         margin: EdgeInsets.all(5),
//         height: 120,
//         decoration: BoxDecoration(
//           color: Color(0xFF00492E).withOpacity(0.1),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: color),
//             SizedBox(height: 8),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Center(
//                 child: Text(
//                   value,
//                   style: TextStyle(color: Colors.black, fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//             SizedBox(height: 4),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Center(
//                 child: Text(
//                   title,
//                   style: TextStyle(color: Colors.black54, fontSize: 12),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildBarChart() {
//     return Container(
//       padding: EdgeInsets.all(22),
//       decoration: BoxDecoration(
//         color: Color(0xFF00492E).withOpacity(0.1),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: BarChart(
//         BarChartData(
//           borderData: FlBorderData(show: false),
//           titlesData: FlTitlesData(
//             bottomTitles: AxisTitles(
//               sideTitles: SideTitles(
//                 showTitles: true,
//                 getTitlesWidget: (value, meta) {
//                   switch (value.toInt()) {
//                     case 1:
//                       return Text('Ride 1');
//                     case 2:
//                       return Text('Ride 2');
//                     case 3:
//                       return Text('Ride 3');
//                     case 4:
//                       return Text('Ride 4');
//                     case 5:
//                       return Text('Ride 5');
//                     case 6:
//                       return Text('Ride 6');
//                     default:
//                       return Text('');
//                   }
//                 },
//                 reservedSize: 28,
//               ),
//             ),
//             leftTitles: AxisTitles(
//               sideTitles: SideTitles(
//                 showTitles: true,
//                 getTitlesWidget: (value, meta) {
//                   return Text('${value.toInt()}kg');
//                 },
//                 reservedSize: 28,
//               ),
//             ),
//             topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//             rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//           ),
//           barGroups: [
//             BarChartGroupData(
//                 x: 1,
//                 barRods: [BarChartRodData(toY: 4, color: Colors.green, width: 16)],
//                 barsSpace: 5),
//             BarChartGroupData(
//                 x: 2,
//                 barRods: [BarChartRodData(toY: 6, color: Colors.green, width: 16)],
//                 barsSpace: 5),
//             BarChartGroupData(
//                 x: 3,
//                 barRods: [BarChartRodData(toY: 8, color: Colors.green, width: 16)],
//                 barsSpace: 5),
//             BarChartGroupData(
//                 x: 4,
//                 barRods: [BarChartRodData(toY: 10, color: Colors.green, width: 16)],
//                 barsSpace: 5),
//             BarChartGroupData(
//                 x: 5,
//                 barRods: [BarChartRodData(toY: 7, color: Colors.green, width: 16)],
//                 barsSpace: 5),
//             BarChartGroupData(
//                 x: 6,
//                 barRods: [BarChartRodData(toY: 5, color: Colors.green, width: 16)],
//                 barsSpace: 5),
//           ],
//           groupsSpace: 10,
//         ),
//       ),
//     );
//   }

//   Widget buildPieChart() {
//     return PieChart(
//       PieChartData(
//         sections: [
//           PieChartSectionData(
//             value: 20,
//             color: Color.fromARGB(255, 3, 172, 110),
//             title: '20%',
//             radius: 40,
//             titleStyle: TextStyle(
//                 color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
//           ),
//           PieChartSectionData(
//             value: 80,
//             color: Color.fromARGB(255, 240, 165, 4),
//             title: '80%',
//             radius: 40,
//             titleStyle: TextStyle(
//                 color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
//           ),
//         ],
//         sectionsSpace: 2,
//         centerSpaceRadius: 40,
//       ),
//     );
//   }

//   Widget buildChartLegend() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Row(
//           children: [
//             Container(width: 12, height: 12, color: Color.fromARGB(255, 3, 172, 110)),
//             SizedBox(width: 4),
//             Text('Sustainable Rides'),
//           ],
//         ),
//         Row(
//           children: [
//             Container(width: 12, height: 12, color: Color.fromARGB(255, 240, 165, 4)),
//             SizedBox(width: 4),
//             Text('Non-Sustainable Rides'),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget buildEcoTips() {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Color(0xFF00492E).withOpacity(0.1),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         children: [
//           Text(
//             'Eco-friendly Tips',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 12),
//           Column(
//             children: [
//               buildEcoTip(Icons.local_florist, 'Use carpooling to reduce emissions', Colors.green),
//               buildEcoTip(Icons.bike_scooter, 'Use bikes or scooters for short trips', Colors.orange),
//               buildEcoTip(Icons.electric_car, 'Opt for electric vehicles', Colors.blue),
//               buildEcoTip(Icons.public, 'Use public transport', Colors.purple),
//               buildEcoTip(Icons.power, 'Switch off engines while idling', Colors.red),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildEcoTip(IconData icon, String text, Color color) {
//     return ListTile(
//       leading: Icon(icon, color: color, size: 30),
//       title: Text(text, style: TextStyle(fontSize: 14)),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ride_sync/colours.dart';

class EcoDashboardScreen extends StatefulWidget {
  @override
  State<EcoDashboardScreen> createState() => _EcoDashboardScreenState();
}

class _EcoDashboardScreenState extends State<EcoDashboardScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  double totalco2saved = 0.0;
  double totaldistancecovered = 0.0;
  int totalPools = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    fetchUserData(); // Fetch data from Firestore when the screen is initialized
  }

  Future<void> fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // Fetch the user's document from Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          setState(() {
            // Update state variables with fetched data
            totalco2saved = userDoc['totalCo2Saved'] ?? 0.0;
            totaldistancecovered = userDoc['totalDistanceCovered'] ?? 0.0;
            totalPools = userDoc['totalPools'] ?? 0;
          });
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Eco Dashboard',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        backgroundColor: deepGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildEcoTips(),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildSummaryCard(
                      'Total CO2 Saved',
                      '${totalco2saved.toStringAsFixed(2)} kg',
                      Icons.eco,
                      Color.fromARGB(255, 40, 167, 18)),
                  buildSummaryCard(
                      'Total Distance Travelled',
                      '${totaldistancecovered.toStringAsFixed(2)} km',
                      Icons.local_taxi,
                      Colors.pink),
                  buildSummaryCard('Total Pools', totalPools.toString(),
                      Icons.commute, Colors.purple),
                ],
              ),
              SizedBox(height: 16),
              Container(
                height: 350,
                child: buildBarChart(user!.uid),
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Emission Comparison',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 270,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFF00492E).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: buildPieChart(),
                  ),
                  SizedBox(height: 16),
                  buildChartLegend(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSummaryCard(
      String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        height: 120,
        decoration: BoxDecoration(
          color: Color(0xFF00492E).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Text(
                  value,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBarChart(String currentUserid) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Users').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: deepGreen,
            ),
          );
        }

        List users = snapshot.data!.docs
            .map((doc) {
              return {
                'name': doc['name'],
                'id': doc['id'],
                'totalCo2Saved': (doc['totalCo2Saved'] as num).toDouble(),
              };
            })
            .where((user) => user['totalCo2Saved'] > 1)
            .toList();

        users.sort((a, b) => b['totalCo2Saved'].compareTo(a['totalCo2Saved']));

        double maxCo2Saved = users.isNotEmpty
            ? users
                .map((user) => user['totalCo2Saved'])
                .reduce((a, b) => a > b ? a : b)
            : 0;

        int currentUserRank =
            users.indexWhere((user) => user['id'] == currentUserid) + 1;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Top Carbon Savers',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 16.0),
            //   child: Text(
            //     currentUserRank > 0
            //         ? 'Your Rank: $currentUserRank'
            //         : 'You are not in the leaderboard.',
            //     style: TextStyle(
            //         fontSize: 16,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.blue),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: currentUserRank > 0
                  ? Column(
                      children: [
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: deepGreen.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: deepGreen, width: 2),
                          ),
                          child: Row(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'You\'re Ranked ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: deepGreen,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '$currentUserRank',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Icon(
                                    Icons.emoji_events,
                                    color: Colors.amber,
                                    size: 30,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Icon(
                          Icons.sentiment_dissatisfied,
                          color: Colors.redAccent,
                          size: 30,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'You are not in the leaderboard.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
            ),

            Expanded(
              child: Container(
                height: 500,
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Color(0xFF00492E).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: users.length * 70.0,
                    child: BarChart(
                      BarChartData(
                        maxY: maxCo2Saved + 10,
                        borderData: FlBorderData(show: false),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                if (value.toInt() < users.length) {
                                  return Text(
                                    users[value.toInt()]['name']
                                        .toString()
                                        .split(' ')[0]
                                        .toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                } else {
                                  return Text('');
                                }
                              },
                              reservedSize: 28,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                return Text('${value.toInt()}kg',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12));
                              },
                              reservedSize: 28,
                            ),
                          ),
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                        ),
                        barGroups: users.asMap().entries.map((entry) {
                          int index = entry.key;
                          var user = entry.value;

                          return BarChartGroupData(
                            x: index,
                            barRods: [
                              BarChartRodData(
                                toY: user['totalCo2Saved'],
                                color: Colors.green,
                                width: 8,
                              ),
                            ],
                            barsSpace: 5,
                          );
                        }).toList(),
                        groupsSpace: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildPieChart() {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: 20,
            color: Color.fromARGB(255, 3, 172, 110),
            title: '20%',
            radius: 40,
            titleStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
          ),
          PieChartSectionData(
            value: 80,
            color: Color.fromARGB(255, 240, 165, 4),
            title: '80%',
            radius: 40,
            titleStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
        sectionsSpace: 2,
        centerSpaceRadius: 40,
      ),
    );
  }

  Widget buildChartLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Container(
                width: 12, height: 12, color: Color.fromARGB(255, 3, 172, 110)),
            SizedBox(width: 4),
            Text('Sustainable Rides'),
          ],
        ),
        Row(
          children: [
            Container(
                width: 12, height: 12, color: Color.fromARGB(255, 240, 165, 4)),
            SizedBox(width: 4),
            Text('Non-Sustainable Rides'),
          ],
        ),
      ],
    );
  }

  Widget buildEcoTips() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF00492E).withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            'Eco-Friendly Tips',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Column(
            children: [
              buildEcoTip(Icons.local_florist, 'Carpool to cut emissions',
                  Colors.green),
              buildEcoTip(Icons.bike_scooter, 'Bike or scooter for short trips',
                  Colors.orange),
              buildEcoTip(
                  Icons.electric_car, 'Choose electric vehicles', Colors.blue),
              buildEcoTip(Icons.public, 'Take public transport', Colors.purple),
              buildEcoTip(
                  Icons.power, 'Turn off engines when idling', Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildEcoTip(IconData icon, String text, Color color) {
    return ListTile(
      leading: Icon(icon, color: color, size: 30),
      title: Text(text, style: TextStyle(fontSize: 14)),
    );
  }
}
