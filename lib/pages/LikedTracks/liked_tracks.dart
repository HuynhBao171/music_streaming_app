import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:animate_do/animate_do.dart';
import '../../model/playlist.dart';
import '../../model/song.dart';
import '../../widgets/song_listview_vertical.dart';
import 'widgets/appbar_liked_tracks.dart';

class LikedTracksPage extends StatefulWidget {
  static String id = "LikedTracks";

  const LikedTracksPage({super.key});

  @override
  State<LikedTracksPage> createState() => _LikedTracksPageState();
}

class _LikedTracksPageState extends State<LikedTracksPage> {
  bool trash = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (ctx, i) => [
            CustomAppBarListeningHistory(() {
              setState(() {
                trash = true;
              });
              Navigator.pop(context);
            }),
          ],
          body: MainBodyLikedTracksHistory(trash),
        ),
      ),
    );
  }
}

class MainBodyLikedTracksHistory extends StatelessWidget {
  final bool trash;
  MainBodyLikedTracksHistory(this.trash, {super.key});

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    return trash
        ? FadeInLeft(
            delay: const Duration(microseconds: 600),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Find all the tracks you\'ve listened to here",
                style: TextStyle(
                  color: Color.fromARGB(255, 134, 134, 134),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        : ValueListenableBuilder<Box<Song>>(
            valueListenable: Hive.box<Song>('list_favorite').listenable(),
            builder: (context, box, _) {
              final favoriteSongs = box.values.toList();
              final playlist = Playlist(
                id: 1,
                name: 'My favorite playlist',
                // songs: favoriteSongs,
                profileId: '123',
                coverUrl: 'assets/images/demo.png',
              );
              return ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "No. of Tracks",
                          style: TextStyle(
                            color: Color.fromARGB(255, 134, 134, 134),
                          ),
                        ),
                      ),
                      SongListViewVertical(
                        songs: favoriteSongs, height: currentHeight, playlist: playlist,
                      ),
                    ],
                  ),
                ],
              );
            },
          );
  }
}
