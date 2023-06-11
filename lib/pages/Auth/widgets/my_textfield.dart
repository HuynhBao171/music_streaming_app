import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String labelText;
  final TextInputType keyboardType;
  final IconData icon;

  const MyTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.keyboardType,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            prefixIcon: Ink(
              child: Icon(
                icon,
                color: Colors.grey[500],
              ),
            ),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
