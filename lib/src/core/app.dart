import 'package:flutter/material.dart';
import 'package:nexus_core/l10n/app_localizations.dart';
import 'package:nexus_core/src/core/resources/locale_controller.dart';
import 'package:nexus_core/src/core/resources/theme_manager.dart';
import 'package:nexus_core/src/features/portfolio/pages/main/main_page.dart';

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
      locale: LocaleController.instance.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: getApplicationTheme(),
      home: MainPage(),
    );
  }
}
