import 'package:flutter/material.dart';

import 'package:line_icons/line_icons.dart';

// ignore: must_be_immutable
class CustomAppBarUpload extends StatelessWidget {
  String title;
  CustomAppBarUpload({super.key, required this.title,});

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