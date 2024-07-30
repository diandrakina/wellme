import 'dart:math';

import 'package:well_me/model/drink.dart';
import 'package:well_me/model/jog.dart';
import 'package:well_me/model/sleep.dart';

List<Drink> generateDrinkData() {
  final DateTime now = DateTime.now();
  final int daysInMonth = DateTime(now.year, now.month + 1, 0).day;
  final Random random = Random();

  return List<Drink>.generate(daysInMonth, (index) {
    DateTime date = DateTime(now.year, now.month, index + 1);
    int glassLimit = 10; // Fixed limit
    int glassDrank = 5 + random.nextInt(6); // Random integer between 5 and 10
    int waterConsumption = glassDrank * 250; // Assuming each glass is 250ml

    return Drink(
      date: date,
      glassDrank: glassDrank,
      glassLimit: glassLimit,
      waterConsumption: waterConsumption,
    );
  });
}

List<Jog> generateJogData() {
  final Random random = Random();
  final DateTime now = DateTime.now();
  final int daysInMonth = DateTime(now.year, now.month + 1, 0).day;

  // Helper function to generate a random duration
  String generateRandomDuration() {
    int hours = 1 + random.nextInt(5); // Up to 4 hours
    String duration = '';
    if (hours > 0) {
      duration += '$hours hour${hours > 1 ? 's' : ''} ';
    }

    return duration.trim();
  }

  return List<Jog>.generate(daysInMonth, (index) {
    DateTime date = DateTime(now.year, now.month, index + 1);
    int calories =
        random.nextInt(1000) + 100; // Random calories between 100 and 1100
    String duration = generateRandomDuration(); // Random duration
    double km =
        random.nextDouble() * 10 + 1; // Random distance between 1 and 10 km
    int steps =
        (km * 1000).toInt(); // Approximate steps (assuming 1000 steps per km)

    return Jog(
      date: date,
      calories: calories,
      duration: duration,
      km: km,
      steps: steps,
    );
  });
}

List<Sleep> generateSleepData() {
  final Random random = Random();
  final DateTime now = DateTime.now();
  final int daysInMonth = DateTime(now.year, now.month + 1, 0).day;

  return List<Sleep>.generate(daysInMonth, (index) {
    DateTime date = DateTime(now.year, now.month, index + 1);
    double hours = random.nextDouble() * 10 + 2;

    return Sleep(
      date: date,
      hours: hours,
    );
  });
}
