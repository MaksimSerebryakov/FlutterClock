import 'package:five_minutes_ready/providers/settings_provider.dart';
import 'package:five_minutes_ready/ui/date_time/theme/main_theme.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAlarmWidget extends StatefulWidget {
  const AddAlarmWidget({super.key});

  @override
  State<AddAlarmWidget> createState() => _AddAlarmWidgetState();
}

class _AddAlarmWidgetState extends State<AddAlarmWidget> {
  bool tenMinutesReady = true;
  @override
  Widget build(BuildContext context) {
    final colorMap =
        Provider.of<SettingsProvider>(context, listen: false).colors;
    final textStyle = TextStyle(color: colorMap["textColor"]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MainTheme.settingsButtonHeight,
          width: MainTheme.settingsButtonWidth,
          child: ElevatedButton(
            onPressed: addNewAlarm,
            style: ButtonStyle(
              side: WidgetStatePropertyAll(
                BorderSide(width: 3, color: colorMap["textColor"]),
              ),
              backgroundColor: WidgetStatePropertyAll(
                colorMap["backgroundColor"],
              ),
              elevation: WidgetStatePropertyAll(1.0),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
              ),
            ),
            child: Text(
              "Добавить время",
              style: TextStyle(color: colorMap["textColor"]),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "готовность:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorMap["textColor"],
          ),
        ),

        Row(
          children: [
            Text("5 минут", style: textStyle),
            SizedBox(width: 10),
            Switch(
              value: tenMinutesReady,
              onChanged: (value) {
                tenMinutesReady = value;
                setState(() {});
              },
              inactiveThumbColor: colorMap["textColor"],
              inactiveTrackColor: colorMap["backgroundColor"],
              trackOutlineColor: WidgetStatePropertyAll(colorMap["textColor"]),
              activeColor: colorMap["backgroundColor"],
              activeTrackColor: colorMap["textColor"],
            ),
            SizedBox(width: 10),
            Text("10 минут", style: textStyle),
          ],
        ),
      ],
    );
  }

  void addNewAlarm() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      helpText: "Выбери время",
      hourLabelText: "Часы",
      minuteLabelText: "Минуты",
      cancelText: "Отмена",
      confirmText: "Ok",
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.inputOnly,
    );

    if (time != null) {
      if (context.mounted) {
        await Provider.of<SettingsProvider>(
          context,
          listen: false,
        ).addNewAlarm(time.hour, time.minute, tenMinutesReady ? "10" : "5");
      }
    }
  }
}
