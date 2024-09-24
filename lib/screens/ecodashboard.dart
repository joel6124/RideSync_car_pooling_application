import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ride_sync/colours.dart';

class EcoDashboardScreen extends StatefulWidget {
  @override
  State<EcoDashboardScreen> createState() => _EcoDashboardScreenState();
}

class _EcoDashboardScreenState extends State<EcoDashboardScreen> {
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
              buildScheduleList(),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildSummaryCard('CO2 emitted (KG)', '30', Icons.eco,
                      Color.fromARGB(255, 40, 167, 18)),
                  buildSummaryCard('Kilometers travelled', '70km',
                      Icons.local_taxi, Colors.pink),
                  buildSummaryCard(
                      'Carpool shared', '7', Icons.commute, Colors.purple),
                ],
              ),
              SizedBox(height: 16),
              Container(
                height: 200, // Adjust the height for the bar chart
                child: buildBarChart(), // Changed to Bar Chart
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  Text(
                    'Difference Between RideSync and Normal Users',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 270, // Adjust the height if needed
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
    return Container(
      width: 80,
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
    );
  }

  Widget buildBarChart() {
    return Container(
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Color(0xFF00492E).withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 1:
                      return Text('Ride 1');
                    case 2:
                      return Text('Ride 2');
                    case 3:
                      return Text('Ride 3');
                    case 4:
                      return Text('Ride 4');
                    case 5:
                      return Text('Ride 5');
                    case 6:
                      return Text('Ride 6');
                    default:
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
                  return Text('${value.toInt()}kg');
                },
                reservedSize: 28,
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          barGroups: [
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(toY: 4, color: Colors.green, width: 16)
              ],
              barsSpace: 5, // Reduced spacing between bars
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(toY: 6, color: Colors.green, width: 16)
              ],
              barsSpace: 5, // Reduced spacing between bars
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(toY: 8, color: Colors.green, width: 16)
              ],
              barsSpace: 5, // Reduced spacing between bars
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(toY: 10, color: Colors.green, width: 16)
              ],
              barsSpace: 5, // Reduced spacing between bars
            ),
            BarChartGroupData(
              x: 5,
              barRods: [
                BarChartRodData(toY: 7, color: Colors.green, width: 16)
              ],
              barsSpace: 5, // Reduced spacing between bars
            ),
            BarChartGroupData(
              x: 6,
              barRods: [
                BarChartRodData(toY: 5, color: Colors.green, width: 16)
              ],
              barsSpace: 5, // Reduced spacing between bars
            ),
          ],
          groupsSpace:
              10, // Reduce group space to make the bars closer together
        ),
      ),
    );
  }

  Widget buildPieChart() {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: 20,
            color: Color.fromARGB(255, 3, 172, 110),
            title: 'RideSync\n20%',
            radius: 40, // Reduce radius if needed
            titleStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
          ),
          PieChartSectionData(
            value: 80,
            color: Color.fromARGB(255, 240, 165, 4),
            title: 'Normal User\n80%',
            radius: 40, // Reduce radius if needed
            titleStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
        sectionsSpace: 2, // Add a bit of spacing between sections
        centerSpaceRadius: 40, // Adjust as necessary
      ),
    );
  }

  Widget buildScheduleList() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: deepGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'RideSync Overview',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          buildScheduleItem('Carpool shared', '14'),
          buildScheduleItem('Kilometers travelled', '70 KM'),
          buildScheduleItem('Amount saved', 'Rs 447'),
        ],
      ),
    );
  }

  Widget buildScheduleItem(String title, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(title,
                style: TextStyle(color: Colors.black, fontSize: 14)),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(time,
                style: TextStyle(color: Colors.black54, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget buildChartLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        buildLegendItem('Normal User', Color.fromARGB(255, 240, 165, 4)),
        SizedBox(width: 16),
        buildLegendItem('RideSync', Color(0xFF00492E)),
      ],
    );
  }

  Widget buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(width: 16, height: 16, color: color),
        SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}
