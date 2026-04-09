import 'package:flutter/material.dart';
import 'package:nexus_core/l10n/app_localizations.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/service_locator.dart';
import 'package:login_module/login_module.dart';
import 'package:nexus_core/src/modules/portfolio/models/menu_item.dart';
import 'package:nexus_core/src/modules/portfolio/pages/home/home_page.dart';
import 'package:nexus_core/src/modules/portfolio/pages/main/widgets/app_bar_nexus_core.dart';
import 'package:nexus_core/src/modules/portfolio/pages/main/widgets/main_drawer.dart';

import '../contacts/contacts_page.dart';
import '../experience/experience_page.dart';
import '../projects/projects_page.dart';
import '../skills/skills_page.dart';
import 'widgets/footer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final List<GlobalKey> _keys;
  late List<MenuItem> _menu;
  List<MenuItem> get menu => _menu;

  final String name = 'Davi Cezário Borges';
  final _isDrawerOpen = ValueNotifier<bool>(false);

  late final LoginModule _loginModule;

  @override
  void initState() {
    super.initState();
    _keys = List.generate(5, (_) => GlobalKey());
    _loginModule = getIt<LoginModule>();
  }

  @override
  void dispose() {
    _isDrawerOpen.dispose();
    super.dispose();
  }

  void _onSettingsTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (pageContext) => _loginModule.createPage(
          onSuccess: () => Navigator.of(pageContext).pop(),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final l10n = AppLocalizations.of(context)!;
    _menu = [
      MenuItem(l10n.navHome, _keys[0]),
      MenuItem(l10n.navSkills, _keys[1]),
      MenuItem(l10n.navExperience, _keys[2]),
      MenuItem(l10n.navProjects, _keys[3]),
      MenuItem(l10n.navContact, _keys[4]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isDrawerOpen,
      builder: (context, isDrawerOpen, child) => Scaffold(
        drawerScrimColor: Colors.transparent,
        onDrawerChanged: (isOpen) => _isDrawerOpen.value = isOpen,
        appBar: AppBarNexusCore(
          name,
          menu,
          isDrawerOpen: isDrawerOpen,
          onSettingsTap: _onSettingsTap,
        ),
        drawer: MainDrawer(menu: menu, onSettingsTap: _onSettingsTap),
        backgroundColor: ColorManager.background,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HomePage(
                menu[0],
                projectsKey: menu[3].key,
                contactKey: menu[4].key,
              ),
              SkillsPage(menu[1]),
              ExperiencePage(menu[2]),
              ProjectsPage(menu[3]),
              ContactsPage(menu[4]),
              Footer(menus: menu),
            ],
          ),
        ),
      ),
    );
  }
}
