import 'package:flutter/material.dart';

import "package:meta_app/core/utils/extensions/build_context_ext.dart";
import 'package:meta_app/presentation/widgets/gradient_button.dart';
import 'package:meta_app/presentation/widgets/gradient_text.dart';
import 'package:meta_app/presentation/widgets/header.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: 70),
              _PresentationSection(
                isBreakpointReached: context.screen.width < 780 ? true : false,
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
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(
            context.localizations.multiMetaUniverse,
            textAlign: textAlign,
            style: context.text.multiMetaUniverseTitle,
          ),
          GradientText(
            text: context.localizations.metaverseThatUnites,
            textAlign: textAlign,
          ),
          const SizedBox(height: 15),
          Text(
            context.localizations.profitToPartners,
            textAlign: textAlign,
            style: context.text.profitToPartnersTitle,
          ),
          Text(
            context.localizations.leadershipBonuses,
            textAlign: textAlign,
            style: context.text.leadershipBonusesTitle,
          ),
          Text(
            context.localizations.fromFiftyDollars,
            textAlign: textAlign,
            style: context.text.fromFiftyDollarsTitle,
          ),
          const SizedBox(height: 35),
          Text(
            context.localizations.revelantInfo,
            textAlign: textAlign,
            style: context.text.revelantInfo,
          ),
          const SizedBox(height: 6),
          _RevelantInfoSection(isBreakpointReached: isBreakpointReached),
          const SizedBox(height: 10),
          GradientButton(title: context.localizations.startNow, onTap: () {}),
          const SizedBox(height: 300),
        ],
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
          .map((info) => _InfoCard(
                title: info,
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      constraints: BoxConstraints(
        maxWidth: context.screen.width * 0.28,
      ),
      child: Hover(builder: (_) {
        return WebButton(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: context.color.infoCardBackground,
              child: Text(title, style: context.text.homePagePurpleBodyText),
            ),
          ),
        );
      }),
    );
  }
}
