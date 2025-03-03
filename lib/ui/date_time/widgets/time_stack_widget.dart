import 'package:five_minutes_ready/providers/settings_provider.dart';
import 'package:five_minutes_ready/ui/date_time/entities/time_cell_data.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeStackWidget extends StatelessWidget {
  final int hoursIndexMid;
  final int minutesIndexMid;
  final int minutesCntr;
  final int hoursCntr;

  const TimeStackWidget({
    required this.hoursIndexMid,
    required this.minutesIndexMid,
    required this.minutesCntr,
    required this.hoursCntr,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final styleMap =
        Provider.of<SettingsProvider>(context, listen: true).bungee;
    double hoursPosLeft = styleMap["hoursPos"];
    double minutesPosLeft = styleMap["minutesPos"];

    final backgroundColor =
        Provider.of<SettingsProvider>(context, listen: false).colors["backgroundColor"];

    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(height: 100, width: 320, color: backgroundColor),
        Positioned(
          top: -10,
          left: styleMap["colonPos"],
          child: Text(
            DateTime.now().second % 2 == 0 ? "" : ":",
            style: styleMap["textStyle"],
          ),
        ),
        TimeAnimatedPos(
          index: (hoursIndexMid - 1) % 3,
          left: hoursPosLeft,
          isHours: true,
          timeCntr: (hoursCntr - 1) % 3,
          textStyle: styleMap["textStyle"],
        ),
        TimeAnimatedPos(
          index: (minutesIndexMid - 1) % 3,
          left: minutesPosLeft,
          isHours: false,
          timeCntr: (minutesCntr - 1) % 3,
          textStyle: styleMap["textStyle"],
        ),
        TimeAnimatedPos(
          index: hoursIndexMid,
          left: hoursPosLeft,
          isHours: true,
          timeCntr: hoursCntr,
          textStyle: styleMap["textStyle"],
        ),
        TimeAnimatedPos(
          index: minutesIndexMid,
          left: minutesPosLeft,
          isHours: false,
          timeCntr: minutesCntr,
          textStyle: styleMap["textStyle"],
        ),
        TimeAnimatedPos(
          index: (hoursIndexMid + 1) % 3,
          left: hoursPosLeft,
          isHours: true,
          timeCntr: (hoursCntr + 1) % 3,
          textStyle: styleMap["textStyle"],
        ),
        TimeAnimatedPos(
          index: (minutesIndexMid + 1) % 3,
          left: minutesPosLeft,
          isHours: false,
          timeCntr: (minutesCntr + 1) % 3,
          textStyle: styleMap["textStyle"],
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
  final TextStyle textStyle;

  const TimeAnimatedPos({
    required this.index,
    required this.left,
    required this.isHours,
    required this.timeCntr,
    required this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      // TODO: sheet code
      left: left,
      top: TimeCellData.timePos[index],
      duration: TimeCellData.timeDur[index],
      curve: TimeCellData.timeCurve[index],
      child: Text(
        isHours
            ? TimeCellData.hoursValue[timeCntr]
            : TimeCellData.minutesValue[timeCntr],
        style: textStyle,
      ),
    );
  }
}
