import 'package:flutter/material.dart';
import '../colours.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(5)),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green,
              ),
            ),
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              color: subtitleGrey,
            ),
            hintText: hintText,
            fillColor: Color.fromARGB(255, 227, 231, 221),
            filled: true),
      ),
    );
  }
}
