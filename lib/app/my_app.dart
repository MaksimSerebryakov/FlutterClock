import 'package:five_minutes_ready/providers/settings_provider.dart';
import 'package:five_minutes_ready/ui/navigation/navigation.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  static final navigation = NavigationRoutes();
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider(), lazy: true),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: navigation.routes,
        initialRoute: navigation.initialRoute,
      ),
    );
  }
}
