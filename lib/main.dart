import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio_background/just_audio_background.dart' show JustAudioBackground;
import 'package:music_streaming_app/pages/Auth/login_page.dart';
import 'package:music_streaming_app/pages/Auth/register_page.dart';
import 'package:music_streaming_app/pages/Library/library_page.dart';
import 'package:music_streaming_app/pages/Dashboard/dashboard_page.dart';
import 'package:music_streaming_app/pages/Home/home_page.dart';
import 'package:music_streaming_app/pages/LikedTracks/liked_tracks.dart';
import 'package:music_streaming_app/pages/ListeningHistory/listening_history.dart';
import 'package:music_streaming_app/pages/ManagerPlaylist/manager_playlist_page.dart';
import 'package:music_streaming_app/pages/Profile/profile.dart';
import 'package:music_streaming_app/pages/RecentlyPlayed/recently_played.dart';
import 'package:music_streaming_app/pages/Search/search_page.dart';
import 'package:music_streaming_app/pages/Upload/upload.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/song.dart';
import 'widgets/navbar.dart';

late bool isLoggedIn;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.example.music.channel.audio',
    androidNotificationChannelName: 'Melodify',
    androidNotificationOngoing: true,
    androidNotificationIcon: 'mipmap/music',
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isLoggedIn = prefs.getBool('loggedIn') ?? false;
  await Hive.initFlutter();
  await Hive.openBox<Song>('list_favorite');
  prefs.setBool("loggedIn", false);
  prefs.setString("UserEmail", "manduong2k2");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      debugShowCheckedModeBanner: false,
      // initialRoute: (isLoggedIn) ? CustomNavBar.id : LoginPage.id,
      initialRoute: CustomNavBar.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        DashboardPage.id: (context) => const DashboardPage(),
        CustomNavBar.id: (context) =>  const CustomNavBar(),
        LibraryPage.id: (context) => const LibraryPage(),
        ListeningHistoryPage.id: (context) => const ListeningHistoryPage(),
        RegisterPage.id: (context) => RegisterPage(),
        LoginPage.id: (context) =>  const LoginPage(),
        ManagerPlaylistPage.id: (context) => const ManagerPlaylistPage(),
        ProfilePage.id: (context) => const ProfilePage(),
        RecentlyPlayedPage.id: (context) => const RecentlyPlayedPage(),
        SearchPage.id: (context) => const SearchPage(),
        UploadPage.id: (context) => const UploadPage(),
        LikedTracksPage.id: (context) => const LikedTracksPage(),
      },
    );
  }
}
