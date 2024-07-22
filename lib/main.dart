import 'package:flutter/material.dart';
import 'package:ride_sync/authentication/auth.dart';
import 'package:ride_sync/authentication/signin.dart';
import 'package:firebase_core/firebase_core.dart';
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
    return MaterialApp(
      title: 'RideSync',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
    );
  }
}

//check for updation in git
/// API NAMES, PROJECT NAMES, FIREBASE NAMES NOT SAME
/// API MAPS KEY ="AIzaSyCQfR-6C1N8UtWNRq9bXyACb7s1nlplLQ4"
