import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../models/menu_item.dart';
import '../../widgets/section_header.dart';
import 'widgets/contact_tile.dart';

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
      color: ColorManager.neutral.shade50,
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile
            ? 24
            : context.isTablet
            ? 48
            : 128,
        vertical: context.isMobile ? 48 : 100,
      ),
      child: context.isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ContactInfo(l10n: l10n),
                const SizedBox(height: 48),
                _ContactForm(l10n: l10n),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _ContactInfo(l10n: l10n)),
                const SizedBox(width: 64),
                Expanded(child: _ContactForm(l10n: l10n)),
              ],
            ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final AppLocalizations l10n;
  const _ContactInfo({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          badge: l10n.contactBadge,
          title: l10n.contactTitle,
          description: l10n.contactDescription,
          badgeColor: ColorManager.primary,
        ),
        const SizedBox(height: 36),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContactTile(
              icon: 'assets/icons/mail.svg',
              label: l10n.contactLabelEmail,
              value: 'daviborges.sistemas@gmail.com',
            ),
            const SizedBox(height: 16),
            ContactTile(
              icon: 'assets/icons/github.svg',
              label: l10n.contactLabelGithub,
              value: 'davicezarborgesdeveloper',
            ),
            const SizedBox(height: 16),
            ContactTile(
              icon: 'assets/icons/linkedin.svg',
              label: l10n.contactLabelLinkedin,
              value: 'daviborgesdeveloper',
            ),
            const SizedBox(height: 16),
            ContactTile(
              icon: 'assets/icons/location.svg',
              label: l10n.contactLabelLocation,
              value: l10n.contactLocationValue,
            ),
          ],
        ),
      ],
    );
  }
}

class _ContactForm extends StatelessWidget {
  final AppLocalizations l10n;
  const _ContactForm({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.contactFormName,
          style: getMediumStyle(
            fontSize: FontSize.s16,
            color: ColorManager.foreground,
          ).inter,
        ),
        const SizedBox(height: 8),
        TextFormField(decoration: InputDecoration(hintText: l10n.contactFormNameHint)),
        const SizedBox(height: 24),
        Text(
          l10n.contactFormEmail,
          style: getMediumStyle(
            fontSize: FontSize.s16,
            color: ColorManager.foreground,
          ).inter,
        ),
        const SizedBox(height: 8),
        TextFormField(decoration: InputDecoration(hintText: l10n.contactFormEmailHint)),
        const SizedBox(height: 24),
        Text(
          l10n.contactFormMessage,
          style: getMediumStyle(
            fontSize: FontSize.s16,
            color: ColorManager.foreground,
          ).inter,
        ),
        const SizedBox(height: 8),
        TextField(
          minLines: 4,
          maxLines: 8,
          decoration: InputDecoration(hintText: l10n.contactFormMessageHint),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              l10n.contactFormSubmit,
              style: getMediumStyle(
                color: ColorManager.foreground,
                fontSize: FontSize.s16,
              ).inter,
            ),
          ),
        ),
      ],
    );
  }
}
