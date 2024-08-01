import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:well_me/styles/styles.dart';
import 'package:well_me/widget/chart/chartData.dart';

class Chart extends StatelessWidget {
  final List achievements;
  const Chart({super.key, required this.achievements});

  @override
  Widget build(BuildContext context) {
    ChartData chartData = ChartData(
      drinkAmount: achievements[0],
      runAmount: achievements[1],
      sleepAmount: achievements[2],
    );

    chartData.initializeChartData();
    return RotatedBox(
      quarterTurns: 1,
      child: BarChart(
        BarChartData(
          maxY: 100,
          minY: 0,
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  String text;
                  switch (value.toInt()) {
                    case 1:
                      text = 'drink';
                      break;
                    case 2:
                      text = 'run';
                      break;
                    case 3:
                      text = 'sleep';
                      break;
                    default:
                      return Container();
                  }
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 1,
                    child: Transform.translate(
                      offset: Offset(0, 15),
                      child: Transform.rotate(
                        angle: -3.14 / 2,
                        child: Text(text, style: TextStyles.graph),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          barGroups: [
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: chartData.drinkAmount.toDouble(),
                  width: 10,
                  color: AppColors.reminderBox,
                  borderRadius: BorderRadius.circular(12),
                  backDrawRodData: BackgroundBarChartRodData(
                      show: true, color: AppColors.background, toY: 100),
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  toY: chartData.runAmount.toDouble(),
                  width: 10,
                  color: AppColors.reminderBox,
                  borderRadius: BorderRadius.circular(12),
                  backDrawRodData: BackgroundBarChartRodData(
                      show: true, color: AppColors.background, toY: 100),
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  toY: chartData.sleepAmount.toDouble(),
                  width: 10,
                  color: AppColors.reminderBox,
                  borderRadius: BorderRadius.circular(12),
                  backDrawRodData: BackgroundBarChartRodData(
                      show: true, color: AppColors.background, toY: 100),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
