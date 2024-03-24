part of '../products_page.dart';

class _ProductsSection extends StatelessWidget {
  const _ProductsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: context.gradient.lightIndigo),
      padding: const EdgeInsets.symmetric(vertical: 246, horizontal: 16),
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1270),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localizations.caringForAllNeeds,
              style: context.text.productsPartnersSectionSpecialPurple,
            ),
            const SizedBox(height: 15),
            Text(
              context.localizations.auroraProducts,
              style: context.text.blogHeadline,
            ),
            const SizedBox(height: 30),
            Text(
              context.localizations.fromSoftwareDevelopment,
              style: context.text.productsSubHeadline,
            ),
            const SizedBox(height: 30),
            GradientButton(
              title: context.localizations.becomeAPartner,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
