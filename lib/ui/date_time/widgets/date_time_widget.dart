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
  String dateStr = DateFormat('dd.MM.yyyy').format(DateTime.now());
  String timeStr = DateFormat('HH:mm').format(DateTime.now());

  int hoursIndexTop = 0;
  int hoursIndexMid = 1;
  int hoursIndexBot = 2;
  int minutesIndexTop = 0;
  int minutesIndexMid = 1;
  int minutesIndexBot = 2;

  void _getTime(Timer timer) {
    dateStr = DateFormat('dd.MM.yyyy').format(DateTime.now());
    timeStr = DateFormat('HH:mm').format(DateTime.now());

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), _getTime);
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
          
          TextButton(
            onPressed: () {
              final topPrev = minutesPosTop;
              final midPrev = minutesPosMid;
              final botPrev = minutesPosBot;
              final durTopPrev = durTop;
              final durMidPrev = durMid;
              final durBotPrev = durBot;
              final curveTopPrev = curveTop;
              final curveMidPrev = curveMid;
              final curveBotPrev = curveBot;

              minutesPosTop = midPrev;
              minutesPosMid = botPrev;
              minutesPosBot = topPrev;
              durTop = durMidPrev;
              durMid = durBotPrev;
              durBot = durTopPrev;

              curveTop = curveMidPrev;
              curveMid = curveBotPrev;
              curveBot = curveTopPrev;

              setState(() {});
            },
            child: Text("press"),
          ),
        ],
      ),
    );
  }
}
