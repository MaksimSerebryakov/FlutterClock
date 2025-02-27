import 'package:five_minutes_ready/ui/date_time/theme/main_theme.dart';
import 'package:five_minutes_ready/ui/date_time/widgets/date_time_widget.dart';
import 'package:flutter/material.dart';

class DateTimePage extends StatelessWidget {
  const DateTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: MainTheme.dateTimePageColor,
        child: DateTimeWidget(),
      ),
      floatingActionButton: SizedBox(
        width: 30,
        height: 30,
        child: FloatingActionButton(
          onPressed: () {},
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          backgroundColor: const Color.fromARGB(255, 31, 46, 133),
          child: const Icon(
            Icons.settings,
            color: MainTheme.dateTimePageColor,
            size: 15,
          ),
        ),
      ),
    );
  }
}
