import 'package:flutter/material.dart';

import "package:meta_app/core/utils/extensions/build_context_ext.dart";
import 'package:meta_app/presentation/widgets/gradient_background.dart';
import 'package:meta_app/presentation/widgets/header.dart';
import 'package:meta_app/presentation/widgets/on_hover.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

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
              screenWidth > 1000 ? const Header() : const HeaderCompact(),
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

class _PresentationSection extends StatelessWidget {
  final bool isBreakpointReached;

  const _PresentationSection({
    required this.isBreakpointReached,
    Key? key,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.28),
        child: OnHover(builder: (_) {
          return WebButton(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: ColoredBox(
                color: context.color.itemsGreyBackground,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text(title, style: context.text.purpleText),
                ),
              ),
            ),
          );
        }),
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
    return OnHover(
      builder: (bool _) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: GradientBackground(
            gradient: context.gradient.purple,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 127),
              child: WebButton(
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
      },
    );
  }
}
