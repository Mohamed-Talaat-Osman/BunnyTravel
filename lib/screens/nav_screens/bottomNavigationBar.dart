import 'package:flutter/material.dart';
import 'package:flutter_cubit/screens/nav_screens/charts_screen.dart';
import 'package:flutter_cubit/screens/nav_screens/home_screen.dart';
import 'package:flutter_cubit/screens/nav_screens/userInfo_screen.dart';
import 'package:flutter_cubit/screens/nav_screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List screens = [
    HomeScreen(),
    BarItemScreen(),
    SearchScreen(),
    MyScreen(),
  ];

  int currentIndex = 0;

  void onTap (int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.7),
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(label:"Home",icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label:"Bar",icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label:"Search",icon: Icon(Icons.search)),
          BottomNavigationBarItem(label:"My",icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
