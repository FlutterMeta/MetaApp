import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/themes/theme.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({super.key});

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
            ],
          ),
        ),
      ),
    );
  }
}

class _LevelCards extends StatelessWidget {
  const _LevelCards({super.key});

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

  const _LevelCard({super.key, required this.level, required this.reward});

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

class _InformationPanel extends StatelessWidget {
  const _InformationPanel({Key? key}) : super(key: key);

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
          onTap: () {},
        ),
      ],
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
