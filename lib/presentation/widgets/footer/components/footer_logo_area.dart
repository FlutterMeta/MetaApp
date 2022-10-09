part of '../footer.dart';

class _FooterLogoArea extends StatelessWidget {
  const _FooterLogoArea({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              if (screenWidth < 550) const Spacer(),
              const MediaButtons(),
              const SizedBox(width: 60),
              const Spacer(),
              Image.asset(AppAssets.logo, height: 66),
              const Spacer(),
              if (screenWidth > 550)
                Text(
                  context.localizations.weCareAboutYou,
                  style: context.text.footerWeCareAboutYou,
                ),
            ],
          ),
          if (screenWidth <= 550) ...[
            const SizedBox(height: 20),
            Text(
              context.localizations.weCareAboutYou,
              style: context.text.footerWeCareAboutYou,
            ),
          ],
        ],
      ),
    );
  }
}
