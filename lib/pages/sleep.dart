import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:well_me/styles/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:well_me/widget/lineChart.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key});

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
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
            TableCalendar(
              rowHeight: 40,
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: _onDaySelected,
              selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
              calendarFormat: _calendarFormat,
            ),
            Center(
              child: ElevatedButton(
                onPressed: _toggleCalendarFormat,
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(30, 5),
                    backgroundColor: Colors.grey),
                child: const SizedBox(),
              ),
            ),
            if (_selectedDay != null)
              Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  height: 120,
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.informationBox,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.iconBg),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.moon,
                            color: Colors.white,
                            size: 45,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.redBox),
                            child: Center(
                              child: Text(
                                "Bad Quality",
                                style: TextStyles.sleepQuality,
                              ),
                            ),
                          ),
                          Text(
                            "5.2 hrs",
                            style: TextStyles.sleepDuration,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
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
