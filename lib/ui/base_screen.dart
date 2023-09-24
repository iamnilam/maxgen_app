import 'package:flutter/material.dart';
import 'package:maxgen_app/ui/home_screen.dart';
import 'package:maxgen_app/ui/phone_screen.dart';
import 'package:maxgen_app/ui/search_screen.dart';
import 'package:maxgen_app/utils/app_color.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;
  final List screens = [HomeScreen(), SearchScreen(), PhoneScreen()];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.greyColor,
          iconSize: 40,
          onTap: onTabTapped,
          elevation: 5),
      body: screens[_currentIndex],
    );
  }
}
