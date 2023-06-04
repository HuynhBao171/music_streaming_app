import 'package:custom_navigation_bar/custom_navigation_bar.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        // color: Colors.black.withOpacity(0.8),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
          // child: GNav(
          //   color: Colors.white,
          //   rippleColor: Colors.orange,
          //   activeColor: Colors.orange,
          //   hoverColor: Colors.orange,
          // //  tabBackgroundColor: Colors.grey,
          //   gap: 30,
          //   padding: const EdgeInsets.all(14),
          //   tabs: const [
          //     GButton(
          //       icon: Icons.home,
          //       text: 'Home',
          //     ),
          //     GButton(
          //       icon: Icons.search,
          //       text: 'Search',
          //     ),
          //     GButton(
          //       icon: Icons.library_books,
          //       text: 'Library',
          //     ),
          //   ],
          //   selectedIndex: _selectedIndex,
          //     onTabChange: (index) {
          //       setState(() {
          //         _selectedIndex = index;
          //       });
          //     }
          // ),
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
    );
  }
}
