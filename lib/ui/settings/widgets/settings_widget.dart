import 'package:five_minutes_ready/providers/settings_provider.dart';
import 'package:five_minutes_ready/ui/date_time/theme/main_theme.dart';
import 'package:five_minutes_ready/ui/settings/widgets/color_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor =
        Provider.of<SettingsProvider>(context, listen: false).textColor;
    final backgroundColor =
        Provider.of<SettingsProvider>(context, listen: false).backgroundColor;

    return Container(
      width: double.infinity,
      color: MainTheme.dateTimePageColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                child: ColorPickerWidget(),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  side: WidgetStatePropertyAll(
                    BorderSide(width: 3, color: textColor),
                  ),
                  backgroundColor: WidgetStatePropertyAll(backgroundColor),
                  elevation: WidgetStatePropertyAll(1.0),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                  ),
                ),
                child: Text("цвет текста", style: TextStyle(color: textColor)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
