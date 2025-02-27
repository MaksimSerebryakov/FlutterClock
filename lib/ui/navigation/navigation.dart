import 'package:five_minutes_ready/ui/settings/pages/settings_page.dart';
import 'package:flutter/material.dart';

import 'package:five_minutes_ready/ui/date_time/pages/date_time_page.dart';

abstract class NavigationRouteNames {
  static const String startPage = "/";
  static const String settingsPage = "settings";
}

class NavigationRoutes {
  final initialRoute = NavigationRouteNames.startPage;

  final routes = <String, Widget Function(BuildContext)> {
    NavigationRouteNames.startPage: (context) => const DateTimePage(),
    NavigationRouteNames.settingsPage: (context) => const SettingsPage(),
  };
}