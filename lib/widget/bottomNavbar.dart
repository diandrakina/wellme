import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:well_me/pages/drink.dart';
import 'package:well_me/pages/jogging.dart';
import 'package:well_me/pages/sleep/sleep.dart';
import 'package:well_me/styles/styles.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int myCurrentIndex = 0;
  List pages = const [
    DrinkPage(),
    JoggingPage(),
    SleepPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[myCurrentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 30, offset: Offset(0, 20))
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BottomNavigationBar(
            currentIndex: myCurrentIndex,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.reminderBox,
            unselectedItemColor: Colors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: FaIcon(
                    FontAwesomeIcons.glassWater,
                    size: 30,
                  ),
                  label: "Minum"),
              BottomNavigationBarItem(
                  icon: FaIcon(
                    FontAwesomeIcons.personRunning,
                    size: 30,
                  ),
                  label: "Jogging"),
              BottomNavigationBarItem(
                  icon: FaIcon(
                    FontAwesomeIcons.bed,
                    size: 30,
                  ),
                  label: "Tidur"),
            ],
          ),
        ),
      ),
    );
  }
}
