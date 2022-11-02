part of "../partners_page.dart";

class _CardsSection extends StatelessWidget {
  const _CardsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 400,
          maxWidth: 1270,
        ),
        child: Column(
          children: [
            Text(
              context.localizations.optionsFromAurora,
              style: context.text.cardsSectionTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                context.localizations.buyOneOfWma,
                style: context.text.cardsSectionText,
                softWrap: true,
              ),
            ),
            const SizedBox(height: 60),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                _Card(
                  image: Image.asset(AppAssets.worldMap),
                  title: context.localizations.earnFrom,
                  subtitle: context.localizations.earnFrom,
                  text: context.localizations.chooseLocationForPurchase,
                  onTap: () {},
                ),
                _Card(
                  image: Image.asset(AppAssets.board),
                  title: context.localizations.earnFrom,
                  subtitle: context.localizations.earnFrom,
                  text: context.localizations.chooseLocationForPurchase,
                  onTap: () {},
                ),
                _Card(
                  image: Image.asset(AppAssets.people),
                  imageAlignment: Alignment.bottomCenter,
                  title: context.localizations.earnFrom,
                  subtitle: context.localizations.earnFrom,
                  text: context.localizations.chooseLocationForPurchase,
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

class _Card extends StatelessWidget {
  final Widget image;
  final Alignment imageAlignment;
  final String title;
  final String subtitle;
  final String text;
  final VoidCallback onTap;

  const _Card({
    required this.image,
    this.imageAlignment = Alignment.center,
    required this.title,
    required this.subtitle,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hover(builder: (isHovered) {
      return GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 400,
          child: Opacity(
            opacity: isHovered ? 0.8 : 1,
            child: Card(
              color: context.color.partnersCardBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      alignment: imageAlignment,
                      child: image,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: context.color.partnersCardContentBackground,
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subtitle,
                            style: context.text.partnersSectionCardSubtitle,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            title,
                            style: context.text.partnersSectionCardTitle,
                          ),
                          const SizedBox(height: 30),
                          Text(
                            text,
                            style: context.text.partnersSectionCardText,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
