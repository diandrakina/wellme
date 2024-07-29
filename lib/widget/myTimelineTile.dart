import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:well_me/styles/styles.dart';

class MyTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String activity;
  final String time;
  final String picture;

  const MyTimelineTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.activity,
      required this.time,
      required this.picture});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(color: AppColors.detailBox),
        afterLineStyle: LineStyle(color: AppColors.detailBox),
        indicatorStyle: IndicatorStyle(
          width: 27,
          color: AppColors.detailBox,
        ),
        endChild: SleepActivity(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$activity",
                        style: TextStyles.record,
                      ),
                      Text(
                        "$time",
                        style: TextStyles.statisticTitle,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("$picture"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SleepActivity extends StatelessWidget {
  final child;
  const SleepActivity({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 350,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.informationBox),
        child: child,
      ),
    );
  }
}
