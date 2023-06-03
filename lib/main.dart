import 'package:flutter/material.dart';
import 'package:music_streaming_app/pages/Auth/login_page.dart';
import 'package:music_streaming_app/pages/Auth/register_page.dart';
import 'package:music_streaming_app/pages/Library/library_page.dart';
import 'package:music_streaming_app/pages/Dashboard/dashboard_page.dart';
import 'package:music_streaming_app/pages/Home/home_page.dart';
import 'package:music_streaming_app/pages/ListeningHistory/listening_history.dart';
import 'package:music_streaming_app/pages/ManagerPlaylist/manager_playlist_page.dart';
import 'package:music_streaming_app/pages/Profile/profile.dart';
import 'package:music_streaming_app/pages/RecentlyPlayed/recently_played.dart';
import 'package:music_streaming_app/pages/Search/search_page.dart';
import 'package:music_streaming_app/pages/Upload/upload.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/navbar.dart';

late bool isLoggedIn;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // isLoggedIn = await prefs.getBool('loggedIn') ?? false;
  prefs.setBool("loggedIn", true);
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
      // initialRoute: (isLoggedIn) ? CustomNavBar.id : LoginPage.id ,
      initialRoute: CustomNavBar.id,
      // home: const LoginPage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        DashboardPage.id: (context) => DashboardPage(),
        CustomNavBar.id: (context) => CustomNavBar(),
        LibraryPage.id: (context) => LibraryPage(),
        ListeningHistoryPage.id: (context) => ListeningHistoryPage(),
        RegisterPage.id: (context) => RegisterPage(),
        LoginPage.id: (context) => LoginPage(),
        ManagerPlaylistPage.id: (context) => ManagerPlaylistPage(),
        ProfilePage.id: (context) => ProfilePage(),
        RecentlyPlayedPage.id: (context) => RecentlyPlayedPage(),
        SearchPage.id: (context) => SearchPage(),
        UploadPage.id: (context) => UploadPage(),
      },
    );
  }
}
