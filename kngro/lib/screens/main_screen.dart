import 'package:flutter/material.dart';
import 'package:kngro/screens/bottom_navigation_bar_screens/history_screen.dart';
import 'package:kngro/screens/bottom_navigation_bar_screens/more_screen.dart';
import 'package:kngro/screens/bottom_navigation_bar_screens/team_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../constants.dart';
import 'bottom_navigation_bar_screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String id = 'main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    HistoryScreen(),
    TeamScreen(),
    MoreScreen(),
  ];

  final List<SalomonBottomBarItem> _bottomNavItems = [
    SalomonBottomBarItem(
      icon: Icon(Icons.home,color: kFirstColor),
      title: Text("Home",style: TextStyle(color: kFirstColor),),
      selectedColor: kFourthColor,
    ),

    SalomonBottomBarItem(
      icon: Icon(Icons.sticky_note_2,color: kFirstColor),
      title: Text("History",style: TextStyle(color: kFirstColor),),
      selectedColor: kFourthColor,
    ),

    SalomonBottomBarItem(
      icon: Icon(Icons.people_alt_sharp,color: kFirstColor),
      title: Text("Team",style: TextStyle(color: kFirstColor),),
      selectedColor: kFourthColor,
    ),

    SalomonBottomBarItem(
      icon: Icon(Icons.more_outlined,color: kFirstColor,),
      title: Text("More",style: TextStyle(color: kFirstColor),),
      selectedColor: kFourthColor,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      backgroundColor: kSecondColor,
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: kBgWhiteColor,
        // itemPadding: EdgeInsets.only(top: 10.0,bottom: 10.0),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: _bottomNavItems,
      ),

    );
  }
}
