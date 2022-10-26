part of "../partners_page.dart";

class _PdfSection extends StatelessWidget {
  const _PdfSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1270),
        child: Column(
          children: [
            Text(
              context.localizations.tableOfStabilization,
              style: context.text.partnerPdfSectionTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              context.localizations.accordingToTheRoadmap,
              style: context.text.partnerPdfSectionSubtitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            Image.asset(
              AppAssets.pdfIcon,
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            GradientButton(
              title: context.localizations.tableOfRates,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
