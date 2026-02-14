import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexus_core/src/core/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}
