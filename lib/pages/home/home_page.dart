
import 'package:flutter/material.dart';
import 'package:music_streaming_app/pages/Home/widgets/follow_artist_section.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/api_client.dart';
import '../../model/playlist.dart';
import '../../widgets/playlist_listview_horizontal.dart';
import '../../widgets/repetitious_double_text.dart';
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
    username = prefs.getString("UserName")!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (ctx, i) => [
                  const CustomAppBarHome(),
                ],
            body: MainBody()),
      ),
    );
  }
}

class MainBody extends StatelessWidget {
  MainBody({super.key});
  final apiClient = ApiClient();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Playlist>>(
        future: apiClient.getAllPlaylists(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final playlists1 = snapshot.data;
            final playlists2 = snapshot.data;
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                ReapetedDoubleText(
                    title: "More of what you like",
                    subtitle:
                        "Suggestions based on what you\'ve liked or played"),
                const SizedBox(
                  height: 5,
                ),
                PlaylistListViewHorizontal(playlists: playlists1),
                // const RepetitiousListViewHorizontal(),
                const SizedBox(
                  height: 10,
                ),
                RepetitiousText("Songs of the week"),
                const SizedBox(
                  height: 5,
                ),
                PlaylistListViewHorizontal(playlists: playlists2),
                // const RepetitiousListViewHorizontal(),
                const SizedBox(
                  height: 10,
                ),
                ReapetedDoubleText(
                    title: "The Upload",
                    subtitle: "Newly posted tracks. Just for you"),
                const UploadSectionWidget(),
                const BelowUploadSectionWidet(),
                const SizedBox(
                  height: 10,
                ),
                ReapetedDoubleText(
                    title: "Artist You Should Follow",
                    subtitle: "Based on your listening history"),
                const SizedBox(
                  height: 5,
                ),
                const FollowArtistSection(),
                const SizedBox(
                  height: 5,
                ),
                ReapetedDoubleText(
                    title: "Party",
                    subtitle: "Popular playlists from the App community"),
                const SizedBox(
                  height: 10,
                ),
                PlaylistListViewHorizontal(playlists: playlists1),
                const SizedBox(
                  height: 5,
                ),
                ReapetedDoubleText(
                    title: "Sleep",
                    subtitle: "Popular playlists from the App community"),
                const SizedBox(
                  height: 10,
                ),
                PlaylistListViewHorizontal(playlists: playlists2),
                const SizedBox(
                  height: 5,
                ),
                ReapetedDoubleText(
                    title: "Chill",
                    subtitle: "Popular playlists from the App community"),
                const SizedBox(
                  height: 10,
                ),
                PlaylistListViewHorizontal(playlists: playlists1),
                const SizedBox(
                  height: 5,
                ),
                ReapetedDoubleText(
                    title: "Charts: New & hot",
                    subtitle: "Up-and-coming tracks on App"),
                const UploadSectionWidget(),
                const SizedBox(
                  height: 60,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Failed to load playlists: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
