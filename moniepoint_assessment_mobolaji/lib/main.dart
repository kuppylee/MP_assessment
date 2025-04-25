import 'package:flutter/material.dart';
import 'package:moniepoint_assessment_mobolaji/utils/theme.dart';

import 'UI/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real Estate',
      theme: AppTheme.lightTheme(context),
      home: FloatingNavBarWithTabs(),
      //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
