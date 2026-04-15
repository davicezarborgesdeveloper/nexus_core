import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/modules/admin/presentation/pages/widgets/admin_app_bar.dart';
import 'package:nexus_core/src/modules/admin/presentation/pages/widgets/admin_side_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../portfolio/pages/main/main_page.dart';
import '../../domain/usecases/get_admin_usecase.dart';
import 'configuracoes/configuracoes_controller.dart';
import 'configuracoes/configuracoes_page.dart';
import 'experiencias/experiencias_controller.dart';
import 'experiencias/experiencias_page.dart';
import 'habilidades/habilidades_controller.dart';
import 'habilidades/habilidades_page.dart';
import 'profile/profile_controller.dart';
import 'profile/profile_page.dart';
import 'projetos/projetos_controller.dart';
import 'projetos/projetos_page.dart';
import 'seguranca/seguranca_controller.dart';
import 'seguranca/seguranca_page.dart';

class AdminShellPage extends StatefulWidget {
  final IGetAdminUsecase usecase;
  const AdminShellPage({super.key, required this.usecase});

  @override
  State<AdminShellPage> createState() => _AdminShellPageState();
}

class _AdminShellPageState extends State<AdminShellPage> {
  late String _userName;
  int _selectedIndex = 0;

  late final ProfileController _perfilController;
  late final ProjetosController _projetosController;
  late final ExperienciasController _experienciasController;
  late final HabilidadesController _habilidadesController;
  late final ConfiguracoesController _configuracoesController;
  late final SegurancaController _segurancaController;

  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;
    _userName = user?.displayName?.isNotEmpty == true
        ? user!.displayName!
        : user?.email?.split('@').first ?? 'Admin';

    _perfilController = ProfileController(widget.usecase);
    _projetosController = ProjetosController();
    _experienciasController = ExperienciasController();
    _habilidadesController = HabilidadesController();
    _configuracoesController = ConfiguracoesController();
    _segurancaController = SegurancaController();
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) Navigator.of(context).pop();
  }

  void _viewPortfolio() => Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (_) => const MainPage()),
    (Route<dynamic> route) => false,
  );

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile || context.isTablet;
    final isWide = context.screenWidth >= 800;

    final sideNav = AdminSideNav(
      selectedIndex: _selectedIndex,
      onItemSelected: (index) {
        setState(() => _selectedIndex = index);
        if (isMobile) Navigator.of(context).pop();
      },
    );

    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: AdminAppBar(
        userName: _userName,
        onViewPortfolio: _viewPortfolio,
        onSignOut: _signOut,
      ),
      drawer: isMobile ? Drawer(child: SafeArea(child: sideNav)) : null,
      body: Row(
        children: [
          if (isWide) sideNav,
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                ProfilePage(controller: _perfilController),
                ProjetosPage(controller: _projetosController),
                ExperienciasPage(controller: _experienciasController),
                HabilidadesPage(controller: _habilidadesController),
                ConfiguracoesPage(controller: _configuracoesController),
                SegurancaPage(controller: _segurancaController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
