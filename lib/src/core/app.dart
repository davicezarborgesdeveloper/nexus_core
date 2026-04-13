import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexus_core/l10n/app_localizations.dart';
import 'package:nexus_core/src/core/resources/locale_controller.dart';
import 'package:nexus_core/src/core/resources/theme_manager.dart';
import 'package:nexus_core/src/core/service_locator.dart';
import 'package:nexus_core/src/modules/admin/admin_module.dart';
import 'package:nexus_core/src/modules/portfolio/pages/main/main_page.dart';

class MyApp extends StatefulWidget {
  static const MyApp _instance = MyApp._internal();

  const MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _adminModule = getIt<AdminModule>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: LocaleController.instance,
      builder: (context, child) {
        return MaterialApp(
          title: 'Nexus Core',
          debugShowCheckedModeBanner: false,
          locale: LocaleController.instance.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: getApplicationTheme(),
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }
              if (snapshot.hasData) {
                return _adminModule.createPage();
              }
              return const MainPage();
            },
          ),
        );
      },
    );
  }
}
