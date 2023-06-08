import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CustomAppBarPlaylist extends StatelessWidget {
  String title;
  CustomAppBarPlaylist({super.key, required this.title,});

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
        title: Text(
          title,
          style: const TextStyle(fontSize: 27, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      floating: true,
    );
  }
}