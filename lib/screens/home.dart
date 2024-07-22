import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void SignOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RideSync'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: SignOut, icon: Icon(Icons.logout_rounded))
        ],
      ),
    );
  }
}
