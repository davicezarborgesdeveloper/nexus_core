import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  static const MyApp _instance = MyApp._internal();

  const MyApp._internal(); // private named constructor

  factory MyApp() => _instance; // factory for the class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nexus Core',
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
    );
  }
}
