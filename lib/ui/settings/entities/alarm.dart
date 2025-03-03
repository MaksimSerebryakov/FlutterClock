class Alarm {
  final int id;
  final int hour;
  final int minute;
  final String readiness;
  bool isPlayedOnce = false;

  Alarm({
    required this.id,
    required this.hour,
    required this.minute,
    this.readiness = "10",
  });

  bool isTimeEqual(int hours, int minutes, String otherReadiness) {
    return (hours == hour && minutes == minute && otherReadiness == readiness);
  }

  bool itsAlarmTime(DateTime now) {
    final readinessToInt = int.parse(readiness);
    final alarmTime = now.add(Duration(minutes: readinessToInt));

    if (isPlayedOnce == false &&
        hour == alarmTime.hour &&
        minute == alarmTime.minute) {
      isPlayedOnce = true;
      return true;
    }
    if (isPlayedOnce == true && minute != alarmTime.minute) {
      isPlayedOnce = false;
    }

    return false;
  }

  static Alarm fromJson(Map<String, dynamic> json) => Alarm(
    id: json["id"] as int,
    hour: json["hour"] as int,
    minute: json["minute"] as int,
    readiness: json["readiness"] as String,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "hour": hour,
    "minute": minute,
    "readiness": readiness,
  };

  @override
  bool operator ==(dynamic other) => other.id == id;
}
