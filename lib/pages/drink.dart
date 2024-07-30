import 'dart:math';

import 'package:flutter/material.dart';
import 'package:well_me/styles/styles.dart';
import 'package:well_me/widget/lineChart.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DrinkPage extends StatefulWidget {
  const DrinkPage({super.key});

  @override
  State<DrinkPage> createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<List<Offset>> waves;
  int counter = 0;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat(reverse: false);
    waves = controller.drive(TweenWave(100, 20));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  incrementCounter() {
    setState(() {
      counter = counter + 10;
    });
    if (counter > 100) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          'Goal Achieved',
          style: TextStyle(color: Colors.black),
        ),
      ));
      counter = 100;
    }
  }

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
      padding: const EdgeInsets.only(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
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
                            "Minum air woy!",
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
            ),
            const SizedBox(height: 20),
            Container(
              height: 530,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: counter.toDouble()),
                      duration: const Duration(seconds: 1),
                      builder: (context, value, child) {
                        return FractionallySizedBox(
                          heightFactor: (value / 100).clamp(0, 1).toDouble(),
                          alignment: Alignment.bottomCenter,
                          child: ClipPath(
                            clipper: WaveClipperDesign(waves),
                            child: CustomPaint(
                              painter: WavePainterDesign(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: Text(
                      '$counter%',
                      style: const TextStyle(
                        fontSize: 120,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: ElevatedButton.icon(
                      onPressed: incrementCounter,
                      icon: const Icon(
                        Icons.water_drop,
                        color: Colors.blue,
                      ),
                      label: const Text(
                        'Add Water',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
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
                    _selectedDay!.isAtSameMomentAs(DateTime.now())))
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.informationBox,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: CircularPercentIndicator(
                              radius: 40.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: 1,
                              center: Text(
                                "100%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              backgroundColor: Colors.white,
                              progressColor: Colors.blue,
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
                                    color: AppColors.greenBox),
                                child: Center(
                                  child: Text(
                                    "Goal Achieved",
                                    style: TextStyles.sleepQuality,
                                  ),
                                ),
                              ),
                              Text(
                                "10/10 Glass of water",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
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
                                "Total water consumption",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "1750 ml",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "1/2 galoon of water",
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Image.asset('assets/images/chickenbreast.png',
                              width: 100, height: 130),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
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

class WaveClipperDesign extends CustomClipper<Path> {
  WaveClipperDesign(this.waves) : super(reclip: waves);
  Animation<List<Offset>> waves;

  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;

    final points = waves.value.map((e) => Offset(e.dx * w, e.dy)).toList();
    return Path()
      ..moveTo(0, h) // Move to the bottom left
      ..addPolygon(points, false)
      ..lineTo(w, h) // Ensure a straight line to the bottom right
      ..lineTo(w, h)
      ..lineTo(0, h) // Ensure a straight line to the bottom left
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WavePainterDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;

    // Define the gradients for each layer of waves
    final Gradient gradient1 = LinearGradient(
      colors: [
        Colors.blue.shade700.withOpacity(0.8),
        Colors.blue.shade400.withOpacity(0.7),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final Gradient gradient2 = LinearGradient(
      colors: [
        Colors.blue.shade600.withOpacity(0.8),
        Colors.blue.shade300.withOpacity(0.7),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final Gradient gradient3 = LinearGradient(
      colors: [
        Colors.blue.shade500.withOpacity(0.8),
        Colors.blue.shade200.withOpacity(0.7),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final paint1 = Paint()..shader = gradient1.createShader(rect);
    final paint2 = Paint()..shader = gradient2.createShader(rect);
    final paint3 = Paint()..shader = gradient3.createShader(rect);

    // Draw three layers of waves
    _drawWave(canvas, size, paint1, 0);
    _drawWave(canvas, size, paint2, 10);
    _drawWave(canvas, size, paint3, 20);
  }

  void _drawWave(Canvas canvas, Size size, Paint paint, double offset) {
    final Path path = Path();
    final double width = size.width;
    final double height = size.height;
    final double waveHeight = height / 4;
    final double waveLength = width / 2;

    path.moveTo(0, height);
    for (double x = 0; x <= width; x += waveLength) {
      path.quadraticBezierTo(
        x + waveLength / 4,
        height - waveHeight - offset,
        x + waveLength / 2,
        height,
      );
      path.quadraticBezierTo(
        x + 3 * waveLength / 4,
        height + waveHeight - offset,
        x + waveLength,
        height,
      );
    }
    path.lineTo(width, height);
    path.lineTo(width, 0);
    // path.lineTo(0, width);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TweenWave extends Animatable<List<Offset>> {
  TweenWave(this.count, this.height);

  final int count;
  final double height;
  static const waveCount = 3;
  @override
  List<Offset> transform(double t) {
    return List<Offset>.generate(count, (index) {
      final ratio = index / (count - 1);
      final waveHeight = 1 - (0.5 - ratio).abs() * 2;
      return Offset(
          ratio,
          waveHeight * height * sin(waveCount * (ratio + t) * pi * 2) +
              height * waveHeight);
    }, growable: false);
  }
}
