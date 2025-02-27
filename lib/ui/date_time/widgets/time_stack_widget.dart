import 'package:five_minutes_ready/ui/date_time/entities/time_cell_data.dart';
import 'package:five_minutes_ready/ui/date_time/theme/main_theme.dart';
import 'package:flutter/material.dart';

class TimeStackWidget extends StatelessWidget {
  final int hoursIndexTop;
  final int minutesIndexTop;
  final int hoursIndexMid;
  final int minutesIndexMid;
  final int hoursIndexBot;
  final int minutesIndexBot;
  final int minutesCntr;
  final int hoursCntr;

  const TimeStackWidget({
    required this.hoursIndexTop,
    required this.minutesIndexTop,
    required this.hoursIndexMid,
    required this.minutesIndexMid,
    required this.hoursIndexBot,
    required this.minutesIndexBot,
    required this.minutesCntr,
    required this.hoursCntr,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double hoursPosLeft = 48;
    const double minutesPosLeft = 158;

    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(height: 100, width: 300, color: MainTheme.dateTimePageColor),
        Positioned(
          top: -10,
          left: 135.5,
          child: Text(
            DateTime.now().second % 2 == 0 ? "" : ":",
            style: MainTheme.timeTextStyle,
          ),
        ),
        TimeAnimatedPos(
          index: hoursIndexTop,
          left: hoursPosLeft,
          isHours: true,
          timeCntr: (hoursCntr - 1) % 3,
        ),
        TimeAnimatedPos(
          index: minutesIndexTop,
          left: minutesPosLeft,
          isHours: false,
          timeCntr: (minutesCntr - 1) % 3,
        ),
        TimeAnimatedPos(
          index: hoursIndexMid,
          left: hoursPosLeft,
          isHours: true,
          timeCntr: hoursCntr,
        ),
        TimeAnimatedPos(
          index: minutesIndexMid,
          left: minutesPosLeft,
          isHours: false,
          timeCntr: minutesCntr,
        ),
        TimeAnimatedPos(
          index: hoursIndexBot,
          left: hoursPosLeft,
          isHours: true,
          timeCntr: (hoursCntr + 1) % 3,
        ),
        TimeAnimatedPos(
          index: minutesIndexBot,
          left: minutesPosLeft,
          isHours: false,
          timeCntr: (minutesCntr + 1) % 3,
        ),
      ],
    );
  }
}

class TimeAnimatedPos extends StatelessWidget {
  final double left;
  final int index;
  final bool isHours;
  final int timeCntr;

  const TimeAnimatedPos({
    required this.index,
    required this.left,
    required this.isHours,
    required this.timeCntr,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: left,
      top: TimeCellData.timePos[index],
      duration: TimeCellData.timeDur[index],
      curve: TimeCellData.timeCurve[index],
      child: Text(
        isHours
            ? TimeCellData.hoursValue[timeCntr]
            : TimeCellData.minutesValue[timeCntr],
        style: MainTheme.timeTextStyle,
      ),
    );
  }
}
