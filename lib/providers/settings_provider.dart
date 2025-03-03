import 'package:five_minutes_ready/ui/date_time/theme/main_theme.dart';
import 'package:five_minutes_ready/ui/settings/entities/alarm.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  Map<String, dynamic> colors = {
    "textColor": MainTheme.timeColor,
    "backgroundColor": MainTheme.dateTimePageColor,
  };

  Map<String, dynamic> bungee = {
    "textStyle": TextStyle(
      fontSize: 80,
      fontFamily: "BungeeShade",
      color: MainTheme.timeColor,
    ),
    "hoursPos": 13.0,
    "minutesPos": 175.0,
    "colonPos": 135.5,
  };

  List alarms = <Alarm>[];

  void setColor(Color color, String colorField) {
    colors[colorField] = color;
    if (colorField == "textColor") {
      bungee["textStyle"] = TextStyle(
        fontSize: 80,
        fontFamily: "BungeeShade",
        color: color,
      );
    }

    notifyListeners();
  }

  void addNewAlarm(int hours, int minutes, String readiness) {
    final id = alarms.length;

    for (int i = 0; i < id; i++) {
      if (alarms[i].isTimeEqual(hours, minutes, readiness)) {
        return;
      }
    }

    alarms.add(
      Alarm(id: id, hour: hours, minute: minutes, readiness: readiness),
    );

    // print("_____");
    // for (int i = 0; i < id + 1; i++) {
    //   print("${alarms[i].hour}, ${alarms[i].minute}, ${alarms[i].readiness}");
    // }
    // print("_____");

    notifyListeners();
  }

  void removeAlarm(Alarm alarm) {
    alarms.remove(alarm);
  }
}
