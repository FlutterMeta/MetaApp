import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/themes/theme.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';
import 'package:useful_extensions/useful_extensions.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  static const _userRank = "Newbie";
  static const _userReward = 1337.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(gradient: context.gradient.lightIndigo),
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const _InformationPanel(),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (Responsive.isDesktop(context) ||
                      Responsive.isTablet(context)) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: const [
                            _RankCard(
                              partnerIncomeLevel: 0,
                              rank: _userRank,
                              reward: _userReward,
                            ),
                            SizedBox(height: 20),
                            _WalletCard(),
                          ],
                        ),
                        const SizedBox(width: 20),
                        const Expanded(child: _LevelCards()),
                      ],
                    );
                  } else {
                    return Column(
                      children: const [
                        _RankCard(
                          partnerIncomeLevel: 0,
                          rank: _userRank,
                          reward: _userReward,
                        ),
                        SizedBox(height: 20),
                        _WalletCard(),
                        SizedBox(height: 20),
                        _LevelCards(),
                      ],
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              const _TransactionsHistorySection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LevelCards extends StatelessWidget {
  const _LevelCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 16,
      children: List.generate(
        15,
        (index) => _LevelCard(
          level: index + 1,
          reward: index % 2 == 0 ? 300 : 500,
        ),
      ),
    );
  }
}

class _LevelCard extends StatelessWidget {
  final int level;
  final double reward;

  const _LevelCard({
    required this.level,
    required this.reward,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 200, maxWidth: 500),
      child: Container(
        height: 88,
        width: context.screenWidth * 0.16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.indigo.withOpacity(0.1),
        ),
        padding: const EdgeInsets.all(20),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Text(
              "${context.localizations.level} $level",
              style: context.text.askButton,
            ),
            const SizedBox(height: 10),
            Text(
              "${context.localizations.reward}: $reward\$",
              style: context.text.askButton,
            ),
          ],
        ),
      ),
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
    super.dispose();
  }

  static const _activityTextStyle = TextStyle(fontSize: 30);
  static final _auroraUniverseTextStyle = TextStyle(
    fontSize: 30,
    fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w900).fontFamily,
  );
  static const _referralCodeTextStyle = TextStyle(
    fontSize: 18,
    color: AppColors.seaGreen,
    fontWeight: FontWeight.w700,
  );
  static const _referralCodeItselfTextStyle = TextStyle(
    fontSize: 18,
    color: AppColors.steelBlue,
    fontWeight: FontWeight.w700,
  );
  static const _referralCode = "Aurora_Bobr12360914";

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
              style: _activityTextStyle,
            ),
            const TextSpan(text: "  "),
            TextSpan(
              text: context.localizations.auroraUniverse,
              style: _auroraUniverseTextStyle,
            ),
          ]),
        ),
        SelectableText.rich(
          textAlign: TextAlign.center,
          TextSpan(children: [
            TextSpan(
              text: context.localizations.referralCodeForPartners,
              style: _referralCodeTextStyle,
            ),
            const TextSpan(text: "  "),
            const TextSpan(
              text: _referralCode,
              style: _referralCodeItselfTextStyle,
            ),
          ]),
        ),
        ColoredButton(
          title: context.localizations.copyCode,
          color: context.color.roadmapCardBackground,
          onTap: () {
            Clipboard.setData(const ClipboardData(text: _referralCode));
            showOverlay(context);
          },
        ),
      ],
    );
  }
}

class _PopupNotification extends StatelessWidget {
  final Animation<double>? animation;

  const _PopupNotification({required this.animation, Key? key})
      : super(key: key);

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
            context.localizations.copied,
            style: const TextStyle(color: Colors.white, fontSize: 16),
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

  static const _rankTextStyle = TextStyle(
    fontSize: 20,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );
  static const _rewardTextStyle = TextStyle(
    fontSize: 36,
    color: AppColors.white,
  );
  static final _partnerIncomeTextStyle = TextStyle(
    fontSize: 14,
    color: AppColors.white.withOpacity(0.6),
  );
  static const _levelTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.white,
  );
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
            Text("${context.localizations.rank}: $rank", style: _rankTextStyle),
            const SizedBox(height: 26),
            Text(
              "${context.localizations.reward}: \$${reward.toStringAsFixed(2)}",
              style: _rewardTextStyle,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${context.localizations.partnerIncomeLevel}:",
                  style: _partnerIncomeTextStyle,
                ),
                Text(
                  "$partnerIncomeLevel ${context.localizations.level.toLowerCase()}",
                  style: _levelTextStyle,
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
  final _titleTextStyle = const TextStyle(
    fontSize: 34,
    color: AppColors.white,
    fontWeight: FontWeight.w700,
  );

  final _labelTextStyle = TextStyle(
    fontSize: 14,
    color: AppColors.white.withOpacity(0.6),
  );

  @override
  Widget build(BuildContext context) {
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
            Text(context.localizations.externalWallet, style: _titleTextStyle),
            const SizedBox(height: 56),
            Text(
              context.localizations.enterWalletAddress,
              style: _labelTextStyle,
            ),
            const SizedBox(height: 6),
            _FilledTextField(
              hintText: "0x...",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 32),
            Text(context.localizations.chooseNetwork, style: _labelTextStyle),
            const SizedBox(height: 6),
            _FilledTextField(
              hintText: "USDT(TRC20)",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 32),
            Text(context.localizations.chooseAmount, style: _labelTextStyle),
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

  static const _hintTextStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.white,
        hintStyle: _hintTextStyle,
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

  static const _transactionsTextStyle = TextStyle(
    fontSize: 20,
  );
  static const _timeTextStyle = TextStyle(
    fontSize: 13,
    color: AppColors.greyish,
  );
  static final _transactions = [
    Transaction(
      'Tether (TRC20)',
      '1000.000',
      '12 October 2022, 19:23',
      'Completed',
      'Deposit',
    ),
    Transaction(
      'Tether (TRC20)',
      '11.000',
      '1 January 2023, 10:23',
      'Pending',
      'Withdraw',
    ),
    Transaction(
      'Tether (TRC20)',
      '1000.000',
      '12 October 2020, 19:23',
      'Cancelled',
      'Deposit',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(30),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localizations.historyOfTransactions,
              style: _transactionsTextStyle,
            ),
            const SizedBox(height: 10),
            Text(
              context.localizations.timeOfPayments,
              style: _timeTextStyle,
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _transactions.length,
                  itemBuilder: (_, index) {
                    return _TransactionInfo(
                      transaction: _transactions[index],
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(color: AppColors.greyish),
                    );
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

class _TransactionInfo extends StatelessWidget {
  final Transaction transaction;

  const _TransactionInfo({
    required this.transaction,
    Key? key,
  }) : super(key: key);

  TransactionStatus parse(String value) {
    return TransactionStatus.values.firstWhere(
      (element) => element.value == value,
      orElse: () => TransactionStatus.pending,
    );
  }

  static const _transactionTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.black,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.network,
                  style: _transactionTextStyle,
                ),
                const SizedBox(height: 5),
                Text(
                  context.localizations.paymentSystem,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.greyish,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.date,
                style: _transactionTextStyle,
              ),
              const SizedBox(height: 5),
              Text(
                context.localizations.operationDate,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.greyish,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 100,
          child: Text(
            transaction.amount,
            style: _transactionTextStyle,
          ),
        ),
        SizedBox(
          width: 80,
          child: Text(
            transaction.type,
            style: _transactionTextStyle,
          ),
        ),
        _StatusChip(status: parse(transaction.status)),
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  final TransactionStatus status;

  const _StatusChip({
    required this.status,
    Key? key,
  }) : super(key: key);

  Color get _chipColor {
    switch (status) {
      case TransactionStatus.completed:
        return Colors.green;
      case TransactionStatus.pending:
        return Colors.yellow;
      case TransactionStatus.canceled:
        return Colors.red;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusTextStyle = TextStyle(
      fontSize: 13,
      color: _chipColor,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: _chipColor),
        borderRadius: BorderRadius.circular(100),
      ),
      width: 90,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          status.value,
          style: statusTextStyle,
        ),
      ),
    );
  }
}

class Transaction {
  final String network;
  final String amount;
  final String date;
  final String status;
  final String type;

  Transaction(this.network, this.amount, this.date, this.status, this.type);
}

enum TransactionStatus {
  completed("Completed"),
  pending("Pending"),
  canceled("Cancelled");

  final String value;
  const TransactionStatus(this.value);
}
