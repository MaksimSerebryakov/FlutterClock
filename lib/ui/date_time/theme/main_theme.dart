import 'package:flutter/material.dart';

abstract class MainTheme {
  static const dateTimePageColor = Color.fromARGB(255, 254, 247, 229);
  static const Map<String, dynamic> bungee = {
    "textStyle": TextStyle(
      fontSize: 80,
      fontFamily: "BungeeShade",
      color: MainTheme.timeColor,
    ),
    "hoursPos": 13.0,
    "minutesPos": 175.0,
    "colonPos": 135.5
  };
  static const timeColor = Color.fromARGB(255, 31, 46, 133);
}
