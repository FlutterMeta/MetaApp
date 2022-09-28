part of '../home_page.dart';

class _PresentationSection extends StatelessWidget {
  const _PresentationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textAlign = context.screenWidth < 780 ? TextAlign.center : null;
    final crossAxisAlignment = context.screenWidth < 780
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;

    return Container(
      constraints: const BoxConstraints(maxWidth: 1270),
      padding: const EdgeInsets.symmetric(horizontal: 26),
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
    );
  }
}
