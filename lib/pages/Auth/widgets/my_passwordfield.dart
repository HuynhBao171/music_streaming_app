import 'package:flutter/material.dart';

class MyPasswordField extends StatefulWidget {
  final controller;
  const MyPasswordField({Key? key, this.controller}) : super(key: key);

  @override
  _MyPasswordFieldState createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        controller: widget.controller,
        obscureText: _obscured,
        focusNode: textFieldFocusNode,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          labelStyle: TextStyle(color: Colors.grey[500]),
          labelText: "Password",
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // No border
            borderRadius: BorderRadius.circular(12), // Apply corner radius
          ),
          prefixIcon: Ink(
            child: Icon(
              Icons.lock_rounded,
              color: Colors.grey[500],
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: GestureDetector(
              onTap: _toggleObscured,
              child: Ink(
                  child: Icon(
                    _obscured
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    color: Colors.grey[500],
                  ),
                ),
              ),
            ),
        ),
      ),
    );
  }
}
