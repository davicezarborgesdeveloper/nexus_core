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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(
                  badge: 'Contato',
                  title: 'Vamos trabalhar juntos',
                  description:
                      'Estou sempre aberto a discutir novos projetos, ideias criativas ouoportunidades de fazer parte de sua visão.',
                  badgeColor: ColorManager.primary,
                ),
                const SizedBox(height: 36),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContactTile(
                      icon: 'assets/icons/mail.svg',
                      label: 'Email',
                      value: 'daviborges.sistemas@gmail.com',
                    ),
                    SizedBox(height: 16),
                    ContactTile(
                      icon: 'assets/icons/github.svg',
                      label: 'GitHub',
                      value: 'davicezarborgesdeveloper',
                    ),
                    SizedBox(height: 16),
                    ContactTile(
                      icon: 'assets/icons/linkedin.svg',
                      label: 'LinkedIn',
                      value: 'daviborgesdeveloper',
                    ),
                    SizedBox(height: 16),
                    ContactTile(
                      icon: 'assets/icons/location.svg',
                      label: 'Localização',
                      value: 'São Paulo, Brasil',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 64),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Nome',
                  style: getMediumStyle(
                    fontSize: FontSize.s16,
                    color: ColorManager.foreground,
                  ).inter,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Seu nome'),
                ),
                const SizedBox(height: 24),
                Text(
                  'E-mail',
                  style: getMediumStyle(
                    fontSize: FontSize.s16,
                    color: ColorManager.foreground,
                  ).inter,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Seu@email'),
                ),
                const SizedBox(height: 24),
                Text(
                  'Mensagem',
                  style: getMediumStyle(
                    fontSize: FontSize.s16,
                    color: ColorManager.foreground,
                  ).inter,
                ),
                const SizedBox(height: 8),
                const TextField(
                  minLines: 4,
                  maxLines: 8,
                  decoration: InputDecoration(hintText: 'Digite sua mensagem'),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Enviar mensagem',
                      style: getMediumStyle(
                        color: ColorManager.foreground,
                        fontSize: FontSize.s16,
                      ).inter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
