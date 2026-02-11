import 'package:flutter/material.dart';

class LocaleController extends ChangeNotifier {
  static final LocaleController instance = LocaleController._();

  LocaleController._();

  Locale _locale = const Locale('pt');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (_locale != locale) {
      _locale = locale;
      notifyListeners();
    }
  }
}
