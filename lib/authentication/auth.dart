import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ride_sync/authentication/signin.dart';
import 'package:ride_sync/screens/home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //logged in
          if (!snapshot.hasData) {
            return SignInPage();
          }
          //Not Logged in
          else {
            return const HomePage();
          }
        },
      ),
    );
  }
}
