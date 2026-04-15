import 'package:flutter/material.dart';

enum AdminNavItem {
  perfil(Icons.person_outline, 'Perfil'),
  projetos(Icons.folder_outlined, 'Projetos'),
  experiencias(Icons.work_outline, 'Experiências'),
  habilidades(Icons.bolt_outlined, 'Habilidades'),
  configuracoes(Icons.settings_outlined, 'Configurações'),
  seguranca(Icons.shield_outlined, 'Segurança');

  const AdminNavItem(this.icon, this.label);

  final IconData icon;
  final String label;
}
