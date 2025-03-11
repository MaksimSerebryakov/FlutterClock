import 'package:five_minutes_ready/fileIO/app_file_storage.dart';
import 'package:five_minutes_ready/ui/date_time/theme/main_theme.dart';
import 'package:five_minutes_ready/ui/settings/entities/alarm.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  Map<String, dynamic> colors = {
    "textColor": MainTheme.timeColor,
    "backgroundColor": MainTheme.dateTimePageColor,
  };

  static const double fontSize = 140;

  Map<String, dynamic> bungee = {
    "textStyle": TextStyle(
      fontSize: fontSize,
      fontFamily: "BungeeShade",
      color: MainTheme.timeColor,
    ),
    "hoursPos": 0.0,
    "minutesPos": 300.0,
    "colonPos": 225.5,
  };

  List alarms = <Alarm>[];
  List<Map<String, dynamic>> alarmsJson = [];
  int alarmsIdCntr = 0;

  void setColor(Color color, String colorField) {
    colors[colorField] = color;
    if (colorField == "textColor") {
      bungee["textStyle"] = TextStyle(
        fontSize: fontSize,
        fontFamily: "BungeeShade",
        color: color,
      );
    }

    notifyListeners();
  }

  Future<void> getAlarmsFromFile() async {
    alarms = [];
    alarmsJson = [];

    final lol = await AppFileStorage.instance.readFromFile();

    if (lol == null || lol.length == 0) {
      return;
    }

    for (int i = 0; i < lol.length; i++) {
      alarms.add(Alarm.fromJson(lol[i]));
      alarmsJson.add(lol[i]);
    }

    alarmsIdCntr = alarmsJson[alarmsJson.length - 1]["id"] + 1;
    notifyListeners();
  }

  Future<void> addNewAlarm(int hours, int minutes, String readiness) async {
    final id = alarmsIdCntr;

    for (int i = 0; i < alarms.length; i++) {
      if (alarms[i].isTimeEqual(hours, minutes, readiness)) {
        return;
      }
    }

    alarms.add(
      Alarm(id: id, hour: hours, minute: minutes, readiness: readiness),
    );
    alarmsJson.add(
      Alarm(
        id: id,
        hour: hours,
        minute: minutes,
        readiness: readiness,
      ).toJson(),
    );

    alarmsIdCntr++;

    await AppFileStorage.instance.writeToFile(alarmsJson);

    // print("_____");
    // for (int i = 0; i < id + 1; i++) {
    //   print("${alarms[i].hour}, ${alarms[i].minute}, ${alarms[i].readiness}");
    // }
    // print("_____");

    notifyListeners();
  }

  Future<void> removeAlarm(Alarm alarm) async {
    alarms.remove(alarm);
    alarmsJson.removeWhere((item) => item["id"] == alarm.id);

    await AppFileStorage.instance.writeToFile(alarmsJson);
  }
}
