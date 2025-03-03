import 'package:five_minutes_ready/providers/settings_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlarmsListWidget extends StatefulWidget {
  const AlarmsListWidget({super.key});

  @override
  State<AlarmsListWidget> createState() => _AlarmsListWidgetState();
}

class _AlarmsListWidgetState extends State<AlarmsListWidget> {
  @override
  Widget build(BuildContext context) {
    final alarms = Provider.of<SettingsProvider>(context, listen: true).alarms;
    final colorMap =
        Provider.of<SettingsProvider>(context, listen: true).colors;

    return ListView.builder(
      itemCount: alarms.length,
      itemBuilder: (context, index) {
        final alarm = alarms[index];
        final String alarmHour =
            alarm.hour < 10 ? "0${alarm.hour}" : "${alarm.hour}";
        final String alarmMinute =
            alarm.minute < 10 ? "0${alarm.minute}" : "${alarm.minute}";
        return Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                "$alarmHour:$alarmMinute",
                style: TextStyle(fontSize: 16, color: colorMap["textColor"]),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Provider.of<SettingsProvider>(
                    context,
                    listen: false,
                  ).removeAlarm(alarm);
                  setState(() {});
                },
                child: Icon(Icons.clear, color: colorMap["textColor"], size: 30,),
              ),
            ),
          ],
        );
      },
    );
  }
}
