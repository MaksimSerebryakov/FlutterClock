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

  @override
  bool operator ==(dynamic other) => other.id == id;
}
