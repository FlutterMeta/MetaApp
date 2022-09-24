import 'package:flutter/material.dart';

import "package:meta_app/core/utils/extensions/build_context_ext.dart";
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/pages/login_page.dart';
import 'package:meta_app/presentation/widgets/gradient_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          child: Column(
            children: [
              screenWidth > 1000
                  ? const _HeaderSection()
                  : const _HeaderSectionCompact(),
              const SizedBox(height: 70),
              _PresentationSection(
                isBreakpointReached: screenWidth < 780 ? true : false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({Key? key}) : super(key: key);

  void _goToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1270),
      padding: const EdgeInsets.only(top: 4, bottom: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _RoadmapButton(),
                _AuthLocaleSubSection(onTap: () => _goToLoginPage(context)),
              ],
            ),
          ),
          const SizedBox(height: 4),
          const Divider(),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.logo, height: 76),
                const NavigationSubSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderSectionCompact extends StatelessWidget {
  const _HeaderSectionCompact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppAssets.logo, height: 76),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                    iconSize: 30,
                    splashRadius: 26,
                  ),
                  const SizedBox(width: 10),
                  _SocialMediaButton(asset: AppAssets.tlIco, onTap: () {}),
                  const SizedBox(width: 10),
                  _SocialMediaButton(
                    asset: AppAssets.youtubeIco,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PresentationSection extends StatelessWidget {
  final bool isBreakpointReached;

  const _PresentationSection({
    Key? key,
    required this.isBreakpointReached,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textAlign = isBreakpointReached ? TextAlign.center : null;
    final crossAxisAlignment = isBreakpointReached
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;

    return Container(
      constraints: const BoxConstraints(maxWidth: 1270),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(
            context.localizations.multiMetaUniverse,
            textAlign: textAlign,
            style: context.text.largeTitle,
          ),
          _GradientText(
            text: context.localizations.metaverseThatUnites,
            textAlign: textAlign,
          ),
          const SizedBox(height: 20),
          Text(
            context.localizations.profitToPartners,
            textAlign: textAlign,
            style: context.text.lighterPurpleTitle,
          ),
          Text(
            context.localizations.leadershipBonuses,
            textAlign: textAlign,
            style: context.text.lightPurpleTitle,
          ),
          Text(
            context.localizations.fromfiftydollars,
            textAlign: textAlign,
            style: context.text.purpleTitle,
          ),
          const SizedBox(height: 35),
          Text(
            context.localizations.revelantInfo,
            textAlign: textAlign,
            style: context.text.bodyText,
          ),
          const SizedBox(height: 6),
          _RevelantInfoSection(isBreakpointReached: isBreakpointReached),
          const SizedBox(height: 10),
          _GradientButton(title: context.localizations.startNow, onTap: () {}),
          const SizedBox(height: 300),
        ],
      ),
    );
  }
}

class _RoadmapButton extends StatelessWidget {
  const _RoadmapButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(context.localizations.moreFactsAbout),
            const SizedBox(width: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: ColoredBox(
                color: context.color.mainPurple,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    context.localizations.roadmap,
                    style: context.text.smallerBodyTextWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthLocaleSubSection extends StatelessWidget {
  final VoidCallback onTap;

  const _AuthLocaleSubSection({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Text(
            context.localizations.account,
            style: context.text.purpleBoldText,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        const Icon(Icons.language),
        const SizedBox(width: 90),
      ],
    );
  }
}

class NavigationSubSection extends StatelessWidget {
  const NavigationSubSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _NavBarButton(
          onTap: () {},
          title: "Directions",
        ),
        const SizedBox(width: 5),
        _NavBarButton(
          onTap: () {},
          title: "Products",
        ),
        const SizedBox(width: 5),
        _NavBarButton(
          onTap: () {},
          title: "Partners",
        ),
        const SizedBox(width: 10),
        _SocialMediaButton(asset: AppAssets.tlIco, onTap: () {}),
        const SizedBox(width: 10),
        _SocialMediaButton(asset: AppAssets.youtubeIco, onTap: () {}),
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
    return InkWell(
      onTap: onTap,
      child: Image.asset(asset, height: 30),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarButton({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(title),
      ),
    );
  }
}

class _GradientText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const _GradientText({
    required this.text,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) =>
          context.gradient.purple180deg.createShader(bounds),
      child: Text(
        context.localizations.metaverseThatUnites,
        textAlign: textAlign,
        style: context.text.gradientSubLargeTitle,
      ),
    );
  }
}

class _RevelantInfoSection extends StatelessWidget {
  final bool isBreakpointReached;

  const _RevelantInfoSection({
    required this.isBreakpointReached,
    Key? key,
  }) : super(key: key);

  static final info = [
    "MultiMeta Universe video presentation",
    "Profitability Programs",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isBreakpointReached
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: info
          .map((e) => _InfoCard(
                title: e,
                onTap: () {},
              ))
          .toList(),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _InfoCard({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.28),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 0,
          color: context.color.itemsGreyBackground,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(title, style: context.text.purpleText),
          ),
        ),
      ),
    );
  }
}

class _GradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _GradientButton({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: GradientBackground(
        gradient: context.gradient.purple,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 127),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 9,
                bottom: 11,
                right: 20,
                left: 20,
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: context.text.smallerBodyTextWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
