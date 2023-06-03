import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:music_streaming_app/pages/Home/widgets/follow_artist_section.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/playlist.dart';
import '../../model/song.dart';
import '../../widgets/playlist_listview_horizontal.dart';
import '../../widgets/repetitious_double_text.dart';
import '../../widgets/repetitious_listview_horizontal.dart';
import '../../widgets/repetitious_text.dart';
import 'widgets/appbar_home.dart';
import 'widgets/below_upload_section.dart';
import 'widgets/upload_section.dart';

class HomePage extends StatefulWidget {
  static String id = "HomePage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "User";

  Future<void> getDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("UserEmail", "Huynh@gmail.com");
    username = prefs.getString("UserEmail")!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (ctx, i) => [
                  CustomAppBarHome(),
                ],
            body: MainBody()),
      ),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        ReapetedDoubleText(
            title: "More of what you like",
            subtitle: "Suggestions based on what you\'ve liked or played"),
        SizedBox(
          height: 5,
        ),
        PlaylistListViewHorizontal(playlists: Playlist.dailyMix,),
        SizedBox(
          height: 10,
        ),
        RepetitiousText("Recently Played"),
        SizedBox(
          height: 5,
        ),
        PlaylistListViewHorizontal(playlists: Playlist.album,),
        SizedBox(
          height: 10,
        ),
        ReapetedDoubleText(
            title: "The Upload", subtitle: "Newly posted tracks. Just for you"),
        UploadSectionWidget(),
        BelowUploadSectionWidet(),
        SizedBox(
          height: 10,
        ),
        ReapetedDoubleText(
            title: "Artist You Should Follow",
            subtitle: "Based on your listening history"),
        SizedBox(
          height: 5,
        ),
        FollowArtistSection(),
        SizedBox(
          height: 5,
        ),
        ReapetedDoubleText(
            title: "Party",
            subtitle: "Popular playlists from the App community"),
        SizedBox(
          height: 10,
        ),
        RepetitiousListViewHorizontal(),
        SizedBox(
          height: 5,
        ),
        ReapetedDoubleText(
            title: "Sleep",
            subtitle: "Popular playlists from the App community"),
        SizedBox(
          height: 10,
        ),
        RepetitiousListViewHorizontal(),
        SizedBox(
          height: 5,
        ),
        ReapetedDoubleText(
            title: "Chill",
            subtitle: "Popular playlists from the App community"),
        SizedBox(
          height: 10,
        ),
        RepetitiousListViewHorizontal(),
        SizedBox(
          height: 5,
        ),
        ReapetedDoubleText(
            title: "Charts: New & hot",
            subtitle: "Up-and-coming tracks on App"),
        UploadSectionWidget(),
      ],
    );
  }
}

Future<List<String>> getAllPlaylist(String urlPostfix, String type) async {
  try {
    final url =
        Uri.parse('https://moodify-backend.onrender.com/api/$urlPostfix');
    Map<String, String> data = {'text': type};
    String body = jsonEncode(data);
    // Use `data` in request body if using Node.js server as backend
    // Use `body` in request body if using FastAPI server as backend
    final response =
        await http.post(url, body: body).timeout(const Duration(seconds: 15));
    Map<String, dynamic> temp = await json.decode(response.body);
    // print(temp['data']);
    List<String> songs = List<String>.from(temp['data'] as List);
    // print(songs);
    // return [];
    return songs;
  } catch (e) {
    print("ERROR - $e");
    return [];
  }
}

Future<List<String>> getAllSong(String urlPostfix, String type) async {
  try {
    final url =
        Uri.parse('https://moodify-backend.onrender.com/api/$urlPostfix');
    Map<String, String> data = {'text': type};
    String body = jsonEncode(data);
    final response =
        await http.post(url, body: body).timeout(const Duration(seconds: 15));
    Map<String, dynamic> temp = await json.decode(response.body);
    // print(temp['data']);
    List<String> songs = List<String>.from(temp['data'] as List);
    // print(songs);
    // return [];
    return songs;
  } catch (e) {
    print("ERROR - $e");
    return [];
  }
}
