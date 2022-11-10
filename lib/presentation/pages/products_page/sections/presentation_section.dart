part of '../products_page.dart';

class _PresentationSection extends StatelessWidget {
  const _PresentationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1270),
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            runSpacing: 20,
            spacing: 20,
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
                AppAssets.chart,
                height: 400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
