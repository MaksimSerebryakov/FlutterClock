import 'package:flutter/material.dart';

class TimeCellData {
  static List<double> timePos = [-100, -5, 300];
  static List<Duration> timeDur = [
    Duration(milliseconds: 0),
    Duration(milliseconds: 1200),
    Duration(milliseconds: 1200),
  ];
  static List<Cubic> timeCurve = [
    Curves.easeInCubic,
    Curves.easeOutQuad,
    Curves.easeInCubic,
  ];
  static List<String> hoursValue = [];
  static List<String> minutesValue = [];
}
