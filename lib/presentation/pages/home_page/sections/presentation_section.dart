part of '../home_page.dart';

class _PresentationSection extends StatelessWidget {
  const _PresentationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textAlign = context.screenWidth < 780 ? TextAlign.center : null;
    final crossAxisAlignment = context.screenWidth < 780
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;

    return Align(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1270),
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Text(
              context.localizations.auroraUniverse,
              textAlign: textAlign,
              style: context.text.multiMetaUniverseTitle,
            ),
            GradientText(
              text: context.localizations.metaverseThatUnites,
              textAlign: textAlign,
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 36),
            Text(
              context.localizations.revelantInfo,
              textAlign: textAlign,
              style: context.text.revelantInfoTitle,
            ),
            const SizedBox(height: 6),
            const _RevelantInfoSection(),
            const SizedBox(height: 10),
            GradientButton(title: context.localizations.startNow, onTap: () {}),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class _RevelantInfoSection extends StatelessWidget {
  const _RevelantInfoSection({Key? key}) : super(key: key);

  static final info = [
    "MultiMeta Universe video presentation",
    "Profitability Programs",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: context.screenWidth < 780
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
      padding: const EdgeInsets.only(right: 12),
      constraints: BoxConstraints(
        maxWidth: context.screenWidth * 0.28,
      ),
      child: Hover(builder: (_) {
        return WebButton(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: context.color.infoCardBackground,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(title, style: context.text.homePagePurpleBodyText),
          ),
        );
      }),
    );
  }
}
