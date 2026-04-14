import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexus_core/src/core/app.dart';
import 'package:nexus_core/src/core/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupServiceLocator();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}
