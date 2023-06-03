import 'package:flutter/material.dart';

import '../model/song.dart';
import '../utils/color_utils.dart';
import '../pages/Playlist/widgets/playlist_songs.dart';

class SongListViewVertical extends StatelessWidget {
  double? height;
  List<Song> songs;
  SongListViewVertical({super.key, required this.height, required this.songs});

  Future<Color> _updateDominantColor(ImageProvider _imageProvider) async {
    final dominantColor =
        await getDominantColor(_imageProvider, Size(135, 135));
    return dominantColor;
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Container(
      width: currentWidth,
      height: height,
      child: ListView.builder(
          itemCount: songs.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return PlaylistSongs(
              song: songs[index],
            );
          }),
    );
  }
}
