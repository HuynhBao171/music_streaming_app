import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  String title;
  CustomAppBar({super.key, required this.title,});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 20, bottom: 10),
        title: Text(
          title,
          style: const TextStyle(fontSize: 27, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      floating: true,
    );
  }
}
