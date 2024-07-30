import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:well_me/pages/jogging.dart';
import 'package:well_me/styles/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:well_me/widget/bottomNavbar.dart';

import 'package:video_player/video_player.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
// import 'package:pedometer/pedometer.dart';

class JoggingDetailPage extends StatefulWidget{
  const JoggingDetailPage({super.key});

  @override
  State<JoggingDetailPage> createState() => _JoggingDetailPageState();
}

class _JoggingDetailPageState extends State<JoggingDetailPage>{
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  Timer? stepTimer;
  bool isRunning = true;
  bool isPaused = false;
  int stepCounter = 0;

  late VideoPlayerController _controller;
  // late Stream<StepCount> stepCountStream;

  void initState(){
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/videos/wellmejogging.mp4',
    )
    ..initialize().then((_){
      setState(() {});
      start();
      _controller.play();
      _controller.setLooping(true);

      // stepCountStream = Pedometer.stepCountStream;
      // stepCountStream.listen(onStepCount).onError(onStepCountError);
    });
  }

  void startStepTimer(){

    stepTimer = Timer.periodic(
      Duration(seconds:2), (timer){
        if(isRunning){
          setState(() {
            stepCounter += 1;
            print("Step count updated: $stepCounter");
          });
        }
      });
  }

  // void onStepCount(StepCount event){
  //   print("Step count: ${event.steps}");
  //   setState(() {
  //     stepCounter = event.steps;
  //   });
  // }

  // void onStepCountError(error){
  //   print('onStepCounterror: $error');
  // }

  void stop(){
    timer!.cancel();
    stepTimer?.cancel();
    setState(() {
      isRunning = false;
      isPaused = true;
    });
    _controller.pause();
  }

  void reset(){
    timer!.cancel();
    stepTimer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";

      isRunning = false;
      isPaused = true;
      stepCounter = 0;
    });
    _controller.seekTo(Duration.zero);
    _controller.pause();
  }

  void start(){
    setState(() {
      isRunning = true;
      isPaused = false;
    });
    timer = Timer.periodic(Duration(seconds: 1), (timer){
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59){
        if (localMinutes > 59){
          localHours++;
          localMinutes = 0;
        }else{
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState((){
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
        digitHours = (hours >= 10) ? "$hours" : "0$hours";
      });
    });
    _controller.play();
    startStepTimer();
  }

  double calculatedDistance(int steps){
    const double stepsPerKm = 1350.0;
    return steps/stepsPerKm;
  }

  double calculatedCalories(int steps){
    const double stepsPerCalories = 100.0;
    return steps/stepsPerCalories;
  }

  @override
  void dispose () {
    _controller.dispose();
    stepTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Jogging"),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: _controller.value.isInitialized ? 
            AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller),) : CircularProgressIndicator(),
          ),
          // DETAIL
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.only(top:15, left:15),
                height: 180,
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jogging Time"
                                ),
                                Text(
                                  "$digitHours:$digitMinutes:$digitSeconds",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            IconButton( 
                              icon: Icon(isPaused ? Icons.play_circle_fill : Icons.pause_circle_filled),
                              iconSize: 50,
                              color: AppColors.iconBg,
                              onPressed: (){
                                if (isPaused){
                                  start();
                                }else{
                                  stop();
                                }
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.stop_circle),
                              iconSize: 50,
                              color: AppColors.iconBg,
                              onPressed: (){
                                stop();
                                PanaraConfirmDialog.show(
                                  context,
                                  title: "Restart or Save?",
                                  message: "Do you want to restart jogging or save your record",
                                  cancelButtonText: "Restart",
                                  confirmButtonText: "Save",
                                  onTapCancel: (){
                                    reset();
                                    start();
                                    Navigator.pop(context);
                                  },
                                  onTapConfirm: (){
                                    PanaraInfoDialog.show(
                                      context,
                                      title: "Record saved",
                                      message: "Your jogging record for today is saved",
                                      buttonText: "Okay",
                                      onTapDismiss: (){
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      panaraDialogType: PanaraDialogType.normal,
                                      barrierDismissible: false,
                                    );
                                    reset();
                                  },
                                  panaraDialogType: PanaraDialogType.normal,
                                  barrierDismissible: false,
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // CONTAINER DETAIL
                        Container(
                          width: 340,
                          height: 80,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              // SUB-CONTAINER JARAK
                              Container(
                                padding: EdgeInsets.all(10),
                                width: 105,
                                height: 70,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(padding: EdgeInsets.only(left:10)),
                                    const FaIcon(
                                      FontAwesomeIcons.personWalking,
                                      color: Colors.blue,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${calculatedDistance(stepCounter).toStringAsFixed(2)}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "km",
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              // SUB-CONTAINER KALORI
                              Container(
                                padding: EdgeInsets.all(10),
                                width: 105,
                                height: 70,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(padding: EdgeInsets.only(left:10)),
                                    const FaIcon(
                                      FontAwesomeIcons.fire,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${calculatedCalories(stepCounter).toStringAsFixed(1)}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "kcal",
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              // SUB-CONTAINER STEPS
                              Container(
                                padding: EdgeInsets.only(top:10, left:10, bottom: 10),
                                width: 105,
                                height: 70,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(padding: EdgeInsets.only(left:10)),
                                    const FaIcon(
                                      FontAwesomeIcons.boltLightning,
                                      color: Color.fromARGB(255, 231, 208, 8),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "$stepCounter",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "steps",
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}