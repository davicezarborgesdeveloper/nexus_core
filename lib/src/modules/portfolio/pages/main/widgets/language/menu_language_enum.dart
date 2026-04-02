import 'dart:ui';

enum MenuLanguage {
  pt('BR', Locale('pt', 'BR'), {
    'pt': 'Português',
    'en': 'Portuguese',
    'es': 'Portugués',
    'it': 'Portoghese',
    'fr': 'Portugais',
    'de': 'Portugiesisch',
  }),
  en('US', Locale('en', 'US'), {
    'pt': 'Inglês',
    'en': 'English',
    'es': 'Inglés',
    'it': 'Inglese',
    'fr': 'Anglais',
    'de': 'Englisch',
  }),
  es('ES', Locale('es', 'ES'), {
    'pt': 'Espanhol',
    'en': 'Spanish',
    'es': 'Español',
    'it': 'Spagnolo',
    'fr': 'Espagnol',
    'de': 'Spanisch',
  }),
  it('IT', Locale('it', 'IT'), {
    'pt': 'Italiano',
    'en': 'Italian',
    'es': 'Italiano',
    'it': 'Italiano',
    'fr': 'Italien',
    'de': 'Italienisch',
  }),
  fr('FR', Locale('fr', 'FR'), {
    'pt': 'Francês',
    'en': 'French',
    'es': 'Francés',
    'it': 'Francese',
    'fr': 'Français',
    'de': 'Französisch',
  }),
  de('DE', Locale('de', 'DE'), {
    'pt': 'Alemão',
    'en': 'German',
    'es': 'Alemán',
    'it': 'Tedesco',
    'fr': 'Allemand',
    'de': 'Deutsch',
  });

  const MenuLanguage(this.code, this.locale, this._labels);

  final String code;
  final Locale locale;
  final Map<String, String> _labels;

  String labelFor(Locale currentLocale) =>
      _labels[currentLocale.languageCode] ?? _labels['en']!;
}
