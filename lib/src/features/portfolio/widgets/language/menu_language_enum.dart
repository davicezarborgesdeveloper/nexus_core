import 'dart:ui';

enum MenuLanguage {
  pt('Português', 'BR', Locale('pt')),
  en('English', 'US', Locale('en'));

  const MenuLanguage(this.label, this.code, this.locale);
  final String label;
  final String code;
  final Locale locale;
}
