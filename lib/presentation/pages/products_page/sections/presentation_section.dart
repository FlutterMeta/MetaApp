part of '../products_page.dart';

class _PresentationSection extends StatelessWidget {
  const _PresentationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1270),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Container(
                constraints: const BoxConstraints(maxWidth: 400),
                width: 600,
                child: Text(
                  context.localizations.mmPartners,
                  style: context.text.productsHeaderMedium,
                  softWrap: true,
                ),
              ),
              const SizedBox(height: 16),
              Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  width: 600,
                  child: Text(
                    context.localizations.largeEuropeanVenture,
                    style: context.text.productsSubHeader,
                    softWrap: true,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              GradientButton(
                title: context.localizations.becomeAnInvestor,
                onTap: () {},
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

/* class _AdaptiveHeaderText extends StatelessWidget {
  TextAlign? textAlign;
  _AdaptiveHeaderText({
    Key? key,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth > 990) {
        return Text(
          context.localizations.mmPartners,
          textAlign: textAlign,
          style: context.text.productsHeaderBig,
        );
      } else if (constraints.maxWidth > 766) {
        return Text(
          context.localizations.mmPartners,
          textAlign: textAlign,
          style: context.text.productsHeaderMedium,
        );
      } else {
        return Text(
          context.localizations.mmPartners,
          textAlign: textAlign,
          style: context.text.productsHeaderSmall,
        );
      }
    }));
  }
}
 */