import 'package:flutter/material.dart';

import 'package:line_icons/line_icons.dart';

// ignore: must_be_immutable
class CustomAppBarProfile extends StatelessWidget {
  String title;
  CustomAppBarProfile({super.key, required this.title,});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
      pinned: true,
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.only(bottom: 13, right: 220),
        title: Text(
          title,
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      titleSpacing: 1.0,
      elevation: 0,
    );
  }
}