import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'widgets/appbar_recentlyplayed.dart';
import 'widgets/repetitious_artist_profile.dart';
import 'widgets/repetitious_music_cover.dart';

class RecentlyPlayedPage extends StatefulWidget {
  static String id = "RecentlyPlayed";

  const RecentlyPlayedPage({super.key});
  @override
  State<RecentlyPlayedPage> createState() => _RecentlyPlayedPageState();
}

class _RecentlyPlayedPageState extends State<RecentlyPlayedPage> {
  bool trash = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (ctx, i) => [
                  CustomAppBarRecentlyPlayed(() {
                    setState(() {
                      trash = true;
                    });
                    Navigator.pop(context);
                  }),
                ],
            body: MainBodyRecentlyPlayed(trash)),
      ),
    );
  }
}

// ignore: must_be_immutable
class MainBodyRecentlyPlayed extends StatelessWidget {
  bool trash;
  MainBodyRecentlyPlayed(this.trash, {super.key});

  @override
  Widget build(BuildContext context) {
    return trash
        ? FadeInLeft(
            delay: const Duration(microseconds: 600),
            child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Find all the tracks you\'ve listened to here",
                    style: TextStyle(
                        color: Color.fromARGB(255, 134, 134, 134),
                        fontWeight: FontWeight.w400))),
          )
        : ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "No. of Tracks + recently played items",
                    style: TextStyle(color: Color.fromARGB(255, 134, 134, 134)),
                  ),
                ),
                const RepetitiousArtistProfile(),
                RepetitiousMusicCover(
                  const Icon(
                    Icons.private_connectivity,
                    color: Color.fromARGB(255, 134, 134, 134),
                    size: 25,
                  ),
                ),
                RepetitiousMusicCover(null),
                const RepetitiousArtistProfile(),
                const RepetitiousArtistProfile(),
                const RepetitiousArtistProfile(),
                RepetitiousMusicCover(null),
                RepetitiousMusicCover(null),
                RepetitiousMusicCover(
                  const Icon(
                    Icons.private_connectivity,
                    color: Color.fromARGB(255, 134, 134, 134),
                    size: 25,
                  ),
                ),
                RepetitiousMusicCover(null),
                const RepetitiousArtistProfile(),
                RepetitiousMusicCover(
                  const Icon(
                    Icons.private_connectivity,
                    color: Color.fromARGB(255, 134, 134, 134),
                    size: 25,
                  ),
                ),
                RepetitiousMusicCover(null),
                const RepetitiousArtistProfile(),
                RepetitiousMusicCover(
                  const Icon(
                    Icons.private_connectivity,
                    color: Color.fromARGB(255, 134, 134, 134),
                    size: 25,
                  ),
                ),
                RepetitiousMusicCover(
                  const Icon(
                    Icons.private_connectivity,
                    color: Color.fromARGB(255, 134, 134, 134),
                    size: 25,
                  ),
                ),
                const RepetitiousArtistProfile(),
                RepetitiousMusicCover(
                  const Icon(
                    Icons.private_connectivity,
                    color: Color.fromARGB(255, 134, 134, 134),
                    size: 25,
                  ),
                ),
                const RepetitiousArtistProfile(),
              ],
            ),
          ]);
  }
}
