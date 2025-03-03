import 'package:five_minutes_ready/providers/settings_provider.dart';
import 'package:five_minutes_ready/ui/navigation/navigation.dart';
import 'package:five_minutes_ready/ui/date_time/widgets/date_time_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DateTimePage extends StatelessWidget {
  const DateTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        Provider.of<SettingsProvider>(
          context,
          listen: true,
        ).colors["backgroundColor"];
    final textColor =
        Provider.of<SettingsProvider>(
          context,
          listen: true,
        ).colors["textColor"];

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: backgroundColor,
        child: DateTimeWidget(),
      ),
      floatingActionButton: SizedBox(
        width: 30,
        height: 30,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(NavigationRouteNames.settingsPage);
          },
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          backgroundColor: textColor,
          child: Icon(Icons.settings, color: backgroundColor, size: 15),
        ),
      ),
    );
  }
}
