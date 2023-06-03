import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/playlist.dart';
import '../model/song.dart';
import '../utils/color_utils.dart';
import '../pages/Playlist/widgets/playlist_card.dart';

class PlaylistListViewHorizontal extends StatelessWidget {
  List<Playlist> playlists;
  PlaylistListViewHorizontal({super.key, required this.playlists});

  Color? _dominantColor;

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
      height: currentHeight / 3.6,
      child: ListView.builder(
        itemCount: playlists.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return FutureBuilder<Color>(
            future: _updateDominantColor(
                NetworkImage(playlists[index].coverUrl.toString())),
            builder: (BuildContext context, AsyncSnapshot<Color> snapshot) {
              if (snapshot.hasData) {
                return PlaylistCard(
                  playlist: playlists[index],
                  height: currentWidth / 2.5,
                  width: currentHeight / 4.8,
                  dominantColor: snapshot.data!,
                );
              } else {
                return Container(
                  margin: EdgeInsets.all(5),
                  width: currentWidth / 2.5,
                  child: Column(
                    children: [
                      Container(
                        width: currentWidth / 2.5,
                        height: currentHeight / 4.8,
                        child: Center(
                          child: Positioned(
                            bottom: 15,
                            right: 16,
                            child: Container(
                              width: 135,
                              height: 135,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
