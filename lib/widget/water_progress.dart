import 'package:flutter/material.dart';
import 'package:well_me/styles/styles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WaterProgress extends StatelessWidget {
  const WaterProgress(
      {super.key,
      required this.glassDrank,
      required this.glassLimit,
      required this.waterConsumption});

  final int glassLimit;
  final int glassDrank;
  final int waterConsumption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 125,
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
                  radius: 48.0,
                  lineWidth: 5.0,
                  animation: true,
                  percent: 1,
                  center: Text(
                    (glassDrank * 100 / glassLimit).toString() + "%",
                    style: TextStyles.percentWater,
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
                        color: glassDrank == glassLimit
                            ? AppColors.greenBox
                            : AppColors.redBox),
                    child: Center(
                      child: Text(
                        glassDrank == glassLimit
                            ? "Goal achieved"
                            : 'Goal not achieved',
                        style: TextStyles.sleepQuality,
                      ),
                    ),
                  ),
                  Text(
                    glassDrank.toString() +
                        " /" +
                        glassLimit.toString() +
                        " Glass of water",
                    style: TextStyles.statisticHeader,
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
          padding: EdgeInsets.all(16),
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
                  Text("Total water consumption",
                      style: TextStyles.description_activity),
                  Text(waterConsumption.toString(),
                      style: TextStyles.sleepDuration),
                  Text(
                    "1/2 galoon of water",
                    style: TextStyles.description_activity2,
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/galoon.png"),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
