import 'package:flutter/material.dart';

import '../../Dashboard/dashboard_page.dart';

class CustomAppBarLibrary extends StatelessWidget {
  const CustomAppBarLibrary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 100,
      flexibleSpace: const FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 15, bottom: 10),
        title: Text(
          "Library",
          style: TextStyle(fontSize: 28, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 15, top: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => const DashboardPage())));
              },
              child: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/demo.png'),
              ),
            )),
      ],
    );
  }
}
