import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:well_me/styles/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:well_me/widget/bottomNavbar.dart';
import 'package:well_me/widget/lineChart.dart';
import 'package:table_calendar/table_calendar.dart';
import 'joggingdetail.dart';

class JoggingPage extends StatefulWidget {
  const JoggingPage({super.key});

  @override
  State<JoggingPage> createState() => _JoggingPageState();
}

class _JoggingPageState extends State<JoggingPage> {

  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay){
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }
  
  void _toggleCalendarFormat(){
    setState(() {
      _calendarFormat = _calendarFormat == CalendarFormat.week ? CalendarFormat.month : CalendarFormat.week;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right:20),
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
                )
          ),

          const SizedBox(
            height: 20,
          ),

          // CONTAINER WALK NOW
          Container(
            padding: EdgeInsets.only(top:15),
            width: double.maxFinite,
            height: 170,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/map.png'),
              fit: BoxFit.cover)
            ),
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
                Text(
                  "Take a walk, enjoy the nature, get a healthy body"
                ),
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
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JoggingDetailPage())
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          // CALENDAR
          TableCalendar(
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
                color: AppColors.reminderBox, shape: BoxShape.circle
              ),
              todayDecoration: const BoxDecoration(
                color: AppColors.iconBg, shape: BoxShape.circle
              ),
              defaultTextStyle: TextStyles.calendar,
              selectedTextStyle: TextStyles.body,
              todayTextStyle: TextStyles.calendar,
              weekendTextStyle: TextStyles.calendar
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: _toggleCalendarFormat,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(30, 5),
                backgroundColor: Colors.grey
              ),
              child: const SizedBox(),
            ),
          ),
          if (_selectedDay != null)
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Container(
            width: double.maxFinite,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.informationBox,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/run.png', width: 100, height: 100),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 12, right: 12)),
                    Text(
                      "Jogging with Fredy",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight:FontWeight.w500),
                    ),
                    Text(
                      "13.6 km",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "230 kcal in 30 minutes with 7100 steps",
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          
          // CONTAINER DETAIL 1
          Container(
            padding: EdgeInsets.only(left:20),
            width: double.maxFinite,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.detailBox,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You burned calories of",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "210 kcal",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "It's equal to one grilled chicken breast!",
                    ),
                  ],
                ),
                Image.asset('assets/images/chickenbreast.png', width: 100, height: 130),
              ],
            ),
          ),
                ],
              ),
            ),

          const SizedBox(
            height: 20,
          ),
          
          // CHART
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white
            ),
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
