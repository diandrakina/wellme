import 'package:flutter/material.dart';
import 'package:well_me/pages/drink.dart';
import 'package:well_me/pages/jogging.dart';
import 'package:well_me/styles/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:well_me/widget/bottomNavbar.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key});

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
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
        ),
        body: Container(
          color: AppColors.background,
          padding: const EdgeInsets.only(left: 20, right: 20),
          width: double.maxFinite,
          child: SingleChildScrollView(
            // color: AppColors.background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),

                //CONTAINER REMINDER
                Container(
                    width: double.maxFinite,
                    height: 100,
                    decoration: BoxDecoration(
                        color: AppColors.reminderBox,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        const Padding(padding: EdgeInsets.all(10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(padding: EdgeInsets.all(5)),
                            Text(
                              "Reminder",
                              style: TextStyles.reminder,
                            ),
                            Text(
                              "Bobo siang woy!",
                              style: TextStyles.body,
                            ),
                            Text(
                              "13.00 - 15.00",
                              style: TextStyles.time,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        const Icon(
                          Icons.alarm,
                          size: 75,
                          color: Colors.white,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),

                //CONTAINER RECORD
                Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColors.recordBox,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.recordVinyl,
                        size: 30,
                        color: AppColors.redBox,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "RECORD YOUR SLEEP HERE",
                        style: TextStyles.record,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //CONTAINER INFORMATION
                Container(
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                      color: AppColors.informationBox,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
