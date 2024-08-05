import 'package:flutter/material.dart';
import 'package:ride_sync/colours.dart';

class OfferPool extends StatefulWidget {
  const OfferPool({super.key});

  @override
  State<OfferPool> createState() => _OfferPoolState();
}

class _OfferPoolState extends State<OfferPool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Find Pool',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: deepGreen,
      ),
      body: Column(
        children: [
          //Map,
          //textFields for input of details
        ],
      ),
    );
  }
}
