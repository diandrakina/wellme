import 'package:flutter/material.dart';
import 'package:well_me/model/jog.dart';
import 'package:well_me/styles/styles.dart';

class JoggingProgress extends StatelessWidget {
  const JoggingProgress({
    super.key,
    required this.jog,
  });

  final Jog jog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.maxFinite,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.informationBox,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/run.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Morning Jogging",
                            style: TextStyles.header_activity),
                        Text(jog.duration, style: TextStyles.sleepDuration),
                        Text(
                          "${jog.calories} kcal in ${jog.duration}\nwith ${jog.steps} steps",
                          style: TextStyles.description_activity,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // CONTAINER DETAIL 2
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
                        Text("You burned calories of",
                            style: TextStyles.description_activity),
                        Text("${jog.calories} kcal",
                            style: TextStyles.sleepDuration),
                        Text(
                          "It's equal to one grilled chicken breast!",
                          style: TextStyles.description_activity2,
                        ),
                      ],
                    ),
                    Image.asset('assets/images/chickenbreast.png',
                        width: 100, height: 130),
                  ],
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
