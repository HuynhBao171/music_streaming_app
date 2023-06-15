import 'package:flutter/material.dart';

import '../../../model/playlist.dart';
import '../playlist.dart';

class PlaylistCard extends StatelessWidget {
  final double width;
  final double height;
  final Color dominantColor;
  final Playlist playlist;

  PlaylistCard(
      {super.key,
      required this.width,
      required this.height,
      required this.dominantColor,
      required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: width,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => PlaylistPage(
                        dominantColor: dominantColor,
                        playlist: playlist,
                      ))));
            },
            child: SizedBox(
              width: width,
              height: height,
              child: Stack(
                children: [
                  Center(),
                  Positioned(
                    bottom: 3,
                    right: 5,
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: dominantColor.withOpacity(0.1),
                        ),
                        color: dominantColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 9,
                    right: 10,
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: dominantColor.withOpacity(0.1),
                        ),
                        color: dominantColor.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 16,
                    child: Container(
                      width: 135,
                      height: 135,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.1)),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(playlist.coverUrl.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${playlist.profileId} • ${playlist.name}',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}
