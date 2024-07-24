import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:well_me/styles/styles.dart';

class LineChartBuild extends StatefulWidget {
  @override
  State<LineChartBuild> createState() => _LineChartBuildState();
}

class _LineChartBuildState extends State<LineChartBuild> {
  // final List<double> _sleepData = [42.5, 40.0, 45.0, 38.5];

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 260,
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
                spots: [
                  FlSpot(0, 42.5),
                  FlSpot(1, 40),
                  FlSpot(2, 45),
                  FlSpot(3, 38.5)
                ],
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
          sideTitles: SideTitles(showTitles: false),
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
                  return Text('');
              }
            },
          ),
        ),
      );
}
