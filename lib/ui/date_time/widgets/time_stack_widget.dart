import 'package:five_minutes_ready/ui/date_time/entities/time_cell_data.dart';
import 'package:flutter/material.dart';

class TimeStackWidget extends StatelessWidget {
  final int hoursIndexTop;
  final int minutesIndexTop;
  final int hoursIndexMid;
  final int minutesIndexMid;
  final int hoursIndexBot;
  final int minutesIndexBot;
  final String hoursTop;
  final String minutesTop;
  final String hoursMid;
  final String minutesMid;

  const TimeStackWidget({
    required this.hoursIndexTop,
    required this.minutesIndexTop,
    required this.hoursIndexMid,
    required this.minutesIndexMid,
    required this.hoursIndexBot,
    required this.minutesIndexBot,
    required this.hoursMid,
    required this.hoursTop,
    required this.minutesMid,
    required this.minutesTop,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          height: 60,
          width: 200,
          color: const Color.fromARGB(255, 53, 28, 109),
        ),
        TimeAnimatedPos(index: hoursIndexTop, left: 30, time: hoursTop),
        TimeAnimatedPos(index: minutesIndexTop, left: 112, time: minutesTop),
        TimeAnimatedPos(index: hoursIndexMid, left: 30, time: hoursMid),
        TimeAnimatedPos(index: minutesIndexMid, left: 112, time: minutesMid),
        TimeAnimatedPos(
          index: hoursIndexBot,
          left: 30,
          time: hoursMid,
        ),
        AnimatedPositioned(
          left: 112,
          top: minutesPosBot,
          duration: durBot,
          curve: curveBot,
          child: Text("23", style: TextStyle(fontSize: 52)),
        ),
      ],
    );
  }
}

class TimeAnimatedPos extends StatelessWidget {
  final double left;
  final int index;
  final String time;

  const TimeAnimatedPos({
    required this.index,
    required this.left,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: left,
      top: TimeCellData.timePos[index],
      duration: TimeCellData.timeDur[index],
      curve: TimeCellData.timeCurve[index],
      child: Text(time, style: TextStyle(fontSize: 52)),
    );
  }
}
