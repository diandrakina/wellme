import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:well_me/styles/styles.dart';

class LineChartBuild extends StatelessWidget {
  final List timeChart;
  final double maxY;
  final int cases;

  const LineChartBuild(
      {super.key,
      required this.timeChart,
      required this.maxY,
      required this.cases});

  @override
  Widget build(BuildContext context) {
    final List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ];

    void _showDetail(double y) {
      String qualityText;
      Color containerColor;

      switch (cases) {
        case 1:
          if (y < 50) {
            qualityText = "Bad Quality";
            containerColor = AppColors.redBox;
          } else if (y >= 50 && y <= 65) {
            qualityText = "Good Quality";
            containerColor = AppColors.greenBox;
          } else {
            qualityText = "Best Quality";
            containerColor = Color.fromARGB(255, 0, 122, 6);
          }
          break;
        case 2:
          if (y < 14) {
            qualityText = "Bad Quality";
            containerColor = AppColors.redBox;
          } else if (y >= 14 && y <= 20) {
            qualityText = "Good Quality";
            containerColor = AppColors.greenBox;
          } else {
            qualityText = "Best Quality";
            containerColor = Color.fromARGB(255, 0, 122, 6);
          }
          break;
        case 3:
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
          break;
        default:
          qualityText = "Unknown";
          containerColor = Colors.grey;
      }

      String _getTitle(int cases) {
        switch (cases) {
          case 1:
            return "This week you drink";
          case 2:
            return "This week you run";
          case 3:
            return "This week you sleep";
          default:
            return "";
        }
      }

      String _getValue(int cases, double y) {
        switch (cases) {
          case 1:
            return "$y glass";
          case 2:
            return "$y hrs";
          case 3:
            return "$y hrs";
          default:
            return "";
        }
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
                              _getTitle(cases),
                              style: TextStyles.statisticTitle,
                            ),
                            Text(
                              _getValue(cases, y),
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

    return Center(
      child: SizedBox(
        height: 200,
        width: 300,
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 3,
            minY: 0,
            maxY: maxY,
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
                spots: timeChart
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
