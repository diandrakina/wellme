// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:well_me/login_register_page.dart';
import 'package:well_me/styles/styles.dart';
import 'package:well_me/widget/chart/chart.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<double> achievements = [50, 76.1, 88.8];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        toolbarHeight: 60,
        title: Text("Profile"),
        titleTextStyle: TextStyles.header,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(8)),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profilePict.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Text(
                "Fredy Sunjaya",
                style: TextStyles.header,
              ),
              Padding(padding: EdgeInsets.all(16)),

              //
              Container(
                height: 180,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.informationBox,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ],
                ),
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      "Achievement",
                      style: TextStyles.record,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(8)),
                        Column(
                          children: [
                            SizedBox(
                              height: 65,
                              width: 65,
                              child: Image(
                                image: AssetImage('assets/fire.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "5",
                              style: TextStyles.notificationTitle,
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(14)),
                        SizedBox(
                          height: 120,
                          width: 200,
                          child: Chart(
                            achievements: achievements,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Card(
                  shadowColor: Colors.grey,
                  elevation: 4,
                  color: AppColors.informationBox,
                  child: ExpansionTile(
                    title: Text(
                      "User Data",
                      style: TextStyles.record,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.calendar,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  " Sejak 07 Juli 2024",
                                  style: TextStyles.body2,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.birthdayCake,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  " 11 Januari 2024",
                                  style: TextStyles.body2,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.person,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "  160 cm",
                                  style: TextStyles.body2,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.weightScale,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "65 kg",
                                  style: TextStyles.body2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),

              //Settings
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.detailBox,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    SizedBox(
                      child: FaIcon(
                        FontAwesomeIcons.gear,
                        size: 30,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Text(
                      "Settings",
                      style: TextStyles.record,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Divider(),
              SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginRegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Logout",
                            style: TextStyles.bodyblacknormal,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FaIcon(FontAwesomeIcons.arrowRightFromBracket)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
