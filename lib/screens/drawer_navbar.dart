import 'package:flutter/material.dart';
import 'package:ride_sync/authentication/auth_service.dart';
import 'package:ride_sync/colours.dart';
import 'package:ride_sync/screens/rides.dart';

class Drawer_Navbar extends StatelessWidget {
  const Drawer_Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                child: UserAccountsDrawerHeader(
                  currentAccountPicture: SizedBox(
                    width: 90,
                    height: 90,
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/logo.jpg',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  accountName: const Text(
                    'Joel Jino',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  accountEmail: const Text(
                    'joel@gmail.com',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: deepGreen,
                    image: DecorationImage(
                      image: AssetImage('assets/drawer_bg2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 16,
                bottom: 40,
                child: GestureDetector(
                  onTap: () {
                    print('object');
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            leading: Icon(
              Icons.local_taxi_rounded,
              color: deepGreen,
            ),
            title: const Text('My Rides'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return RidesScreen();
              }));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.eco_rounded,
              color: lightGreen,
            ),
            title: const Text('Eco Dashboard'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.directions_car,
              color: Colors.purple,
            ),
            title: const Text('My Vehicle'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Colors.amber,
            ),
            title: const Text('Notifications'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.payment_outlined,
              color: const Color.fromARGB(255, 13, 45, 71),
            ),
            title: const Text('Payments if needed'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Color.fromARGB(255, 181, 24, 12),
            ),
            title: const Text('Logout'),
            onTap: () {
              AuthService().SignOut();
            },
          ),
        ],
      ),
    );
  }
}
