import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_sync/DataHandler/appData.dart';
import 'package:ride_sync/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ride_sync/screens/home.dart';
import 'package:ride_sync/screens/rides.dart';
import 'package:ride_sync/screens/searchScreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return AppData();
      },
      child: MaterialApp(
        title: 'RideSync',
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,

        //chnage later IMP
        // home: RidesScreen(),
        home: HomePage(),
        // home: const AuthPage(),
      ),
    );
  }
}

//check for updation in git
/// API NAMES, PROJECT NAMES, FIREBASE NAMES NOT SAME
/// API MAPS KEY ="AIzaSyCQfR-6C1N8UtWNRq9bXyACb7s1nlplLQ4"
