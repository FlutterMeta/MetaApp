import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/themes/theme.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

class BotsTab extends StatelessWidget {
  const BotsTab({super.key});

  List<String> _basicBenefits(BuildContext context) {
    return [
      context.localizations.twentyPositions,
      context.localizations.portfolioManagement,
      context.localizations.manualTrading,
      context.localizations.allAvailableExchanges,
    ];
  }

  List<String> _advancedBenefits(BuildContext context) {
    return [
      ..._basicBenefits(context),
      context.localizations.allCoinsForSignals,
      context.localizations.marketArbitrage,
      context.localizations.algorithmIntelligence,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(gradient: context.gradient.lightIndigo),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _CardsDefaultWrap(
              children: [
                _BotProfitCard(
                  title: "Binance Futures ${context.localizations.pioneer}",
                  price: 1500,
                  roi: 40,
                ),
                _BotProfitCard(
                  title: "Binance Futures ${context.localizations.adventurer}",
                  price: 3000,
                  roi: 60,
                ),
                _BotProfitCard(
                  title: "Binance Futures ${context.localizations.hero}",
                  price: 5000,
                  roi: 80,
                ),
              ],
            ),
            const SizedBox(height: 20),
            _CardsDefaultWrap(
              children: [
                _BotDemoCard(
                  title: context.localizations.pioneer,
                  price: 1500,
                  benefits: _basicBenefits(context),
                ),
                _BotDemoCard(
                  title: context.localizations.adventurer,
                  price: 3000,
                  benefits: _basicBenefits(context),
                ),
                _BotDemoCard(
                  title: context.localizations.hero,
                  price: 5000,
                  benefits: _advancedBenefits(context),
                ),
                _BotDemoCard(
                  title: context.localizations.pioneer,
                  price: 3000,
                  benefits: _advancedBenefits(context),
                ),
                _BotDemoCard(
                  title: context.localizations.adventurer,
                  price: 5000,
                  benefits: _advancedBenefits(context),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const _FunctionalityComparisonTable(),
            const SizedBox(height: 60),
            Text(
              context.localizations.allRightsReserved,
              style: context.text.allRightsReserved,
            ),
          ],
        ),
      ),
    );
  }
}

class _CardsDefaultWrap extends StatelessWidget {
  final List<Widget> children;
  const _CardsDefaultWrap({required this.children, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 16,
      alignment: WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: children,
    );
  }
}

class _BotProfitCard extends StatelessWidget {
  final String title;
  final int price;
  final int roi;

  const _BotProfitCard({
    required this.title,
    required this.price,
    required this.roi,
    Key? key,
  }) : super(key: key);

  static const titleTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.greyish,
  );
  static const priceTextStyle = TextStyle(
    fontSize: 24,
    color: AppColors.darkIndigo,
  );
  static const roiTextStyle = TextStyle(
    fontSize: 11,
    color: AppColors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.indigo.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.indigo.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.attach_money,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: titleTextStyle,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "\$$price",
                      style: priceTextStyle,
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.seaGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Text(
                        "ROI: $roi%",
                        style: roiTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BotDemoCard extends StatelessWidget {
  final String title;
  final int price;
  final List<String> benefits;

  const _BotDemoCard({
    required this.title,
    required this.price,
    required this.benefits,
    Key? key,
  }) : super(key: key);

  static const _titleTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.greyish,
  );
  static const _priceTextStyle = TextStyle(
    fontSize: 24,
    color: AppColors.darkIndigo,
  );
  static const _benefitTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w200,
    color: AppColors.darkIndigo,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.indigo.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 240, maxHeight: 340),
        child: Column(
          children: [
            Text(
              title,
              style: _titleTextStyle,
            ),
            const SizedBox(height: 10),
            Text(
              "\$$price",
              style: _priceTextStyle,
            ),
            const SizedBox(height: 20),
            ...benefits.map(
              (benefit) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: SizedBox(
                      width: 200,
                      child: Text(benefit, style: _benefitTextStyle),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            _GetStartedButton(onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class _GetStartedButton extends StatelessWidget {
  final VoidCallback onTap;

  const _GetStartedButton({required this.onTap, Key? key}) : super(key: key);

  static const _buttonTextStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyish),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.localizations.getStarted,
              style: _buttonTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class _FunctionalityComparisonTable extends StatelessWidget {
  const _FunctionalityComparisonTable({Key? key}) : super(key: key);

  TextStyle _defaultCellTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: Responsive.isMobile(context) ? 14 : 17,
      color: AppColors.darkIndigo,
    );
  }

  static final _fourChecks = [
    const _TableRowCell(child: _GreenCheck()),
    const _TableRowCell(child: _GreenCheck()),
    const _TableRowCell(child: _GreenCheck()),
    const _TableRowCell(child: _GreenCheck()),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.indigo.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                _TableHeaderRowCell(
                  text: context.localizations.features,
                  textAlign: TextAlign.start,
                ),
                _TableHeaderRowCell(text: context.localizations.pioneer),
                _TableHeaderRowCell(text: context.localizations.explorer),
                _TableHeaderRowCell(text: context.localizations.adventurer),
                _TableHeaderRowCell(text: context.localizations.hero),
              ],
            ),
            TableRow(
              children: List.generate(
                5,
                (index) => const Divider(),
              ),
            ),
            TableRow(
              children: [
                _TableRowCell(
                  child: Text(
                    context.localizations.availableOnAllExchanges,
                    style: _defaultCellTextStyle(context),
                  ),
                ),
                ...List.generate(
                  4,
                  (index) => _TableRowCell(
                    child: Text(
                      context.localizations.allExchanges,
                      style: _defaultCellTextStyle(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                _TableRowCell(
                  child: Text(
                    context.localizations.liveTradingTerminal,
                    style: _defaultCellTextStyle(context),
                  ),
                ),
                ..._fourChecks,
              ],
            ),
            TableRow(
              children: [
                _TableRowCell(
                  child: Text(
                    context.localizations.portfolioManagement,
                    style: _defaultCellTextStyle(context),
                  ),
                ),
                ..._fourChecks,
              ],
            ),
            TableRow(
              children: [
                _TableRowCell(
                  child: Text(
                    context.localizations.manualTrading,
                    style: _defaultCellTextStyle(context),
                  ),
                ),
                ..._fourChecks,
              ],
            ),
            TableRow(
              children: [
                _TableRowCell(
                  child: Text(
                    context.localizations.syncingPositions,
                    style: _defaultCellTextStyle(context),
                  ),
                ),
                ..._fourChecks,
              ],
            ),
            TableRow(
              children: [
                _TableRowCell(
                  child: Text(
                    context.localizations.reservePositions,
                    style: _defaultCellTextStyle(context),
                  ),
                ),
                ..._fourChecks,
              ],
            ),
            TableRow(
              children: [
                _TableRowCell(
                  child: Text(
                    context.localizations.personalStats,
                    style: _defaultCellTextStyle(context),
                  ),
                ),
                ..._fourChecks,
              ],
            ),
            TableRow(
              children: [
                _TableRowCell(
                  child: Text(
                    context.localizations.globalStats,
                    style: _defaultCellTextStyle(context),
                  ),
                ),
                ..._fourChecks,
              ],
            ),
            TableRow(
              children: [
                _TableRowCell(
                  child: Text(
                    context.localizations.strategyBuilder,
                    style: _defaultCellTextStyle(context),
                  ),
                ),
                ..._fourChecks,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TableRowCell extends StatelessWidget {
  final Widget child;

  const _TableRowCell({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 100),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: child,
    );
  }
}

class _TableHeaderRowCell extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const _TableHeaderRowCell({
    required this.text,
    this.textAlign = TextAlign.center,
    Key? key,
  }) : super(key: key);

  TextStyle _headerTableRowTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: Responsive.isMobile(context) ? 12 : 15,
      fontWeight: FontWeight.w200,
      color: AppColors.darkIndigo.withOpacity(0.5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 100),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        text,
        style: _headerTableRowTextStyle(context),
        textAlign: textAlign,
      ),
    );
  }
}

class _GreenCheck extends StatelessWidget {
  const _GreenCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.seaGreen.withOpacity(0.1),
      radius: Responsive.isMobile(context) ? 10 : 25,
      child: Icon(
        Icons.check,
        size: Responsive.isMobile(context) ? 16 : 25,
        color: AppColors.seaGreen,
      ),
    );
  }
}
