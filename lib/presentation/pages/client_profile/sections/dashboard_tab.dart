import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/client_profile/menu_controller.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'package:meta_app/presentation/widgets/level_card.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';
import 'package:meta_app/presentation/widgets/rights_reserved_footer.dart';
import 'package:meta_app/presentation/widgets/transaction_table/transaction_table.dart';
import 'package:useful_extensions/useful_extensions.dart';

import '../../../../data/models/transaction.dart';
import '../../../../data/models/user.dart';
import '../../../redux/app_state.dart';
import '../../admin_profile/referal_level_state_handler.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable: MenuController.isCollapsed,
        builder: (context, isCollapsed, child) {
          return Container(
            decoration: BoxDecoration(gradient: context.gradient.lightIndigo),
            padding: const EdgeInsets.all(20),
            child: Align(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: const [
                    _InformationPanel(),
                    SizedBox(height: 20),
                    _AdaptiveMainContent(),
                    SizedBox(height: 20),
                    _TransactionsHistorySection(),
                    SizedBox(height: 60),
                    RightsReservedFooter(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AdaptiveMainContent extends StatelessWidget {
  const _AdaptiveMainContent({Key? key}) : super(key: key);

  static const _userRank = "Newbie";

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, User?>(
      converter: (store) => store.state.currentUser,
      builder: (context, currentUser) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (Responsive.isDesktop(context) || Responsive.isTablet(context)) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      _RankCard(
                        partnerIncomeLevel: 0,
                        rank: _userRank,
                        reward: currentUser?.balance ?? 0,
                      ),
                      const SizedBox(height: 20),
                      const _WalletCard(),
                    ],
                  ),
                  const SizedBox(width: 20),
                  const Expanded(child: _LevelCards()),
                ],
              );
            } else {
              return Column(
                children: [
                  _RankCard(
                    partnerIncomeLevel: 0,
                    rank: _userRank,
                    reward: currentUser?.balance ?? 0,
                  ),
                  const SizedBox(height: 20),
                  const _WalletCard(),
                  const SizedBox(height: 20),
                  const _LevelCards(),
                ],
              );
            }
          },
        );
      },
    );
  }
}

class _LevelCards extends StatefulWidget {
  const _LevelCards({Key? key}) : super(key: key);

  @override
  State<_LevelCards> createState() => _LevelCardsState();
}

class _LevelCardsState extends State<_LevelCards> {
  @override
  void initState() {
    super.initState();
    ReferalLevelStateHandler.instance.init();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ReferalLevelStateHandler.controller,
      builder: (_, __, ___) {
        return Wrap(spacing: 20, runSpacing: 16, children: [
          ...ReferalLevelStateHandler.instance.levels
              .map((level) => LevelCard(level: level))
              .toList(),
        ]);
      },
    );
  }
}

class _InformationPanel extends StatefulWidget {
  const _InformationPanel({Key? key}) : super(key: key);

  @override
  State<_InformationPanel> createState() => _InformationPanelState();
}

class _InformationPanelState extends State<_InformationPanel>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  OverlayEntry? _overlayEntry;
  Animation<double>? _animation;

  void showOverlay(BuildContext context) async {
    OverlayState? overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        right: 10,
        bottom: 10,
        child: _PopupNotification(animation: _animation),
      );
    });

    _overlayEntry?.let((entry) {
      overlayState?.insert(entry);
      _animationController.forward();
    });

    await Future.delayed(const Duration(seconds: 3));
    if (_overlayEntry?.mounted ?? false) {
      _animationController.reverse().then((value) => _overlayEntry?.remove());
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurveTween(curve: Curves.linear).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  var referralCode = "Aurora_Bobr12360914";

  void onCopyButtonTap() {
    Clipboard.setData(ClipboardData(text: referralCode));
    showOverlay(context);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 20,
      runSpacing: 8,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: context.localizations.yourActivity,
              style: context.text.profilePageBody.copyWith(fontSize: 30),
            ),
            const TextSpan(text: "  "),
            TextSpan(
              text: context.localizations.auroraUniverse,
              style: context.text.profilePageBody.copyWith(
                fontSize: 30,
                fontFamily: GoogleFonts.poppins(
                  fontWeight: FontWeight.w900,
                ).fontFamily,
              ),
            ),
          ]),
        ),
        StoreConnector<AppState, User?>(
          converter: (store) => store.state.currentUser,
          builder: (context, currentUser) {
            referralCode = currentUser?.id ?? " ";
            return SelectableText.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
                TextSpan(
                  text: context.localizations.referralCodeForPartners,
                  style: context.text.profilePageBody.copyWith(
                    fontSize: 18,
                    color: context.color.profilePageSecondaryVariant,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const TextSpan(text: "  "),
                TextSpan(
                  text: currentUser?.id ?? " ",
                  style: context.text.profileDashboardReferralCodeItself,
                ),
              ]),
            );
          },
        ),
        ColoredButton(
          title: context.localizations.copyCode,
          color: context.color.roadmapCardBackground,
          onTap: () => onCopyButtonTap(),
        ),
      ],
    );
  }
}

class _PopupNotification extends StatelessWidget {
  final Animation<double>? animation;

  const _PopupNotification({
    required this.animation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.color.localeDropdownOpacity,
      child: FadeTransition(
        opacity: animation as Animation<double>,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: context.color.faqItemArrowFill,
          ),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 300,
          height: 60,
          child: Text(
            context.localizations.refferalCodeCopied,
            style: context.text.profilePageInverseBody.copyWith(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class _RankCard extends StatelessWidget {
  final String rank;
  final double reward;
  final int partnerIncomeLevel;

  const _RankCard({
    required this.rank,
    required this.reward,
    required this.partnerIncomeLevel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: context.gradient.indigoTurquoise,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(30),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 470),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${context.localizations.rank}: $rank",
              style: context.text.profilePageInverseBody.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 26),
            Text(
              "${context.localizations.reward}: \$${reward.toStringAsFixed(2)}",
              style: context.text.profilePageInverseBody.copyWith(fontSize: 36),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${context.localizations.partnerIncomeLevel}:",
                  style: context.text.profilePageInverseBody.copyWith(
                    fontSize: 14,
                    color: context.text.profilePageInverseBody.color
                        ?.withOpacity(0.6),
                  ),
                ),
                Text(
                  "$partnerIncomeLevel ${context.localizations.level.toLowerCase()}",
                  style: context.text.profilePageInverseBody
                      .copyWith(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _WalletCard extends StatefulWidget {
  const _WalletCard({Key? key}) : super(key: key);

  @override
  State<_WalletCard> createState() => _WalletCardState();
}

class _WalletCardState extends State<_WalletCard> {
  @override
  Widget build(BuildContext context) {
    final labelTextStyle = context.text.profilePageInverseBody.copyWith(
      fontSize: 14,
      color: context.text.profilePageInverseBody.color?.withOpacity(0.6),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: context.gradient.indigoTurquoiseDiagonal,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(30),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 470),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localizations.externalWallet,
              style: context.text.profilePageInverseBody.copyWith(
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 56),
            Text(
              context.localizations.enterWalletAddress,
              style: labelTextStyle,
            ),
            const SizedBox(height: 6),
            _FilledTextField(
              hintText: "0x...",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 32),
            Text(
              context.localizations.chooseNetwork,
              style: labelTextStyle,
            ),
            const SizedBox(height: 6),
            _FilledTextField(
              hintText: "USDT(TRC20)",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 32),
            Text(
              context.localizations.chooseAmount,
              style: labelTextStyle,
            ),
            const SizedBox(height: 6),
            _FilledTextField(
              hintText: "1000 \$",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 62),
            _RequestWithdrawButton(onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class _FilledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const _FilledTextField({
    required this.controller,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: context.color.profilePageBackground,
        hintStyle: context.text.profilePageBody.copyWith(fontSize: 16),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}

class _RequestWithdrawButton extends StatelessWidget {
  final VoidCallback onTap;

  const _RequestWithdrawButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hover(
      builder: (_) {
        return InkWell(
          onTap: onTap,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: context.color.termsButtonFillColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            child: Text(
              context.localizations.requestWithdraw,
              style: context.text.askButton,
            ),
          ),
        );
      },
    );
  }
}

class _TransactionsHistorySection extends StatelessWidget {
  const _TransactionsHistorySection({Key? key}) : super(key: key);

  static final _transactions = [
    Transaction(
      network: 'Tether (TRC20)',
      amount: 1000.000,
      user: User.empty(),
      date: '12 October 2020, 19:23',
      status: 'completed',
      destinationAddress: "0x000000000",
      note: "",
      type: 'Deposit',
    ),
    Transaction(
      network: 'Tether (TRC20)',
      amount: 1000.000,
      user: User.empty(),
      destinationAddress: "0x000000000",
      date: '12 October 2020, 19:23',
      status: 'canceled',
      note: "",
      type: 'Deposit',
    ),
    Transaction(
      network: 'Tether (TRC20)',
      amount: 1000.000,
      user: User.empty(),
      destinationAddress: "0x000000000",
      date: '12 October 2020, 19:23',
      status: 'pending',
      note: "",
      type: 'Deposit',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localizations.historyOfTransactions,
          style: context.text.profilePageBody.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Text(
          context.localizations.timeOfPayments,
          style: context.text.profilePageSubtitle,
        ),
        const SizedBox(height: 30),
        TransactionTable.user(transactions: _transactions),
      ],
    );
  }
}
