part of "../products_page.dart";

class _PromotionSection extends StatelessWidget {
  const _PromotionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1270),
        child: Column(
          children: [
            Text(
              context.localizations.earnMoneyByPromoting,
              style: context.text.promotionSectionTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 300,
              child: Text(
                context.localizations.takeAdvantageOfProgram,
                style: context.text.promotionSectionText,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 60),
            Wrap(
              spacing: 30,
              runSpacing: 30,
              children: [
                _PromotionCard(
                  title: context.localizations.becomeAuroraPartner,
                  subtitle: context.localizations.checkYieldPrograms,
                  text: context.localizations.familiarize,
                  onTap: () {},
                ),
                _PromotionCard(
                  title: context.localizations.aboutAurora,
                  subtitle: context.localizations.learnTheFormation,
                  text: context.localizations.moreInfoAboutCompany,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PromotionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String text;
  final VoidCallback onTap;

  const _PromotionCard({
    required this.title,
    required this.subtitle,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  //TODO: Replace color by image
  @override
  Widget build(BuildContext context) {
    return Hover(
      builder: (bool isHovered) {
        return Opacity(
          opacity: isHovered ? 0.8 : 1,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 476,
              width: 400,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFF3F51B5),
              ),
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: context.color.promotionSectionCardBackground,
                ),
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: context.text.promotionSectionCardTitle,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: context.text.promotionSectionCardSubtitle,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      text,
                      style: context.text.promotionSectionCardText,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
