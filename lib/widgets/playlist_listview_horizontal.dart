import 'package:flutter/material.dart';

import '../model/playlist.dart';
import '../utils/color_utils.dart' show getDominantColor;
import '../pages/Playlist/widgets/playlist_card.dart';

class PlaylistListViewHorizontal extends StatelessWidget {
  final List<Playlist>? playlists;

  const PlaylistListViewHorizontal({Key? key, required this.playlists})
      : super(key: key);

  Future<Color> _updateDominantColor(ImageProvider imageProvider) async {
    final dominantColor =
        await getDominantColor(imageProvider, const Size(135, 135));
    return dominantColor;
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: currentWidth,
      height: currentHeight / 3.6,
      child: ListView.builder(
        itemCount: playlists?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return FutureBuilder<Color>(
            future: _updateDominantColor(
                NetworkImage(playlists![index].image.toString())),
            builder: (BuildContext context, AsyncSnapshot<Color> snapshot) {
              if (snapshot.hasData) {
                return  PlaylistCard(
                  playlist: playlists![index],
                  height: currentWidth / 2.5,
                  width: currentHeight / 4.8,
                  dominantColor: snapshot.data!,
                );
              } else {
                return  Container(
                  margin: EdgeInsets.only(top: 20, left: 10),
                  width: 130,
                  child: Column(
                    children:  [
                      SizedBox(
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
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