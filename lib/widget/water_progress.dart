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
                  percent: glassDrank/glassLimit,
                  center: Text(
                    (glassDrank * 100 / glassLimit).toString() + "%",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
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
                    waterConsumption.toString(),
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
              Image.asset('assets/images/galoon.png', width: 100, height: 130),
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