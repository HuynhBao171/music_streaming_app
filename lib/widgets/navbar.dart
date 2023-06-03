import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../pages/Library/library_page.dart';
import '../pages/Home/home_page.dart';
import '../pages/Search/search_page.dart';

class CustomNavBar extends StatefulWidget {
  static String id = "CustomNavbar";
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
int _selectedIndex = 0;

  final List<Widget> screens = [
    const HomePage(),
    const SearchPage(),
    const LibraryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 5 ),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.orange,
            tabBackgroundColor: Colors.grey,
            gap: 20,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.library_books,
                text: 'Library',
              ),
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