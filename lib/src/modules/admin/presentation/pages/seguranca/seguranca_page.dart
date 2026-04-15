import 'package:flutter/material.dart';

import 'seguranca_controller.dart';
import 'seguranca_state.dart';

class SegurancaPage extends StatefulWidget {
  final SegurancaController controller;
  final String title;

  const SegurancaPage({
    super.key,
    required this.controller,
    this.title = 'Seguranca',
  });

  @override
  State<SegurancaPage> createState() => _SegurancaPageState();
}

class _SegurancaPageState extends State<SegurancaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: ValueListenableBuilder<SegurancaState>(
          valueListenable: widget.controller,
          builder: (context, state, _) {
            if (state is SegurancaLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return const Center(child: Text('Content for Seguranca'));
          },
        ),
      ),
    );
  }
}
