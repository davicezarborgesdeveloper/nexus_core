import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/modules/admin/presentation/pages/widgets/admin_app_bar.dart';
import 'package:nexus_core/src/modules/admin/presentation/pages/widgets/admin_side_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../portfolio/pages/main/main_page.dart';
import '../../domain/usecases/get_admin_usecase.dart';
import '../controllers/configuracoes_controller.dart';
import '../controllers/experiencias_controller.dart';
import '../controllers/habilidades_controller.dart';
import '../controllers/perfil_controller.dart';
import '../controllers/projetos_controller.dart';
import '../controllers/seguranca_controller.dart';
import 'configuracoes_page.dart';
import 'experiencias_page.dart';
import 'habilidades_page.dart';
import 'perfil_page.dart';
import 'projetos_page.dart';
import 'seguranca_page.dart';

class AdminShellPage extends StatefulWidget {
  final IGetAdminUsecase usecase;
  const AdminShellPage({super.key, required this.usecase});

  @override
  State<AdminShellPage> createState() => _AdminShellPageState();
}

class _AdminShellPageState extends State<AdminShellPage> {
  late String _userName;
  int _selectedIndex = 0;

  late final PerfilController _perfilController;
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

    _perfilController = PerfilController(widget.usecase);
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
                PerfilPage(controller: _perfilController),
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
