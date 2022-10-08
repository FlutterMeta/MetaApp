import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/media_buttons.dart';

class FooterLogoArea extends StatelessWidget {
  const FooterLogoArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              if (context.screenWidth < 550) const Spacer(),
              const MediaButtons(),
              const SizedBox(width: 60),
              const Spacer(),
              Image.asset(AppAssets.logo, height: 66),
              const Spacer(),
              if (context.screenWidth > 550)
                Text(
                  context.localizations.weCareAbouYou,
                  style: context.text.footerWeCareAboutYou,
                ),
            ],
          ),
          if (context.screenWidth <= 550) ...[
            const SizedBox(height: 20),
            Text(
              context.localizations.weCareAbouYou,
              style: context.text.footerWeCareAboutYou,
            ),
          ],
        ],
      ),
    );
  }
}
