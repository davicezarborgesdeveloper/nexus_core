import 'package:flutter/material.dart';

import '../controllers/dashboard_controller.dart';
import '../states/dashboard_state.dart';

class DashboardPage extends StatefulWidget {
  final DashboardController controller;
  final String title;

  const DashboardPage({
    super.key,
    required this.controller,
    this.title = 'Dashboard',
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: ValueListenableBuilder<DashboardState>(
          valueListenable: widget.controller,
          builder: (context, state, _) {
            if (state is DashboardLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return const Center(child: Text('Content for Dashboard'));
          },
        ),
      ),
    );
  }
}
