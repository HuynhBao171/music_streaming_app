import 'package:flutter/material.dart';

import '../../../core/api_client.dart';
import '../../../model/playlist.dart';
import '../../../model/song.dart';
import '../../PlaySong/play_song_page.dart';

class PlaylistSongs extends StatelessWidget {
  final int index;
  final Playlist playlist;
  const PlaylistSongs({
    super.key,
    required this.playlist,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final apiClient = ApiClient();
    return Container(
      margin: const EdgeInsets.all(10),
      width: currentWidth / 2.5,
      child: FutureBuilder<List<Song>>(
        future: apiClient.getSongsOfPlaylist(playlist.id as int),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final songs = snapshot.data;
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => PlaySongPage(
                          initialIndex: index,
                          playlist: songs, nameList: playlist.name,
                          // song: playlist.songs[index], dominantColor: Colors.amber,
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
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    songs![index].image.toString(),
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.height * 0.1,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${songs[index].name}'),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  '${songs[index].profileId}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 134, 134, 134),
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(children: [
                  const Icon(
                    Icons.play_arrow,
                    color: Color.fromARGB(255, 134, 134, 134),
                    size: 15,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '390K ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 134, 134, 134),
                        fontSize: 13,
                      ),
                      children: <TextSpan>[
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
            const Icon(Icons.more_vert, color: Color.fromARGB(255, 134, 134, 134))
          ],
        );
        } else if (snapshot.hasError) {
            return Text('Failed to load songs: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        }
      ),
    );
  }
}
