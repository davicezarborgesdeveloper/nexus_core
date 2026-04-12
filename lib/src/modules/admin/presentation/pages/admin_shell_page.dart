import 'package:flutter/material.dart';
import 'package:nexus_core/src/modules/admin/presentation/pages/widgets/admin_app_bar.dart';
import 'package:nexus_core/src/modules/admin/presentation/pages/widgets/admin_side_nav.dart';

class AdminShellPage extends StatefulWidget {
  const AdminShellPage({super.key});

  @override
  State<AdminShellPage> createState() => _AdminShellPageState();
}

class _AdminShellPageState extends State<AdminShellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(),
      body: Row(
        children: [
          AdminSideNav(),
          Expanded(child: IndexedStack(index: 0, children: const [])),
        ],
      ),
    );
  }
}
