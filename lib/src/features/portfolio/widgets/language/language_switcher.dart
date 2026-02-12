import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/locale_controller.dart';
import 'package:nexus_core/src/features/portfolio/widgets/language/language_button.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: LocaleController.instance,
      builder: (context, child) {
        final currentLocale = LocaleController.instance.locale;
        return LanguageButton(currentLocale);
      },
    );
  }
}
