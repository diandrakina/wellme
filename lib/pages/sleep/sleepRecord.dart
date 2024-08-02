import 'package:flutter/material.dart';
// import 'package:flutter_gifimage/flutter_gifimage.dart'; // Import untuk animasi GIF
import 'dart:async';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:well_me/pages/sleep/sleep.dart';
import 'package:well_me/styles/styles.dart';
import 'package:well_me/widget/myTimelineTile.dart';

class SleepRecordPage extends StatefulWidget {
  const SleepRecordPage({super.key});

  @override
  State<SleepRecordPage> createState() => _SleepRecordPageState();
}

class _SleepRecordPageState extends State<SleepRecordPage> {
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = true;

  void initState() {
    super.initState();
    start();
  }

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";

      started = false;
    });
  }

  void start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
        digitHours = (hours >= 10) ? "$hours" : "0$hours";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.maxFinite,
        toolbarHeight: 140,
        backgroundColor: AppColors.background,
        leading: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24),
                ),
                Text(
                  "Sleep Record",
                  style: TextStyles.record,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "$digitHours:$digitMinutes:$digitSeconds",
                style: TextStyles.timer,
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(padding: EdgeInsets.all(8)),
              Container(
                height: 320,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/sleep2.gif'),
                        fit: BoxFit.cover)),
              ),
              // Image.asset('assets/sleep2.gif'),
              Padding(padding: EdgeInsets.all(8)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.reminderBox,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  stop();
                  PanaraConfirmDialog.show(
                    context,
                    title: "Restart or Save?",
                    message: "Do you want to restart or save your record",
                    cancelButtonText: "Restart",
                    confirmButtonText: "Save",
                    onTapCancel: () {
                      reset();
                      start();
                      Navigator.pop(context);
                    },
                    onTapConfirm: () {
                      PanaraInfoDialog.show(
                        context,
                        title: "Record saved",
                        message: "Your sleep record for today is saved",
                        buttonText: "Okay",
                        onTapDismiss: () {
                          Navigator.pop(context);
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
                child: Text(
                  "Stop Record",
                  style: TextStyles.body,
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),

              Container(
                height: 390,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        MyTimelineTile(
                          isFirst: true,
                          isLast: false,
                          isPast: true,
                          activity: "You Snore",
                          time: "22.00",
                          picture: "assets/images/snore.png",
                        ),
                        MyTimelineTile(
                            isFirst: false,
                            isLast: false,
                            isPast: false,
                            activity: "You Talk",
                            time: "00.15",
                            picture: "assets/images/talk.png"),
                        MyTimelineTile(
                            isFirst: false,
                            isLast: false,
                            isPast: false,
                            activity: "You Snore",
                            time: "00.30",
                            picture: "assets/images/snore.png"),
                        MyTimelineTile(
                          isFirst: false,
                          isLast: false,
                          isPast: false,
                          activity: "You Wake",
                          time: "03.00",
                          picture: "assets/images/wake.png",
                        ),
                        MyTimelineTile(
                          isFirst: false,
                          isLast: true,
                          isPast: false,
                          activity: "You Wake",
                          time: "04.00",
                          picture: "assets/images/wake.png",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(6)),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(items: ),
    );
  }
}
