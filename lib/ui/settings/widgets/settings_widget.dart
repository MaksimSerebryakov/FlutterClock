import 'dart:convert';
import 'dart:io';

import 'package:five_minutes_ready/providers/settings_provider.dart';
import 'package:five_minutes_ready/ui/settings/widgets/add_alarm_widget.dart';
import 'package:five_minutes_ready/ui/settings/widgets/alarms_list_widget.dart';
import 'package:five_minutes_ready/ui/settings/widgets/color_picker_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        Provider.of<SettingsProvider>(
          context,
          listen: false,
        ).colors["backgroundColor"];

    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: EdgeInsets.fromLTRB(0, 10, 30, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                  child: ColorPickerWidget(
                    settingText: "цвет текста",
                    colorToSet: "textColor",
                    buttonColor: "backgroundColor",
                    buttonTextColor: "textColor",
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                  child: ColorPickerWidget(
                    settingText: "цвет фона",
                    colorToSet: "backgroundColor",
                    buttonColor: "backgroundColor",
                    buttonTextColor: "textColor",
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(70, 10, 10, 10),
                  child: AddAlarmWidget(),
                ),
              ],
            ),
          ),
          Expanded(flex: 1, child: AlarmsListWidget()),
        ],
      ),
    );
  }
}
