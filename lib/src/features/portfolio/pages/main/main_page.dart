import 'package:flutter/material.dart';
import 'package:nexus_core/l10n/app_localizations.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/features/portfolio/models/menu_item.dart';
import 'package:nexus_core/src/features/portfolio/pages/home/home_page.dart';
import 'package:nexus_core/src/features/portfolio/pages/main/widgets/app_bar_nexus_core.dart';
import 'package:nexus_core/src/features/portfolio/pages/main/widgets/main_drawer.dart';

import '../experience/experience_page.dart';
import '../skills/skills_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<MenuItem>? _menu;
  List<MenuItem> get menu => _menu!;

  final String name = 'Davi Cezário Borges';
  bool _isDrawerOpen = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _menu = [
      MenuItem(AppLocalizations.of(context)!.navHome, GlobalKey()),
      MenuItem(AppLocalizations.of(context)!.navSkills, GlobalKey()),
      MenuItem(AppLocalizations.of(context)!.navExperience, GlobalKey()),
      MenuItem(AppLocalizations.of(context)!.navProjects, GlobalKey()),
      MenuItem(AppLocalizations.of(context)!.navContact, GlobalKey()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      onDrawerChanged: (isOpen) => setState(() => _isDrawerOpen = isOpen),
      appBar: AppBarNexusCore(name, menu, isDrawerOpen: _isDrawerOpen),
      drawer: MainDrawer(menu: menu),
      backgroundColor: ColorManager.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomePage(menu[0]),
            SkillsPage(menu[1]),
            ExperiencePage(menu[2]),
            // ProjectsPage(menu[3]),
            // ContactPage(menu[4]),
          ],
        ),
      ),
    );
  }
}
