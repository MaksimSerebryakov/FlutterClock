import 'package:five_minutes_ready/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor =
        Provider.of<SettingsProvider>(context, listen: false).textColor;

    return SizedBox(
      child: Column(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
