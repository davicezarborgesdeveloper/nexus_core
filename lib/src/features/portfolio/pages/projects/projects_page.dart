import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../models/menu_item.dart';

class ProjectsPage extends StatefulWidget {
  final MenuItem menu;
  ProjectsPage(this.menu, {Key? key}) : super(key: key ?? menu.key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsetsGeometry.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: ColorManager.accent,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: Text(
              'Portifólio',
              style: getRegularStyle(
                color: ColorManager.background,
                fontSize: FontSize.s14,
              ).inter,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: context.isMobile
                ? double.infinity
                : context.percentWidth(.5),
            child: Text(
              'Projetos em destaque',
              style: getBoldStyle(
                color: ColorManager.neutral.shade900,
                fontSize: context.isMobile ? FontSize.s32 : FontSize.s48,
              ).inter,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: context.isMobile
                ? double.infinity
                : context.percentWidth(.5),
            child: Text(
              'Uma seleção de projetos que demonstram minha capacidade de criar soluções completas e escaláveis.',
              style: getRegularStyle(
                color: ColorManager.secondary,
                fontSize: context.isMobile ? FontSize.s16 : FontSize.s18,
              ).inter,
            ),
          ),
          const SizedBox(height: 64),
          // https://picsum.photos/590/256
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Container(
                width: 590,
                height: 640,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  border: Border.all(color: ColorManager.primary, width: 2),
                ),
                child: Column(
                  children: [
                    Flexible(
                      flex: 4,
                      child: Image.network(
                        'https://picsum.photos/590/256',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Flexible(flex: 6, child: Container(color: Colors.red)),
                  ],
                ),
              ),
              Container(
                width: 590,
                height: 640,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  border: Border.all(color: ColorManager.primary, width: 2),
                ),
                child: Column(
                  children: [
                    Flexible(
                      flex: 4,
                      child: Image.network(
                        'https://picsum.photos/590/256',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Flexible(flex: 6, child: Container(color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
