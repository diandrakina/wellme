import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:well_me/pages/drink.dart';
import 'package:well_me/pages/jogging.dart';
import 'package:well_me/styles/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:well_me/widget/bottomNavbar.dart';
import 'package:well_me/widget/lineChart.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key});

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  final _calendarControllerToday = AdvancedCalendarController.today();
  final _calendarControllerCustom =
      AdvancedCalendarController.custom(DateTime(2022, 10, 23));
  final events = <DateTime>[
    DateTime.now(),
    // DateTime(2022, 10, 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
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

            //CALENDAR
            // Container(
            //   height: 400,
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(12)),
            //   child:
            AdvancedCalendar(
              weekLineHeight: 40,
              controller: _calendarControllerToday,
              events: events,
              startWeekDay: 1,
              innerDot: true,
              keepLineSize: true,
              calendarTextStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 1.3125,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // ),

            //CONTAINER INFORMATION
            // Container(
            //   width: double.maxFinite,
            //   height: 100,
            //   decoration: BoxDecoration(
            //       color: AppColors.informationBox,
            //       borderRadius: BorderRadius.circular(12)),
            // ),

            //CHART
            Container(
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Monthly Statistic"),
                  Text(
                    "July",
                    style: TextStyles.record,
                  ),
                  LineChartBuild()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
