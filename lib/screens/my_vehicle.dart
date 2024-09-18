import 'package:flutter/material.dart';
import 'package:ride_sync/colours.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyVehicleScreen(),
    );
  }
}

class MyVehicleScreen extends StatelessWidget {
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
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        backgroundColor: deepGreen,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          VehicleTile(
            vehicleType: "Sedan",
            licensePlate: "KA 59 MP 3455",
            points: 5.0,
            seats: 4,
            isDefault: true,
          ),
          VehicleTile(
            vehicleType: "Hatch Back",
            licensePlate: "KA 34 MP 4454",
            points: 5.0,
            seats: 4,
            isDefault: false,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.local_taxi,
                color: deepGreen,
                weight: 16,
              ),
              label: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Add Vehicle',
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
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: deepGreen,
              child: ListTile(
                leading: Icon(
                  Icons.credit_card,
                  color: Colors.white,
                ),
                title: Text(
                  "Offering Rides?",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  "Add Driving License",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onTap: () {
                  // Add driving license logic
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VehicleTile extends StatelessWidget {
  final String vehicleType;
  final String licensePlate;
  final double points;
  final int seats;
  final bool isDefault;

  VehicleTile({
    required this.vehicleType,
    required this.licensePlate,
    required this.points,
    required this.seats,
    this.isDefault = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      //Color.fromARGB(255, 180, 226, 181)
      color: Colors.white,
      shape: BeveledRectangleBorder(),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListTile(
          leading: ClipOval(child: Image.asset('assets/vehicle_details.jpg')),
          title: Row(
            children: [
              Text(
                vehicleType,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              if (isDefault)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      'DEFAULT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          subtitle: Text(licensePlate),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${points.toStringAsFixed(1)} Carpool Points/km'),
              Text('$seats seats'),
            ],
          ),
          onTap: () {
            // Action when a vehicle is tapped
          },
        ),
      ),
    );
  }
}
