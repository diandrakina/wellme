import 'package:flutter/material.dart';
import 'package:well_me/model/sleep.dart';
import 'package:well_me/styles/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SleepProgress extends StatelessWidget {
  const SleepProgress({
    super.key,
    required this.sleep,
  });

  final Sleep sleep;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(0),
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
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.iconBg),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.moon,
                          color: Colors.white,
                          size: 45,
                        ),
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
                              color: sleep.hours < 7 || sleep.hours > 9
                                  ? AppColors.redBox
                                  : AppColors.greenBox),
                          child: Center(
                            child: Text(
                              sleep.hours < 7 || sleep.hours > 9
                                  ? "Bad Quality"
                                  : "Good Quality",
                              style: TextStyles.sleepQuality,
                            ),
                          ),
                        ),
                        Text(
                          "${sleep.hours.toStringAsFixed(1)} hrs",
                          style: TextStyles.sleepDuration,
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
                height: 120,
                width: double.maxFinite,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/box_bayi_tidur.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "YOU SLEEP LIKE A BABY!",
                    style: TextStyles.fact,
                  ),
                ),
              )
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
