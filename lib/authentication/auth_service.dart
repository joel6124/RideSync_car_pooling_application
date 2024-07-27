import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ride_sync/auth.dart';
import 'package:ride_sync/authentication/auth_database.dart';
import 'package:ride_sync/authentication/signin.dart';
import 'package:ride_sync/authentication/verification_screen.dart';

class AuthService {
  final _authDatabase = AuthDatabase();

  //RESET PASSWORD
  Future<void> resetPassword(BuildContext context, String email) async {
    if (email.isEmpty) {
      errorMsg(context, "Please enter your email to reset your password!");
      return;
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text(
        "Password Reset Email has been sent!",
        style: TextStyle(fontSize: 16),
      )));
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return SignInPage();
      }));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        errorMsg(context, "No such user found with this email!");
      } else if (e.code == "invalid-email") {
        errorMsg(context, "Please enter a valid Email!");
      } else {
        errorMsg(context, e.code);
      }
    }
  }

  //SEND EMAIL VERIFICATION
  Future<void> sendEmailVerificationLink() async {
    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
    } catch (e) {
      print(e.toString());
    }
  }

  //REGISTER USER
  Future<void> registerUser(BuildContext context, String name, String email,
      String password, String passwordConfirm) async {
    if (password != passwordConfirm) {
      errorMsg(context, "Passwords do not match!");
      return;
    } else if (name.isEmpty) {
      errorMsg(context, "Please enter your Name!");
      return;
    } else if (email.isEmpty) {
      errorMsg(context, "Please enter your Email!");
      return;
    } else if (password.isEmpty || passwordConfirm.isEmpty) {
      errorMsg(context, 'Please enter your Password!');
      return;
    }

    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      //registering user
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // VerificationScreen();
      //adding to firestore
      // await FirebaseFirestore.instance
      //     .collection("users")
      //     .doc(credential.user?.uid)
      //     .set({
      //   'name': name,
      //   'email': email,
      //   'uid': credential.user?.uid,
      // });

      Navigator.pop(context); // Close the dialog
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const AuthPage();
      })); // Navigate back to login page
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'weak-password') {
        errorMsg(context, "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        errorMsg(context, "The account already exists for that email.");
      } else {
        errorMsg(context, e.code);
      }
    }
  }

  //SIGN IN
  //
  Future<void> signInUser(
      BuildContext context, String email, String password) async {
    if (email.isEmpty) {
      errorMsg(context, "Please enter your Email!");
      return;
    } else if (password.isEmpty) {
      errorMsg(context, "Please enter your Password!");
      return;
    }
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pop(context); // Close the dialog
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const AuthPage();
      }));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'invalid-email') {
        errorMsg(context, 'Enter a valid Email with proper format!');
      } else if (e.code == 'invalid-credential') {
        errorMsg(
            context, 'The provided credential is invalid. Please try again.');
      } else if (e.code == 'user-not-found') {
        errorMsg(context, "No such user with this Email!");
      } else if (e.code == 'wrong-password') {
        errorMsg(context, "Incorrect Password!");
      } else {
        errorMsg(context, e.code);
      }
    }
  }

  void errorMsg(BuildContext context, String errorMsg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      errorMsg,
      style: const TextStyle(fontSize: 16),
    )));
  }

  //GOOGLE AUTHENTICATION
  signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken);

    UserCredential result =
        await FirebaseAuth.instance.signInWithCredential(credential);
    User? userDetails = result.user;

    if (result != null) {
      Map<String, dynamic> userInfoMap = {
        "email": userDetails!.email,
        "name": userDetails.displayName,
        "imgURL": userDetails.photoURL,
        "id": userDetails.uid,
      };

      // await _authDatabase.addUser(userId, userInfoMap);
    }
  }
}
