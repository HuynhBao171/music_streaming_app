import 'package:flutter/material.dart';
import 'package:music_streaming_app/pages/home/home_page.dart';
import 'pages/login/login_page.dart';
import 'widgets/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      debugShowCheckedModeBanner: false,
      home: CustomNavBar(),
    );
  }
}