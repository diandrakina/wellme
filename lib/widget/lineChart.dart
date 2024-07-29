import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:well_me/styles/styles.dart';

class LineChartBuild extends StatefulWidget {
  const LineChartBuild({super.key});

  @override
  State<LineChartBuild> createState() => _LineChartBuildState();
}

class _LineChartBuildState extends State<LineChartBuild> {
  final List<double> _sleepData = [42.5, 40.0, 45.0, 34];

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  void _showDetail(double y) {
    String qualityText;
    Color containerColor;

    if (y < 35) {
      qualityText = "Bad Quality";
      containerColor = AppColors.redBox;
    } else if (y >= 35 && y <= 42) {
      qualityText = "Good Quality";
      containerColor = AppColors.greenBox;
    } else {
      qualityText = "Best Quality";
      containerColor = Color.fromARGB(255, 0, 122, 6);
    }

    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 150,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: AppColors.informationBox,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "Weekly Statistic",
                    style: TextStyles.statisticHeader,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(2),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "This week you sleep",
                            style: TextStyles.statisticTitle,
                          ),
                          Text(
                            "$y hrs",
                            style: TextStyles.sleepDuration,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 30,
                        width: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: containerColor),
                        child: Center(
                          child: Text(
                            qualityText,
                            style: TextStyles.sleepQuality,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        width: 300,
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 3,
            minY: 0,
            maxY: 50,
            titlesData: LineTitles.getTitleData(),
            gridData: const FlGridData(
              show: false,
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, bar, index) =>
                      FlDotCirclePainter(
                    radius: 6,
                    color: gradientColors.first,
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                  ),
                ),
                spots: _sleepData
                    .asMap()
                    .entries
                    .map((e) => FlSpot(e.key.toDouble(), e.value))
                    .toList(),
                isCurved: true,
                gradient: LinearGradient(colors: gradientColors),
                barWidth: 5,
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: gradientColors
                        .map((color) => color.withOpacity(0.3))
                        .toList(),
                  ),
                ),
              ),
            ],
            lineTouchData: LineTouchData(
              handleBuiltInTouches: true,
              touchCallback:
                  (FlTouchEvent event, LineTouchResponse? touchResponse) {
                if (touchResponse != null &&
                    touchResponse.lineBarSpots != null &&
                    touchResponse.lineBarSpots!.isNotEmpty) {
                  final spot = touchResponse.lineBarSpots!.first;
                  _showDetail(spot.y);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false, interval: 10),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 0:
                  return Text(
                    "Week 1",
                    style: TextStyles.graph,
                  );
                case 1:
                  return Text(
                    'Week 2',
                    style: TextStyles.graph,
                  );
                case 2:
                  return Text(
                    'Week 3',
                    style: TextStyles.graph,
                  );
                case 3:
                  return Text(
                    'Week 4',
                    style: TextStyles.graph,
                  );
                default:
                  return const Text('');
              }
            },
          ),
        ),
      );
}
