part of "../partners_page.dart";

class _BotCardsSection extends StatelessWidget {
  const _BotCardsSection({Key? key}) : super(key: key);

  List<String> _basicBenefits(BuildContext context) {
    return [
      context.localizations.portfolioManagement,
      context.localizations.manualTrading,
    ];
  }

  void _handleTap(BuildContext context) {
    _pushTransactionTab();
    _pushProfilePage(context);
  }

  void _pushTransactionTab() {
    const int transactionTabIndex = 2;
    MenuController.tabIndex.value = transactionTabIndex;
  }

  void _pushProfilePage(BuildContext context) {
    context.router.push(ClientProfileRoute());
  }

  double _getCardWidth(BuildContext context) {
    final double screenWidth = context.screenWidth;
    if (screenWidth > 1270) {
      return 1270 / 3 - 20;
    } else if (screenWidth > 550) {
      return screenWidth / 2;
    } else {
      return screenWidth;
    }
  }

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 1600;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: maxWidth),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            Container(
              width: _getCardWidth(context),
              constraints: const BoxConstraints(minWidth: 400),
              child: BotDemoCard(
                benefits: [
                  "300% ${context.localizations.roiPerMonth}",
                  "20 ${context.localizations.positions}",
                  ..._basicBenefits(context),
                ],
                price: 20.39,
                title: context.localizations.pioneer,
                onTap: () => _handleTap(context),
              ),
            ),
            Container(
              width: _getCardWidth(context),
              constraints: const BoxConstraints(minWidth: 400),
              child: BotDemoCard(
                benefits: [
                  "600% ${context.localizations.roiPerMonth}",
                  "80 ${context.localizations.positions}",
                  ..._basicBenefits(context),
                ],
                price: 81.67,
                title: context.localizations.adventurer,
                onTap: () => _handleTap(context),
              ),
            ),
            Container(
              width: _getCardWidth(context),
              constraints: const BoxConstraints(minWidth: 400),
              child: BotDemoCard(
                benefits: [
                  "1000% ${context.localizations.roiPerMonth}",
                  "160 ${context.localizations.positions}",
                  ..._basicBenefits(context),
                ],
                price: 160.88,
                title: context.localizations.hero,
                onTap: () => _handleTap(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
