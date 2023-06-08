import 'package:flutter/material.dart';

import 'package:line_icons/line_icons.dart';

import '../../upload/upload.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 100,
      flexibleSpace: const FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 20, bottom: 10),
        title: Text(
          "Home",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: GestureDetector(
            onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => const UploadPage())));
                },
          child: const Icon(
            LineIcons.alternateArrowCircleUpAlt,
            color: Colors.deepOrange,
            size: 35,
          ),
        ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(LineIcons.bell, color: Colors.grey, size: 35),
        ),
      ],
    );
  }
}