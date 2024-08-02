import 'dart:async';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:well_me/data/dummy_data.dart';
import 'package:well_me/model/sleep.dart';
import 'package:well_me/pages/sleep/sleepRecord.dart';
import 'package:well_me/styles/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:well_me/widget/lineChart.dart';
import 'package:well_me/widget/sleep_progress.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key});

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  List<Sleep> sleeps = generateSleepData();
  final List<double> _sleepData = [42.5, 40.0, 45.0, 34];
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  void _toggleCalendarFormat() {
    setState(() {
      _calendarFormat = _calendarFormat == CalendarFormat.week
          ? CalendarFormat.month
          : CalendarFormat.week;
    });
  }

  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;

  void start() {
    started = true;
  }

  @override
  Widget build(BuildContext context) {
    Sleep? sleep = sleeps
        .where((element) =>
            element.date.year == _focusedDay.year &&
            element.date.month == _focusedDay.month &&
            element.date.day == _focusedDay.day)
        .first;

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
                borderRadius: BorderRadius.circular(12),
              ),
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
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //CONTAINER RECORD
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(400, 50),
                  backgroundColor: AppColors.recordBox),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SleepRecordPage(),
                  ),
                );
              },
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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white,
              ),
              child: TableCalendar(
                rowHeight: 40,
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color of the header
                      borderRadius: BorderRadius.circular(10),
                    ),
                    titleTextStyle: TextStyles.record),
                availableGestures: AvailableGestures.all,
                daysOfWeekHeight: 30,
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyles.calendarDay,
                  weekendStyle: TextStyles.calendarDay,
                  decoration: BoxDecoration(
                    color: Colors
                        .white, // Background color of the days of the week
                  ),
                ),
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                onDaySelected: _onDaySelected,
                selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
                calendarFormat: _calendarFormat,
                calendarStyle: CalendarStyle(
                  selectedDecoration: const BoxDecoration(
                      color: AppColors.reminderBox, shape: BoxShape.circle),
                  todayDecoration: const BoxDecoration(
                      color: AppColors.iconBg, shape: BoxShape.circle),
                  defaultTextStyle: TextStyles.calendar,
                  selectedTextStyle: TextStyles.body,
                  todayTextStyle: TextStyles.calendar,
                  weekendTextStyle: TextStyles.calendar,
                  defaultDecoration: BoxDecoration(
                    color: Colors
                        .white, // Background color of the days of the week
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: _toggleCalendarFormat,
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(30, 5),
                      backgroundColor: Colors.grey),
                  child: const SizedBox(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (_selectedDay != null &&
                (_selectedDay!.isBefore(DateTime.now()) ||
                    _selectedDay!.isAtSameMomentAs(DateTime.now())) &&
                _selectedDay!.isAfter(DateTime(2024, 7, 1)))
              SleepProgress(
                sleep: sleep,
              ),
            //CHART
            Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Monthly Statistic",
                    style: TextStyles.statisticTitle,
                  ),
                  Text(
                    "July",
                    style: TextStyles.record,
                  ),
                  LineChartBuild(
                    timeChart: _sleepData,
                    maxY: 50,
                    cases: 3,
                  ),
                  // LineChartBuild(
                  // timeChart: [_sleepData],
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
