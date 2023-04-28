import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  CustomAppBar({required this.title,});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 20, bottom: 10),
        title: Text(
          title,
          style: TextStyle(fontSize: 27, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      floating: true,
    );
  }
}
