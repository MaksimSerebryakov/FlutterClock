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
  static const Map<String, dynamic> frijole = {
    "textStyle": TextStyle(
      fontSize: 80,
      fontFamily: "Frijole",
      color: MainTheme.timeColor,
    ),
    "hoursPos": 35.0,
    "minutesPos": 175.0,
    "colonPos": 140.5
  };
  static const Map<String, dynamic> rock3d = {
    "textStyle": TextStyle(
      fontSize: 80,
      fontFamily: "Rock3D",
      color: MainTheme.timeColor,
    ),
    "hoursPos": 35.0,
    "minutesPos": 175.0,
    "colonPos": 140.5
  };
  static const Map<String, dynamic> zenDots = {
    "textStyle": TextStyle(
      fontSize: 80,
      fontFamily: "ZenDots",
      color: MainTheme.timeColor,
    ),
    "hoursPos": 7.0,
    "minutesPos": 164.0,
    "colonPos": 129.5
  };
  static const Map<String, dynamic> rubikVinyl = {
    "textStyle": TextStyle(
      fontSize: 85,
      fontFamily: "RubikVinyl",
      color: MainTheme.timeColor,
    ),
    "hoursPos": 13.0,
    "minutesPos": 170.0,
    "colonPos": 129.5
  };
  static const timeColor = Color.fromARGB(255, 31, 46, 133);
}
