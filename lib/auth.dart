import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ride_sync/authentication/signin.dart';
import 'package:ride_sync/authentication/verification_screen.dart';
import 'package:ride_sync/screens/home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //not logged in
          if (!snapshot.hasData) {
            return SignInPage();
          }
          // Logged in
          else {
            if (snapshot.data?.emailVerified == true) {
              return const HomePage();
            }
            return const VerificationScreen();
          }
        },
      ),
    );
  }
}
