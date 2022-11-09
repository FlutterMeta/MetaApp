part of "../directions_page.dart";

class _PartnershipSection extends StatelessWidget {
  const _PartnershipSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textAlign = context.screenWidth < 780 ? TextAlign.center : null;
    final crossAxisAlignment = context.screenWidth < 780
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.indigoBackground),
          fit: BoxFit.fill,
        ),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1270),
        padding: const EdgeInsets.symmetric(horizontal: 26),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Text(
              context.localizations.businessLines,
              textAlign: textAlign,
              style: context.text.partnershipSubtitle,
            ),
            const SizedBox(height: 20),
            Text(
              context.localizations.partnershipTools,
              textAlign: textAlign,
              style: context.text.partnershipTitle,
            ),
            const SizedBox(height: 20),
            Text(
              context.localizations.financialInstrumentsFromInvestment,
              textAlign: textAlign,
              style: context.text.revelantInfoTitle,
            ),
            const SizedBox(height: 20),
            GradientButton(
              title: context.localizations.offersToPartners,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
