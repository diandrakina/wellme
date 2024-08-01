import 'package:flutter/material.dart';
import 'package:well_me/model/drink.dart';
import 'package:well_me/styles/styles.dart';
import 'package:well_me/widget/lineChart.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:well_me/widget/reminder.dart';
import 'package:well_me/widget/water_progress.dart';
import 'package:well_me/widget/waveAnimation.dart';
import 'package:well_me/data/dummy_data.dart';

class DrinkPage extends StatefulWidget {
  const DrinkPage({super.key});

  @override
  State<DrinkPage> createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();

  List<Drink> drinkData = generateDrinkData();

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
    Drink? selectedDrinkData = drinkData
        .where((element) =>
            element.date.year == _focusedDay.year &&
            element.date.month == _focusedDay.month &&
            element.date.day == _focusedDay.day)
        .first;

    return Padding(
      padding: const EdgeInsets.only(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Reminder(),
            ),
            const SizedBox(height: 20),
            WaveAnimation(
              check: _focusedDay.day == DateTime.now().day &&
                  _focusedDay.month == DateTime.now().month &&
                  _focusedDay.year == DateTime.now().year,
              glassDrank: selectedDrinkData.glassDrank,
              glassLimit: selectedDrinkData.glassLimit,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
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
                      color:
                          Colors.white, // Background color of the default days
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
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
            ),
            SizedBox(
              height: 20,
            ),
            if (_selectedDay != null &&
                (_selectedDay!.isBefore(DateTime.now()) ||
                    _selectedDay!.isAtSameMomentAs(DateTime.now())) &&
                _selectedDay!.isAfter(DateTime(2024, 7, 1)))
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: WaterProgress(
                  glassDrank: selectedDrinkData.glassDrank,
                  glassLimit: selectedDrinkData.glassLimit,
                  waterConsumption: selectedDrinkData.waterConsumption,
                ),
              ),
            //CHART
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
