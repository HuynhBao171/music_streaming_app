import 'package:flutter/material.dart';

import '../../core/api_client.dart';
import '../../model/playlist.dart';
import '../../model/song.dart';
import '../../widgets/song_listview_vertical.dart';
import '../../widgets/repetitious_text.dart';
import 'widgets/appbar_playlist.dart';

class PlaylistPage extends StatelessWidget {
  static String id = "PlaylistPage";
  final Playlist playlist;
  final Color dominantColor;
  const PlaylistPage(
      {super.key, required this.playlist, required this.dominantColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            dominantColor,
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: NestedScrollView(
              headerSliverBuilder: (ctx, i) => [
                    CustomAppBarPlaylist(title: playlist.name.toString()),
                  ],
              body: MainBodyProfile(
                playlist: playlist,
              )),
        ),
      ),
    );
  }
}

class MainBodyProfile extends StatefulWidget {
  final Playlist playlist;
  const MainBodyProfile({super.key, required this.playlist});

  @override
  State<MainBodyProfile> createState() => _MainBodyProfileState();
}

class _MainBodyProfileState extends State<MainBodyProfile> {

  List<Song> songs = [];

  @override
  void initState() {
    super.initState();
    _loadSongs();
  }

  Future<void> _loadSongs() async {
    List<Song> loadedSongs = await ApiClient().getSongsOfPlaylist(widget.playlist.id as int);
    setState(() {
      songs = loadedSongs;
    });
  }
  
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
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), 
                    spreadRadius: 2, 
                    blurRadius: 5, 
                    offset: const Offset(0, 3), 
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.playlist.coverUrl.toString(),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RepetitiousText("Tracks"),
                ],
              ),
            ),
            SongListViewVertical(
              height: currentHeight, songs: songs, playlist: widget.playlist,
            ),
          ],
        ),
      ),
    );
  }
}
