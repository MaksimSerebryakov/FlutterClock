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
        color: const Color.fromARGB(255, 53, 28, 109),
        child: DateTimeWidget(),
      ),
    );
  }
}
