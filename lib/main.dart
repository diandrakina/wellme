import 'package:flutter/material.dart';
import 'package:well_me/pages/sleep/sleepRecord.dart';
import 'package:well_me/tab_screen.dart';

final kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(1, 221, 243, 245));
final darkKColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 116, 128, 119),
);
void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      scaffoldBackgroundColor: const Color.fromARGB(255, 221, 243, 245),
    ),
    debugShowCheckedModeBanner: false,
    title: 'Well Me',
    // home: TabScreen(),
    home: SleepRecordPage(),
  ));
}
