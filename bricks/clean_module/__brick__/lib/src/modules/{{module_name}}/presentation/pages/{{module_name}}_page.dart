import 'package:flutter/material.dart';

import '../controllers/{{module_name}}_controller.dart';
import '../states/{{module_name}}_state.dart';

class {{module_name.pascalCase()}}Page extends StatefulWidget {
  final {{module_name.pascalCase()}}Controller controller;
  final String title;

  const {{module_name.pascalCase()}}Page({
    super.key,
    required this.controller,
    this.title = '{{module_name.pascalCase()}}',
  });

  @override
  State<{{module_name.pascalCase()}}Page> createState() => _{{module_name.pascalCase()}}PageState();
}

class _{{module_name.pascalCase()}}PageState extends State<{{module_name.pascalCase()}}Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: ValueListenableBuilder<{{module_name.pascalCase()}}State>(
          valueListenable: widget.controller,
          builder: (context, state, _) {
            if (state is {{module_name.pascalCase()}}Loading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Center(
              child: Text('Content for {{module_name.pascalCase()}}'),
            );
          },
        ),
      ),
    );
  }
}
