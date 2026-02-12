import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/locale_controller.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';
import 'package:nexus_core/src/features/portfolio/widgets/language/menu_language_enum.dart';

class LanguageButton extends StatelessWidget {
  final Locale currentLocale;

  const LanguageButton(this.currentLocale, {super.key});

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () =>
                controller.isOpen ? controller.close() : controller.open(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.language, color: ColorManager.secondary),
                  const SizedBox(width: 8),
                  Text(
                    currentLocale.languageCode.toUpperCase(),
                    style: getBoldStyle(
                      color: ColorManager.secondary,
                      fontSize: FontSize.s14,
                    ).inter,
                  ),
                ],
              ),
            ),
          ),
        );
      },

      menuChildren: MenuLanguage.values.map((language) {
        return MenuItemButton(
          onPressed: () {
            LocaleController.instance.setLocale(language.locale);
          },
          child: Row(
            children: [
              Row(
                children: [
                  Text(
                    language.code.toUpperCase(),
                    style: getBoldStyle(
                      color: ColorManager.secondary,
                      fontSize: FontSize.s14,
                    ).inter,
                  ),
                  const SizedBox(width: 8),
                  Text(language.label),
                ],
              ),
              Icon(
                Icons.check,
                size: 16,
                color:
                    currentLocale.languageCode == language.locale.languageCode
                    ? ColorManager.secondary
                    : Colors.transparent,
              ),
            ],
          ),
        );
      }).toList(),
      style: MenuStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
        elevation: WidgetStateProperty.all(8),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 16),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
