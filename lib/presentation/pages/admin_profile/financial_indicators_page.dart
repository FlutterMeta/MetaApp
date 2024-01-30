import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/global.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/admin_profile/referal_level_state_handler.dart';
import 'package:meta_app/presentation/widgets/bot_demo_card.dart';
import 'package:meta_app/presentation/widgets/level_card.dart';
import 'package:meta_app/presentation/widgets/rights_reserved_footer.dart';
import '../../../data/models/referal_level.dart';
import '../../widgets/profile_header/profile_header.dart';

class FinancialIndicatorsPage extends StatelessWidget {
  const FinancialIndicatorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.admin(),
      backgroundColor: context.color.profilePageBackground,
      body: SingleChildScrollView(
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
      EditableBotDemoCard(
        title: localization.pioneer,
        price: 20.39,
        benefits: _basicBenefits(context),
      ),
      EditableBotDemoCard(
        title: localization.adventurer,
        price: 40.22,
        benefits: _basicBenefits(context),
      ),
      EditableBotDemoCard(
        title: localization.hero,
        price: 78.25,
        benefits: _advancedBenefits(context),
      ),
      EditableBotDemoCard(
        title: localization.pioneer,
        price: 3000,
        benefits: _advancedBenefits(context),
      ),
      EditableBotDemoCard(
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
              .map((level) => EditableLevelCard(level: level))
              .toList(),
          const AddLevelCard(),
        ]);
      },
    );
  }
}

class AddLevelCard extends StatelessWidget {
  const AddLevelCard({Key? key}) : super(key: key);

  void _handleOnTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const _AddLevelModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleOnTap(context),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.color.profilePageBackground,
        ),
        child: const Center(
          child: Icon(Icons.add, size: 40),
        ),
      ),
    );
  }
}

class _AddLevelModal extends StatefulWidget {
  const _AddLevelModal({Key? key}) : super(key: key);

  @override
  State<_AddLevelModal> createState() => _AddLevelModalState();
}

class _AddLevelModalState extends State<_AddLevelModal> {
  final _rewardController = TextEditingController();
  final _requiredReferalsCountController = TextEditingController();

  @override
  void dispose() {
    _rewardController.dispose();
    _requiredReferalsCountController.dispose();
    super.dispose();
  }

  void _handleOnTap(BuildContext context) async {
    final reward = _rewardController.text;
    final requiredReferalsCount = _requiredReferalsCountController.text;

    if (reward.isNotEmpty && requiredReferalsCount.isNotEmpty) {
      final level = ReferalLevel(
        id: 0,
        level: -1, // it will be set on the server
        reward: double.parse(reward),
        requiredReferalsCount: int.parse(requiredReferalsCount),
      );

      Response response =
          await apiRepository.createReferalLevel(level.toJson());
      if (response.statusCode == 200) {
        preloadLevels();
        ReferalLevelStateHandler.controller.value++;
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.color.profilePageBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localizations.addLevel,
            style: context.text.profileBotsDefault.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: _rewardController,
            decoration: InputDecoration(
              hintText: context.localizations.reward,
              hintStyle: context.text.profileBotsDefault.copyWith(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: context.color.profilePagePrimary.withOpacity(0.1),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _requiredReferalsCountController,
            decoration: InputDecoration(
              hintText: context.localizations.requiredReferalsCount,
              hintStyle: context.text.profileBotsDefault.copyWith(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: context.color.profilePagePrimary.withOpacity(0.1),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () => _handleOnTap(context),
              child: Text(context.localizations.add),
            ),
          ),
        ],
      ),
    );
  }
}
