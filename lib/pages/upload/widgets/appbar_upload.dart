import 'package:flutter/material.dart';


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
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
      pinned: true,
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.only(bottom: 13, right: 180),
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