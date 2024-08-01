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
                width: double.maxFinite,
                height: 120,
                decoration: BoxDecoration(
                    color: AppColors.informationBox,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/run.png',
                        width: 100, height: 100),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 12, right: 12)),
                        Text(
                          "Jogging with Fredy",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          jog.duration,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${jog.calories} kcal in ${jog.duration} with ${jog.steps} steps",
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // CONTAINER DETAIL 1
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
                          "You burned calories of",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${jog.calories} kcal",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "It's equal to one grilled chicken breast!",
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
