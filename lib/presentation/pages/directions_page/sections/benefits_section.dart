part of "../directions_page.dart";

class _BenefitsSection extends StatelessWidget {
  const _BenefitsSection({Key? key}) : super(key: key);

  @override
  //TODO: replace this void area with images
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.localizations.benefitsOfDigitalization,
          style: context.text.directionsBenefitsSubtitle,
        ),
        const SizedBox(height: 20),
        Text(
          context.localizations.auroraUniverse,
          style: context.text.directionsBenefitsTitle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          context.localizations.tradeAndEarnMeetAndChat,
          style: context.text.directionsBenefitsDescription,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 400),
      ],
    );
  }
}
