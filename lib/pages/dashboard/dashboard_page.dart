import 'package:flutter/material.dart';
import 'package:music_streaming_app/pages/login/login_page.dart';
import 'package:music_streaming_app/widgets/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login/widgets/my_button.dart';
import 'widgets/appbar_dashboard.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (ctx, i) => [
                  CustomAppBarDashboard(title: "Dashboard"),
                ],
            body: MainBodyDashboard()),
      ),
    );
  }
}

class MainBodyDashboard extends StatefulWidget {
  const MainBodyDashboard({super.key});

  @override
  State<MainBodyDashboard> createState() => _MainBodyDashboardState();
}

class _MainBodyDashboardState extends State<MainBodyDashboard> {
  String username = "User";

  Future<void> getDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("UserEmail", "Huynh@gmail.com");
    username = prefs.getString("UserEmail")!;
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Container(
      height: currentHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 180),
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/u/91388754?v=4"),
          ),
          SizedBox(height: 20),
          FutureBuilder(
            future: getDetails(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return Text(
                "$username",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.background,
                ),
              );
            },
          ),
          SizedBox(
            height: 15,
          ),
          MyButton(
            text: "Sign Out",
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool("loggedIn", false);
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginPage.id, ModalRoute.withName(CustomNavBar.id));
            },
          ),
        ],
      ),
    ));
  }
}
