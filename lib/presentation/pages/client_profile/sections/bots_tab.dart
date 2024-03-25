import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/admin_profile/modals/choose_payment_system_modal.dart';
import 'package:meta_app/presentation/widgets/bot_demo_card.dart';
import 'package:meta_app/presentation/widgets/message_chip.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';
import 'package:meta_app/presentation/widgets/rights_reserved_footer.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/product.dart';
import '../../../providers/products_notifier.dart';

class BotsTab extends StatefulWidget {
  const BotsTab({super.key});

  @override
  State<BotsTab> createState() => _BotsTabState();
}

class _BotsTabState extends State<BotsTab> {
  List<Widget> _profitCards(BuildContext context) {
    final localization = context.localizations;

    return [
      _BotProfitCard(
        title: "${localization.futures} ${localization.pioneer}",
        price: 1500,
        roi: 40,
      ),
      _BotProfitCard(
        title: "${localization.futures} ${localization.adventurer}",
        price: 3000,
        roi: 60,
      ),
      _BotProfitCard(
        title: "${localization.futures} ${localization.hero}",
        price: 5000,
        roi: 80,
      ),
    ];
  }

  void _showDialog(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (_) {
        return Center(
          child: Expanded(
            child: SingleChildScrollView(
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ChoosePaymentSystemModal(product: product),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(gradient: context.gradient.lightIndigo),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Consumer<ProductsNotifier>(
          builder: (context, productsNotifier, child) {
            return Column(
              children: [
                _CardsWrap(children: _profitCards(context)),
                const SizedBox(height: 20),
                _TitleWrap(
                    title: context.localizations.ourProducts,
                    subtitle: context.localizations.ourProductsInfo),
                const SizedBox(height: 20),
                Container(
                  constraints: const BoxConstraints(maxWidth: 1270),
                  alignment: Alignment.centerLeft,
                  child: _CardsWrap(children: [
                    if (productsNotifier.products.isEmpty)
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1270),
                        child: Row(children: [
                          Expanded(
                            child: MessageChip.info(
                                message: context.localizations.noProducts),
                          ),
                        ]),
                      ),
                    for (final product in productsNotifier.products)
                      BotDemoCard(
                        product: product,
                        onTap: () => _showDialog(context, product),
                      ),
                  ]),
                ),
                const SizedBox(height: 30),
                const _FunctionalityComparisonTable(),
                const SizedBox(height: 60),
                const RightsReservedFooter(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _TitleWrap extends StatelessWidget {
  final String title;
  final String subtitle;

  const _TitleWrap({
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1270),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.text.profileBotsDefault
                .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: context.text.profileBotsDefault.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class _CardsWrap extends StatelessWidget {
  final List<Widget> children;

  const _CardsWrap({
    required this.children,
    Key? key,
  }) : super(key: key);

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

  List<Widget> _getRewardItems(BuildContext context) {
    return [
      Text(
        "\$$price",
        style: context.text.profileBotsDefault.copyWith(fontSize: 24),
      ),
      const SizedBox(width: 10, height: 10),
      ROIChip(roi: roi),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.profilePageBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: context.color.profilePagePrimary.withOpacity(0.1),
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
                color: context.color.profilePagePrimary.withOpacity(0.1),
              ),
              child: Icon(
                Icons.attach_money,
                color: context.color.profilePagePrimary,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    style: context.text.profilePageSubtitle.copyWith(
                      fontSize: Responsive.isMobile(context) ? 12 : 16,
                    ),
                    children: [
                      const TextSpan(text: "Binance "),
                      TextSpan(text: title),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Builder(
                  builder: (context) {
                    if (context.screenWidth < 500) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _getRewardItems(context),
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _getRewardItems(context),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ROIChip extends StatelessWidget {
  final int roi;

  const ROIChip({
    required this.roi,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.profilePageSecondaryVariant,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      child: Text(
        "${context.localizations.roiPerMonth} $roi%",
        style: context.text.profilePageInverseBody.copyWith(fontSize: 12),
      ),
    );
  }
}

class _FunctionalityComparisonTable extends StatelessWidget {
  const _FunctionalityComparisonTable({Key? key}) : super(key: key);

  TextStyle _defaultCellTextStyle(BuildContext context) {
    return context.text.profileBotsDefault.copyWith(
      fontSize: Responsive.isMobile(context) ? 14 : 18,
    );
  }

  List<Widget> _fourChecks() {
    return List.generate(
      4,
      (index) => const _TableRowCell(child: _GreenCheck()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.color.profilePageBackground,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: context.color.profilePagePrimary.withOpacity(0.1),
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
                ..._fourChecks(),
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
                ..._fourChecks(),
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
                ..._fourChecks(),
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
                ..._fourChecks(),
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
                ..._fourChecks(),
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
                ..._fourChecks(),
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
                ..._fourChecks(),
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
                ..._fourChecks(),
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
    final text = context.text;

    return text.profileBotsDefault.copyWith(
      color: text.profileBotsDefault.color?.withOpacity(0.5),
      fontWeight: FontWeight.w200,
      fontSize: Responsive.isMobile(context) ? 12 : 16,
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
      backgroundColor:
          context.color.profilePageSecondaryVariant.withOpacity(0.1),
      radius: Responsive.isMobile(context) ? 10 : 24,
      child: Icon(
        Icons.check,
        size: Responsive.isMobile(context) ? 16 : 24,
        color: context.color.profilePageSecondaryVariant,
      ),
    );
  }
}
