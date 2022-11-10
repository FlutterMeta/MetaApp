part of "../directions_page.dart";

class _BenefitsSection extends StatelessWidget {
  const _BenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
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
          ),
          const SizedBox(height: 20),
          Text(
            context.localizations.tradeAndEarnMeetAndChat,
            style: context.text.directionsBenefitsDescription,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
              height: 400), //TODO: replace this void area with images
        ],
      ),
    );
  }
}
