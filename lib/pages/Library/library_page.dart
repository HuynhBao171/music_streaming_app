import 'package:flutter/material.dart';

import '../../model/playlist.dart';
import '../../widgets/playlist_listview_horizontal.dart';
import '../../widgets/repetitious_listview_vertical.dart';
import '../../widgets/repetitious_text.dart';
import '../ListeningHistory/listening_history.dart';
import '../ManagerPlaylist/manager_playlist_page.dart';
import '../Profile/profile.dart';
import '../RecentlyPlayed/recently_played.dart';
import 'widgets/appbar_library.dart';
import 'widgets/activity_card.dart';

class LibraryPage extends StatelessWidget {
  static String id = "Library";
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (ctx, i) => [
                  CustomAppBarLibrary(),
                ],
            body: MainBodyLibrary()),
      ),
    );
  }
}

class MainBodyLibrary extends StatelessWidget {
  const MainBodyLibrary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Container(
      width: currentWidth,
      height: currentHeight,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => ProfilePage())));
                },
                child: ActivityCard(title: "Profile", icon: Icons.people)),
            Divider(
              color: Colors.grey.shade800,
            ),
            ActivityCard(title:"Liked tracks", icon: Icons.favorite),
            Divider(
              color: Colors.grey.shade800,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => ManagerPlaylistPage())));
                },
                child: ActivityCard(title:"Playlists", icon: Icons.album)),
            Divider(
              color: Colors.grey.shade800,
            ),
            ActivityCard(title: "Following", icon: Icons.lightbulb),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RepetitiousText("Recently Played"),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 4),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => RecentlyPlayedPage())));
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                            color: Color.fromARGB(255, 134, 134, 134)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            PlaylistListViewHorizontal(playlists: Playlist.album,),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RepetitiousText("Listening history"),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 4),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => ListeningHistoryPage())));
                      },
                      child: Text(
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
          ],
        ),
      ),
    );
  }
}
