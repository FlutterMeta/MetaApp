import 'package:flutter/material.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        _SocialMediaButton(asset: AppAssets.telegramIcon, onTap: () {}),
        const SizedBox(width: 10),
        _SocialMediaButton(
          asset: AppAssets.youtubeIcon,
          onTap: () {},
        ),
      ],
    );
  }
}

class _SocialMediaButton extends StatelessWidget {
  final String asset;
  final VoidCallback onTap;

  const _SocialMediaButton({
    required this.asset,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hover(
      builder: (_) {
        return WebButton(
          onTap: onTap,
          child: Image.asset(asset, height: 30),
        );
      },
    );
  }
}
