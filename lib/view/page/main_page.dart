import 'package:flutter/material.dart';
import 'package:tcco/view/page/account_page.dart';
import 'package:tcco/view/page/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 1;
  List<Widget> pages = <Widget>[
    ProfilePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: pages[_currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
      onTap: (int index) => setState(() {
        _currentIndex = index;
      }),
      items: const [
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.account_circle, color: Colors.blueAccent, size: 25),
            icon: Icon(Icons.account_circle, color: Colors.grey, size: 20),
            label: 'Profile'),
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.home, color: Colors.blueAccent, size: 25),
            icon: Icon(Icons.home, color: Colors.grey, size: 20),
            label: 'Home'),
      ],
    ),
  );
}