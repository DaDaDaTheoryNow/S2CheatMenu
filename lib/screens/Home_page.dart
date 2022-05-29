import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:standoff2_cheat_menu/screens/Free_page.dart';
import 'package:standoff2_cheat_menu/screens/Premium_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  bool isSwitched = false;
  ThemeMode _theme = ThemeMode.dark;

  NavigationBarSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const FreePage(),
    const PremiumPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: NavigationBarSelected,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.home,
                size: 27,
              ),
              label: "Free"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_purple500_outlined),
              label: "Premium",
              activeIcon: Icon(
                Icons.star,
                size: 27,
              )),
        ],
      ),
    );
  }
}
