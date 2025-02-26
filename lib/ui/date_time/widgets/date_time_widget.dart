import 'dart:async';
import 'package:five_minutes_ready/ui/date_time/entities/time_cell_data.dart';
import 'package:five_minutes_ready/ui/date_time/widgets/time_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeWidget extends StatefulWidget {
  const DateTimeWidget({super.key});

  @override
  State<DateTimeWidget> createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  late Timer _timer;

  String minutesNow = DateFormat("mm").format(DateTime.now());
  String hoursNow = DateFormat("HH").format(DateTime.now());

  int hoursCntrPos = 1;
  int minutesCntrPos = 1;
  int minutesCntr = 1;
  int hoursCntr = 1;

  bool needChangeMinutes = false;
  bool needChangeHours = false;

  void _checkTime(Timer timer) {
    final now = DateTime.now();

    if (needChangeMinutes) {
      TimeCellData.minutesValue[0] = DateFormat(
        "mm",
      ).format(now.add(Duration(minutes: 1)));
      TimeCellData.minutesValue[1] = DateFormat("mm").format(now);
      TimeCellData.minutesValue[2] = DateFormat(
        "mm",
      ).format(now.add(Duration(minutes: 2)));

      minutesCntr += 1;
      minutesCntr = minutesCntr % 3;

      needChangeMinutes = false;
    }
    if (needChangeHours) {
      TimeCellData.hoursValue[0] = DateFormat(
        "HH",
      ).format(now.add(Duration(hours: 1)));
      TimeCellData.hoursValue[1] = DateFormat("HH").format(now);
      TimeCellData.hoursValue[2] = DateFormat(
        "HH",
      ).format(now.add(Duration(hours: 2)));

      hoursCntr += 1;
      hoursCntr = hoursCntr % 3;

      needChangeHours = false;
    }

    if (TimeCellData.hoursValue[1] != DateFormat("HH").format(now)) {
      hoursCntrPos += 1;

      needChangeHours = true;
    }
    if (TimeCellData.minutesValue[1] != DateFormat("mm").format(now)) {
      minutesCntrPos += 1;

      needChangeMinutes = true;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), _checkTime);

    final now = DateTime.now();

    TimeCellData.hoursValue.add(
      DateFormat("HH").format(now.add(Duration(hours: 1))),
    );
    TimeCellData.hoursValue.add(DateFormat("HH").format(now));
    TimeCellData.hoursValue.add(
      DateFormat("HH").format(now.add(Duration(hours: 2))),
    );
    TimeCellData.minutesValue.add(
      DateFormat("mm").format(now.add(Duration(minutes: 1))),
    );
    TimeCellData.minutesValue.add(DateFormat("mm").format(now));
    TimeCellData.minutesValue.add(
      DateFormat("mm").format(now.add(Duration(minutes: 2))),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TimeStackWidget(
            hoursIndexTop: (hoursCntrPos - 1) % 3,
            minutesIndexTop: (minutesCntrPos - 1) % 3,
            hoursIndexMid: hoursCntrPos % 3,
            minutesIndexMid: minutesCntrPos % 3,
            hoursIndexBot: (hoursCntrPos + 1) % 3,
            minutesIndexBot: (minutesCntrPos + 1) % 3,
            hoursCntr: hoursCntr % 3,
            minutesCntr: minutesCntr % 3,
          ),
        ],
      ),
    );
  }
}
