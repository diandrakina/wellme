import 'package:flutter/material.dart';
import 'package:well_me/pages/drink.dart';
import 'package:well_me/pages/jogging.dart';
import 'package:well_me/pages/sleep.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:well_me/styles/styles.dart';

class TabScreen extends StatefulWidget{

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen>{

  int _selectedPageIndex = 0;

  List pages = const [
    DrinkPage(),
    JoggingPage(),
    SleepPage(),
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = pages[_selectedPageIndex];
    AppBar activeScreenAppBar = AppBar(
          toolbarHeight: 80,
          leadingWidth: double.maxFinite,
          leading: Builder(
            builder: (context) {
              return Container(
                color: AppColors.background,
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.all(10)),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 190,
                    ),
                    const FaIcon(
                      FontAwesomeIcons.fire,
                      size: 25,
                    ),
                    const Padding(padding: EdgeInsets.all(2)),
                    Text(
                      "4",
                      style: TextStyles.header,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const FaIcon(
                      FontAwesomeIcons.bell,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/profilePict.jpg'),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
              );
            },
          ),
        );
      
      return Scaffold(
        appBar: activeScreenAppBar,
        body: SafeArea(child: activeScreen),
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
            currentIndex: _selectedPageIndex,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.reminderBox,
            unselectedItemColor: Colors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: _selectPage,
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