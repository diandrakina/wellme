import 'package:flutter/material.dart';

class AppColors {
  static const background = Color.fromRGBO(221, 243, 245, 1);
  static const reminderBox = Color.fromRGBO(227, 99, 135, 1);
  static const recordBox = Color.fromRGBO(242, 170, 170, 1);
  static const informationBox = Color.fromRGBO(166, 220, 239, 1);
  static const redBox = Color.fromRGBO(215, 56, 59, 1);
  static const reminderText = Color.fromRGBO(255, 216, 162, 1);
}

class TextStyles {
  static TextStyle header = const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: Colors.black);

  static TextStyle reminder = const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: AppColors.reminderText);

  static TextStyle body = const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 16.4,
      color: Colors.white);

  static TextStyle time = const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.normal,
      fontSize: 12.48,
      color: Colors.white);

  static TextStyle record = const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.black);
}
