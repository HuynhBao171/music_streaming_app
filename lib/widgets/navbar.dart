import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../pages/Library/library.dart';
import '../pages/home/home_page.dart';
import '../pages/search/search_page.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
int _selectedIndex = 0;

  final List _screen = [
    const HomePage(),
    const SearchPage(),
    const LibraryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.orange,
            tabBackgroundColor: Colors.grey,
            gap: 20,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home'),
              GButton(
                icon: Icons.search,
                text: 'Search',),
              GButton(
                icon: Icons.library_books,
                text: 'Library',)
            ],
            selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }
          ),
        ),
      ),
    );
  }
}