part of "../partners_page.dart";

class _BotCardsSection extends StatefulWidget {
  const _BotCardsSection({Key? key}) : super(key: key);

  @override
  State<_BotCardsSection> createState() => _BotCardsSectionState();
}

class _BotCardsSectionState extends State<_BotCardsSection> {
  void _handleTap(BuildContext context) {
    _pushProductsTab();
    _pushProfilePage(context);
  }

  void _pushProductsTab() {
    int productsTabIndex = 1;
    ClientMenuController.tabIndex.value = productsTabIndex;
  }

  void _pushProfilePage(BuildContext context) {
    context.router.push(ClientProfileRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1600),
        child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Text(
                context.localizations.botsBonusProgramWithLeadership,
                style: context.text.partnerTableSectionTitle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Text(
                context.localizations.getFinancialRewards,
                style: context.text.partnerTableSectionText,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 100),
            Consumer<ProductsNotifier>(
              builder: (context, productsNotifier, child) {
                return Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    for (final product in productsNotifier.products)
                      BotDemoCard(
                        product: product,
                        onTap: () => _handleTap(context),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
