import 'package:flutter/material.dart';

class TimeCellData {
  static double hoursPosTop = -100;
  static double minutesPosTop = -100;
  static double hoursPosMid = -5;
  static double minutesPosMid = -5;
  static double hoursPosBot = 300;
  static double minutesPosBot = 300;
  static Duration durTop = Duration(milliseconds: 0);
  static Duration durMid = Duration(milliseconds: 1000);
  static Duration durBot = Duration(milliseconds: 1000);
  static Cubic curveTop = Curves.easeInCubic;
  static Cubic curveMid = Curves.easeOutCubic;
  static Cubic curveBot = Curves.easeInCubic;

  static List<double> timePos = [-100, -5, 300];
  static List<Duration> timeDur = [
    Duration(milliseconds: 0),
    Duration(milliseconds: 1000),
    Duration(milliseconds: 1000),
  ];
  static List<Cubic> timeCurve = [
    Curves.easeInCubic,
    Curves.easeOutCubic,
    Curves.easeInCubic,
  ];
  static List<String> hoursValue = [];
  static List<String> minutesValue = [];
}
