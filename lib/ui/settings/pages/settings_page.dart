import 'package:five_minutes_ready/providers/settings_provider.dart';
import 'package:five_minutes_ready/ui/settings/widgets/settings_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        Provider.of<SettingsProvider>(
          context,
          listen: false,
        ).colors["backgroundColor"];
    final textColor =
        Provider.of<SettingsProvider>(
          context,
          listen: false,
        ).colors["textColor"];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: textColor),
        ),
        title: Text(
          "Настройки",
          style: TextStyle(
            color: textColor,
            fontSize: 32,
            fontFamily: "RubikVinyl",
          ),
        ),
        backgroundColor: backgroundColor,
      ),
      body: const SettingsWidget(),
    );
  }
}
