import 'package:flutter/material.dart';

import '../model/playlist.dart';
import '../model/song.dart';
import '../utils/color_utils.dart';
import '../pages/Playlist/widgets/playlist_songs.dart';

class SongListViewVertical extends StatelessWidget {
  double? height;
  Playlist playlist;
  List<Song> songs;
  SongListViewVertical({super.key, required this.height, required this.songs, required this.playlist});

  Future<Color> _updateDominantColor(ImageProvider imageProvider) async {
    final dominantColor =
        await getDominantColor(imageProvider, const Size(135, 135));
    return dominantColor;
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: currentWidth,
      height: height,
      child: ListView.builder(
          itemCount: songs.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return PlaylistSongs(
              index: index,
              playlist: playlist,
            );
          }),
    );
  }
}
