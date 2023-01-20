import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/themes/theme.dart';

class BotsTab extends StatelessWidget {
  const BotsTab({super.key});
  static const List<String> _basicBenefits = [
    "20 positions",
    "portfolio management",
    "manual trading",
    "all available exchanges",
  ];
  static const List<String> _advancedBenefits = [
    ..._basicBenefits,
    "all coins for signals",
    "market arbitrage",
    "algorithm intelligence",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(gradient: context.gradient.lightIndigo),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Wrap(
              spacing: 20,
              runSpacing: 16,
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                _BotProfitCard(
                  title: "Binance Futures Pioneer",
                  price: 1500,
                  roi: 40,
                ),
                _BotProfitCard(
                  title: "Binance Futures Adventurer",
                  price: 3000,
                  roi: 60,
                ),
                _BotProfitCard(
                  title: "Binance Futures Hero",
                  price: 5000,
                  roi: 80,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 16,
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                _BotDemoCard(
                  title: "Pioneer",
                  price: 1500,
                  benefits: _basicBenefits,
                ),
                _BotDemoCard(
                  title: "Adventurer",
                  price: 3000,
                  benefits: _basicBenefits,
                ),
                _BotDemoCard(
                  title: " Hero",
                  price: 5000,
                  benefits: _advancedBenefits,
                ),
                _BotDemoCard(
                  title: "Adventurer",
                  price: 3000,
                  benefits: _advancedBenefits,
                ),
                _BotDemoCard(
                  title: "Hero",
                  price: 5000,
                  benefits: _advancedBenefits,
                ),
              ],
            ),
            const SizedBox(height: 260),
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
