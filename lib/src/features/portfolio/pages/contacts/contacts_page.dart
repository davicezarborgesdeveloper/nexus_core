import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/resources/color_manager.dart';
import '../../models/menu_item.dart';

class ContactsPage extends StatefulWidget {
  final MenuItem menu;
  ContactsPage(this.menu, {Key? key}) : super(key: key ?? menu.key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      color: ColorManager.background,
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile
            ? 24
            : context.isTablet
            ? 48
            : 128,
        vertical: context.isMobile ? 48 : 100,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('Contato')],
      ),
    );
  }
}
