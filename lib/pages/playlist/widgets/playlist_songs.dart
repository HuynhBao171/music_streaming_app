import 'package:flutter/material.dart';

import '../../../model/song.dart';
import '../../../utils/color_utils.dart';
import '../../PlaySong/play_song_page.dart';

class PlaylistSongs extends StatelessWidget {
  final Song song;
  const PlaylistSongs({
    super.key,
    required this.song,
  });

  Future<Color> _updateDominantColor(ImageProvider _imageProvider) async {
    final dominantColor =
        await getDominantColor(_imageProvider, Size(135, 135));
    return dominantColor;
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    Color? dominantColor;
    _updateDominantColor(AssetImage(song.coverUrl.toString())).then((value) {
      dominantColor = value;
    });
    
    return Container(
      margin: EdgeInsets.all(10),
      width: currentWidth / 2.5,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => PlaySongPage(
                        dominantColor: dominantColor,
                        song: song,
                      ))));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  song.coverUrl.toString(),
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.height * 0.1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${song.name}'),
              SizedBox(
                height: 3,
              ),
              Text(
                '${song.profileId}',
                style: TextStyle(
                    color: Color.fromARGB(255, 134, 134, 134),
                    fontSize: 13.5,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 3,
              ),
              Row(children: [
                Icon(
                  Icons.play_arrow,
                  color: Color.fromARGB(255, 134, 134, 134),
                  size: 15,
                ),
                RichText(
                  text: TextSpan(
                    text: '390K ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 134, 134, 134),
                      fontSize: 13,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                          text: '•',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' 4:26'),
                    ],
                  ),
                )
              ]),
            ],
          ),
          Expanded(child: Container()),
          Icon(Icons.more_vert, color: Color.fromARGB(255, 134, 134, 134))
        ],
      ),
    );
  }
}
