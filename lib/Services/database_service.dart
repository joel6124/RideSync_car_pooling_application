import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:ride_sync/colours.dart';

class VehicleDatabaseService {
  final String vehicle_collection_ref = "Cars";
  Future<void> addVehicle(
      context, String carId, Map<String, dynamic> VehicleInfoMap) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: deepGreen,
            ),
          );
        });
    try {
      await FirebaseFirestore.instance
          .collection(vehicle_collection_ref)
          .doc(carId)
          .set(VehicleInfoMap);
      developer.log("Vehicle added successfully!");
      Navigator.pop(context);
      Navigator.pop(context);
    } catch (e) {
      Navigator.pop(context);
      developer.log("Error adding vehicle data: $e");
    }
  }
}

class DrivingLicenseDatabaseService {
  Future<void> saveLicense(context, _licenseNo) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .update({
          'driverLicenseNo': _licenseNo.trim(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Driver\'s License saved successfully!')),
        );

        Navigator.of(context).pop();
      } catch (e) {
        print("Error saving driver's license: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save Driver\'s License: $e')),
        );
      }
    }
  }
}

class OfferPoolDatabaseService {
  final String PoolOffers_collection_ref = "PoolOffers";
  Future<void> addPoolOffer(
      context, String offerId, Map<String, dynamic> PoolOfferInfoMap) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: deepGreen,
            ),
          );
        });
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance
            .collection(PoolOffers_collection_ref)
            .doc(offerId)
            .set(PoolOfferInfoMap);
        developer.log("Pool Offer added successfully!");
        Navigator.pop(context);
      } catch (e) {
        Navigator.pop(context);
        developer.log("Error adding Pool Offer: $e");
      }
    }
  }
}

class FindPoolDatabaseService {
  final String PoolRequests_collection_ref = "PoolRequests";
  Future<void> addPoolFind(
      context, String requestId, Map<String, dynamic> PoolFindInfoMap) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: deepGreen,
            ),
          );
        });
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance
            .collection(PoolRequests_collection_ref)
            .doc(requestId)
            .set(PoolFindInfoMap);
        developer.log("Pool Request added successfully!");
        Navigator.pop(context);
      } catch (e) {
        Navigator.pop(context);
        developer.log("Error adding Pool Request : $e");
      }
    }
  }
}
