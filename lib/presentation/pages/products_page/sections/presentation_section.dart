part of '../products_page.dart';

class _PresentationSection extends StatelessWidget {
  static const _mobileWidth = 428;

  const _PresentationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        constraints: const BoxConstraints(maxWidth: 1270),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: context.screenWidth < _mobileWidth
                    ? context.screenWidth
                    : 400,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    context.localizations.metaPartnersInTerms,
                    style: context.text.productsHeadline,
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
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
