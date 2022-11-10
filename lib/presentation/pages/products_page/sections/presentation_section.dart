part of '../products_page.dart';

class _PresentationSection extends StatelessWidget {
  const _PresentationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1270),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.localizations.auroraPartnersInTerms,
                    style: context.text.productsSmallerHeadline,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    context.localizations.largeEuropeanVenture,
                    style: context.text.productsSubHeadline,
                  ),
                  const SizedBox(height: 30),
                  GradientButton(
                    title: context.localizations.becomeAnInvestor,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Image.asset(
              AppAssets.productsGraph,
              height: 400,
            ),
          ],
        ),
      ),
    );
  }
}
