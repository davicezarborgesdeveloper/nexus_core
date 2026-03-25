import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../models/menu_item.dart';
import '../../widgets/section_header.dart';
import 'widgets/timeline_experience.dart';

class ExperiencePage extends StatefulWidget {
  final MenuItem menu;
  ExperiencePage(this.menu, {Key? key}) : super(key: key ?? menu.key);
  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
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
          SectionHeader(
            badge: l10n.expBadge,
            title: l10n.expTitle,
            description: l10n.expDescription,
          ),
          const SizedBox(height: 64),
          const Column(
            children: [
              TimelineExperience(isFirst: true),
              TimelineExperience(),
              TimelineExperience(),
              TimelineExperience(isLast: true),
            ],
          ),
          const SizedBox(height: 64),
          Center(
            child: SizedBox(
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download_outlined, color: Colors.white),
                label: Text(
                  l10n.expDownloadResume,
                  style: getBoldStyle(
                    color: Colors.white,
                    fontSize: FontSize.s16,
                  ).inter,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
