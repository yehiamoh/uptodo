import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:up_todo/screens/home_screen.dart';
import 'package:up_todo/screens/profile_screen.dart';
import 'package:up_todo/widgets/bottomsheet.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void _addTaskScreen() {
    showModalBottomSheet(
        backgroundColor: Color(0xff363636),
        isScrollControlled: false,
        context: context,
        builder: (context) => const TaskInfoSheet());
  }

  List<Widget> _listOfScreen = [HomePage(), ProfileScreen()];
  final List _listOficons2 = [Icons.home_outlined, Icons.person_outlined];
  final List _listOficons = [Icons.home, Icons.person];

  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _listOfScreen[_bottomNavIndex],
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: FloatingActionButton(
          backgroundColor: Color(0xff8687E7),
          child: const Icon(
            Icons.add,
            size: 35,
          ),
          onPressed: () {
            _addTaskScreen();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: _listOficons.length,
        tabBuilder: ((index, isActive) {
          return Icon(
            isActive ? _listOficons[index] : _listOficons2[index],
            size: 35,
            color: Colors.white,
          );
        }),
        backgroundColor: Color(0xff363636),

        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        // other params
      ),
    );
  }
}
