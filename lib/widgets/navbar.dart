import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

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
    bool showNav = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: !showNav,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 60,
                color: Colors.black.withOpacity(0.4),
                offset: const Offset(0, 25),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
            child: CustomNavigationBar(
              iconSize: 24.0,
              selectedColor: Colors.orange,
              strokeColor: Colors.orange,
              unSelectedColor: Colors.grey,
              backgroundColor: Colors.transparent,
              items: [
                CustomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text("Home", style: TextStyle(color: Colors.white),),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(Icons.search),
                  title: const Text("Search", style: TextStyle(color: Colors.white),),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(Icons.library_books),
                  title: const Text("Library", style: TextStyle(color: Colors.white),),
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
