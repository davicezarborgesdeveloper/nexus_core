import 'package:flutter/material.dart';
import 'package:nexus_core/l10n/app_localizations.dart';
import 'package:nexus_core/src/features/portfolio/pages/home/widgets/get_in_button.dart';

import 'download_cv_button.dart';
import 'view_projects_button.dart';

class ActionButtons extends StatefulWidget {
  final VoidCallback? onViewProjects;
  final VoidCallback? onContact;
  const ActionButtons({this.onViewProjects, this.onContact, super.key});

  @override
  State<ActionButtons> createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Wrap(
      runSpacing: 16,
      children: [
        ViewProjectsButton(
          label: l10n.actionViewProjects,
          onPressed: widget.onViewProjects ?? () {},
        ),
        const SizedBox(width: 16),
        GetInButton(
          label: l10n.actionContact,
          onPressed: widget.onContact ?? () {},
        ),
        const SizedBox(width: 16),
        DownloadCvButton(label: l10n.actionDownloadCV, onPressed: () {}),
      ],
    );
  }
}
