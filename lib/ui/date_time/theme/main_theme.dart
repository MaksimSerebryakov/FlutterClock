import 'package:flutter/material.dart';

abstract class MainTheme {
  static const dateTimePageColor = Color.fromARGB(255, 254, 247, 229);
  static Map<String, dynamic> bungee = {
    "textStyle": TextStyle(
      fontSize: 30,
      fontFamily: "BungeeShade",
      color: Colors.white,
    ),
    "hoursPos": 40.0,
    "minutesPos": 175.0,
    "colonPos": 135.5,
  };
  static Color timeColor = Color.fromARGB(255, 31, 46, 133);
  static const double settingsButtonHeight = 30;
  static const double settingsButtonWidth = 200;
}
