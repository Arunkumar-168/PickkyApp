import 'package:flutter/material.dart';
import 'package:pickky_app/Bottom/Book.dart';
import 'package:pickky_app/Bottom/Profile.dart';
import 'package:pickky_app/Bottom/homebutton.dart';
import 'package:pickky_app/Home/Start.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/home';
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    const SlidePage(),
    const HomePage(),
    const BookPage(),
    const LoginPage(),
  ];

  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.yellow, // Yellow background color
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), // Rounded top left corner
            topRight: Radius.circular(20), // Rounded top right corner
          ),
        ),
        child: BottomNavigationBar(
          onTap: _selectPage,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.transparent, // Transparent background color
          elevation: 0, // No shadow
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.watch_later_rounded),
              activeIcon: Icon(Icons.watch_later_rounded),
              label: 'Time',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_rounded),
              activeIcon: Icon(Icons.book_rounded),
              label: 'Booklist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              activeIcon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
          selectedLabelStyle: const TextStyle(color: Colors.black),
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
