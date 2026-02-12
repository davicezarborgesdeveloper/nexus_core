import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/features/portfolio/widgets/social/social_enum.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  final String? link;
  final SocialEnum? tipo;
  const SocialButton({this.link, this.tipo, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (tipo == SocialEnum.email) {
          final Uri emailLaunchUri = Uri(scheme: 'mailto', path: link);
          launchUrl(emailLaunchUri);
        } else {
          launchUrl(Uri.parse(link ?? ''));
        }
      },
      child: SvgPicture.asset(
        switch (tipo) {
          SocialEnum.github => 'assets/icons/github.svg',
          SocialEnum.linkedin => 'assets/icons/linkedin.svg',
          SocialEnum.email => 'assets/icons/mail.svg',
          _ => 'assets/icons/github.svg',
        },
        colorFilter: ColorFilter.mode(ColorManager.secondary, BlendMode.srcIn),
      ),
    );
  }
}
