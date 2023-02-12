import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/bot_demo_card.dart';
import 'package:meta_app/presentation/widgets/level_card.dart';
import 'package:meta_app/presentation/widgets/rights_reserved_footer.dart';
import '../../widgets/profile_header/profile_header.dart';

class FinancialIndicatorsPage extends StatelessWidget {
  const FinancialIndicatorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.admin(),
      backgroundColor: context.color.profilePageBackground,
      body: Portal(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: context.gradient.lightIndigo,
            ),
            child: Column(
              children: const [
                _BotDemoCards(),
                SizedBox(height: 40),
                _ReferralRewards(),
                SizedBox(height: 160),
                RightsReservedFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ReferralRewards extends StatelessWidget {
  const _ReferralRewards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.color.profilePageBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localizations.auroraUniverseReferralReward,
            style: context.text.profileBotsDefault.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 30),
          const _LevelCards(),
        ],
      ),
    );
  }
}

class _BotDemoCards extends StatelessWidget {
  const _BotDemoCards({Key? key}) : super(key: key);

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

  List<Widget> _demoCards(BuildContext context) {
    final localization = context.localizations;

    return [
      BotDemoCard.admin(
        title: localization.pioneer,
        price: 20.39,
        benefits: _basicBenefits(context),
      ),
      BotDemoCard.admin(
        title: localization.adventurer,
        price: 40.22,
        benefits: _basicBenefits(context),
      ),
      BotDemoCard.admin(
        title: localization.hero,
        price: 78.25,
        benefits: _advancedBenefits(context),
      ),
      BotDemoCard.admin(
        title: localization.pioneer,
        price: 3000,
        benefits: _advancedBenefits(context),
      ),
      BotDemoCard.admin(
        title: localization.adventurer,
        price: 5000,
        benefits: _advancedBenefits(context),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      width: double.infinity,
      child: Align(
        child: ListView.separated(
          shrinkWrap: true,
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => _demoCards(context).elementAt(index),
          itemCount: _demoCards(context).length,
          separatorBuilder: (_, __) => const SizedBox(width: 20),
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
        (index) => EditableLevelCard(
          level: index + 1,
          reward: index % 2 == 0 ? 300 : 500,
        ),
      ),
    );
  }
}
