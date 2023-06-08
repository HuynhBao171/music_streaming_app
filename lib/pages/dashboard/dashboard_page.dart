import 'package:flutter/material.dart';
import 'package:music_streaming_app/widgets/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Auth/login_page.dart';
import '../Auth/widgets/my_button.dart';
import 'widgets/appbar_dashboard.dart';

class DashboardPage extends StatefulWidget {
  static String id = "Dashboard";
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
            body: const MainBodyDashboard()),
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
    prefs.setString("UserEmail", "manduong2k2");
    username = prefs.getString("UserEmail")!;
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: SizedBox(
      height: currentHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 180),
          const CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/images/demo.png')
          ),
          const SizedBox(height: 20),
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
          const SizedBox(
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
