import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({
    super.key,
    this.myController,
    required this.hintText,
    this.onSubmitted,
    this.onChanged,
    this.borderRadius,
  });

  final TextEditingController? myController;
  final String hintText;
  final void Function(String?)? onSubmitted;
  final void Function(String?)? onChanged;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        contentPadding: const EdgeInsets.all(10),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey.shade500,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade700),
      ),
      onSubmitted: onSubmitted ?? onChanged,
      onChanged: onChanged,
    );
  }
}
