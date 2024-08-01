import 'package:well_me/widget/chart/individualChart.dart';

class ChartData {
  final double drinkAmount;
  final double runAmount;
  final double sleepAmount;

  ChartData(
      {required this.drinkAmount,
      required this.runAmount,
      required this.sleepAmount});

  List<IndividualChart> chart_data = [];

  void initializeChartData() {
    chart_data = [
      IndividualChart(x: 0, y: drinkAmount),
      IndividualChart(x: 0, y: runAmount),
      IndividualChart(x: 0, y: sleepAmount),
    ];
  }
}
