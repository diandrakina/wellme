import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:well_me/data/dummy_data.dart';
import 'package:well_me/model/jog.dart';
import 'package:well_me/styles/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:well_me/widget/bottomNavbar.dart';
import 'package:well_me/widget/jogging_progress.dart';
import 'package:well_me/widget/lineChart.dart';
import 'package:table_calendar/table_calendar.dart';
import 'joggingdetail.dart';

class JoggingPage extends StatefulWidget {
  const JoggingPage({super.key});

  @override
  State<JoggingPage> createState() => _JoggingPageState();
}

class _JoggingPageState extends State<JoggingPage> {
  List<Jog> jogs = generateJogData();

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
    Jog jog = jogs
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

            // CONTAINER REMINDER
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
                          "It's your time to move!",
                          style: TextStyles.body,
                        ),
                        Text(
                          "13.00 - 15.00",
                          style: TextStyles.time,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 71,
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

            // CONTAINER WALK NOW
            Container(
              padding: EdgeInsets.only(top: 15),
              width: double.maxFinite,
              height: 170,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/map.png'),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Be ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "ACTIVE",
                        style: TextStyle(
                          color: AppColors.redBox,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text("Take a walk, enjoy the nature, get a healthy body"),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: const Text("Start Now"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.recordBox,
                      foregroundColor: Colors.black,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JoggingDetailPage()));
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // CALENDAR
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
                    titleTextStyle: TextStyles.record),
                availableGestures: AvailableGestures.all,
                daysOfWeekHeight: 30,
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyles.calendarDay,
                    weekendStyle: TextStyles.calendarDay),
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
                    weekendTextStyle: TextStyles.calendar),
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
              JoggingProgress(
                jog: jog,
              ),

            // CHART
            Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Monthly Statistics",
                    style: TextStyles.statisticTitle,
                  ),
                  Text(
                    "July",
                    style: TextStyles.record,
                  ),
                  LineChartBuild()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
