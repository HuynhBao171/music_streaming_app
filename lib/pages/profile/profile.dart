import 'package:flutter/material.dart';

import '../../widgets/repetitious_listview_vertical.dart';
import '../../widgets/repetitious_text.dart';
import '../ListeningHistory/listening_history.dart';
import 'widgets/appbar_profile.dart';

class ProfilePage extends StatefulWidget {
  static String id = "Profile";
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (ctx, i) => [
                  CustomAppBarProfile(title: "Profile"),
                ],
            body: const MainBodyProfile()),
      ),
    );
  }
}

class MainBodyProfile extends StatefulWidget {
  const MainBodyProfile({super.key});

  @override
  State<MainBodyProfile> createState() => _MainBodyProfileState();
}

class _MainBodyProfileState extends State<MainBodyProfile> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: currentWidth,
      height: currentHeight,
      child: SingleChildScrollView(
        child: Column(
          children: [
           const CircleAvatar(
            backgroundColor: Color(0xffB1B1B1),
            backgroundImage: AssetImage('assets/images/demo.png'),
            radius: 60,
          ), 
          const SizedBox(height:10),
          const Text(
            "Userdemo",
            style: TextStyle(fontSize: 27, color: Colors.black),
          ),
          const SizedBox(height:10),
          const SizedBox(
            height:20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "12 Followers",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300, color: Colors.black),
                ),
                VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Text(
                  "129 Following",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300, color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(height:15),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RepetitiousText("Tracks"),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 4),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const ListeningHistoryPage())));
                      },
                      child: const Text(
                        "See All",
                        style: TextStyle(
                            color: Color.fromARGB(255, 134, 134, 134)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RepetitiousListViewVertical(height: 240,),
            const SizedBox(height:15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RepetitiousText("Playlist"),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 4),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const ListeningHistoryPage())));
                      },
                      child: const Text(
                        "See All",
                        style: TextStyle(
                            color: Color.fromARGB(255, 134, 134, 134)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // PlaylistListViewHorizontal(playlists: Playlist,),

          ],
        ),
      ),
    );
  }
}