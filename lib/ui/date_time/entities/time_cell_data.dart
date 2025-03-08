import 'package:flutter/material.dart';

class TimeCellData {
  static List<double> timePos = [-200, -15, 200];
  static List<Duration> timeDur = [
    Duration(milliseconds: 0),
    Duration(milliseconds: 1000),
    Duration(milliseconds: 1000),
  ];
  static List<Cubic> timeCurve = [
    Curves.easeInCubic,
    Curves.easeOutQuad,
    Curves.easeInCubic,
  ];
  static List<String> hoursValue = [];
  static List<String> minutesValue = [];
}
