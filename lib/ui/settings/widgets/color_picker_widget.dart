import 'package:five_minutes_ready/providers/settings_provider.dart';
import 'package:five_minutes_ready/ui/date_time/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class ColorPickerWidget extends StatelessWidget {
  final String settingText;
  final String colorToSet;
  final String buttonColor;
  final String buttonTextColor;

  const ColorPickerWidget({
    required this.settingText,
    required this.colorToSet,
    required this.buttonColor,
    required this.buttonTextColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorMap =
        Provider.of<SettingsProvider>(context, listen: false).colors;

    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: colorMap[colorToSet],
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          height: MainTheme.settingsButtonHeight,
          width: MainTheme.settingsButtonWidth,
          child: ElevatedButton(
            onPressed: () => pickColor(context, colorMap[colorToSet]),
            style: ButtonStyle(
              side: WidgetStatePropertyAll(
                BorderSide(width: 3, color: colorMap[buttonTextColor]),
              ),
              backgroundColor: WidgetStatePropertyAll(colorMap[buttonColor]),
              elevation: WidgetStatePropertyAll(1.0),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
              ),
            ),
            child: Text(
              settingText,
              style: TextStyle(color: colorMap[buttonTextColor]),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context, Color textColor) => ColorPicker(
    enableAlpha: false,
    pickerColor: textColor,
    onColorChanged: (color) {
      Provider.of<SettingsProvider>(
        context,
        listen: false,
      ).setColor(color, colorToSet);
    },
  );

  void pickColor(BuildContext context, Color textColor) => showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text("Выбери цвет"),
          content: buildColorPicker(context, textColor),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ок"),
            ),
          ],
        ),
  );
}
