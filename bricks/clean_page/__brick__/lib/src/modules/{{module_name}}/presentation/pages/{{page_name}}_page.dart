import 'package:flutter/material.dart';

import '../controllers/{{page_name}}_controller.dart';
import '../states/{{page_name}}_state.dart';

class {{page_name.pascalCase()}}Page extends StatefulWidget {
  final {{page_name.pascalCase()}}Controller controller;
  final String title;

  const {{page_name.pascalCase()}}Page({
    super.key,
    required this.controller,
    this.title = '{{page_name.pascalCase()}}',
  });

  @override
  State<{{page_name.pascalCase()}}Page> createState() => _{{page_name.pascalCase()}}PageState();
}

class _{{page_name.pascalCase()}}PageState extends State<{{page_name.pascalCase()}}Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: ValueListenableBuilder<{{page_name.pascalCase()}}State>(
          valueListenable: widget.controller,
          builder: (context, state, _) {
            if (state is {{page_name.pascalCase()}}Loading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Center(
              child: Text('Content for {{page_name.pascalCase()}}'),
            );
          },
        ),
      ),
    );
  }
}
