import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/global.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/admin_profile/referal_level_state_handler.dart';
import 'package:meta_app/presentation/widgets/bot_demo_card.dart';
import 'package:meta_app/presentation/widgets/level_card.dart';
import 'package:meta_app/presentation/widgets/rights_reserved_footer.dart';
import '../../../core/mixins/message_overlay.dart';
import '../../../data/models/referal_level.dart';
import '../../widgets/profile_header/profile_header.dart';
import '../../widgets/responsive.dart';

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
          const SizedBox(height: 10),
          Text(
            context.localizations.tapOnCardToEditIt,
            style: context.text.profileBotsDefault.copyWith(fontSize: 15),
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
      CardWrapper(
        child: Column(
          children: [
            Text(
              context.localizations.addNewProduct,
              style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Icon(Icons.add, color: context.color.profilePagePrimary, size: 40),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.localizations.auroraUniverseReferralReward,
                style: context.text.profileBotsDefault.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 10),
              Text(
                context.localizations.tapOnCardToEditIt,
                style: context.text.profileBotsDefault.copyWith(fontSize: 15),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        SizedBox(
          height: 380,
          width: double.infinity,
          child: Align(
            child: ListView.separated(
              shrinkWrap: true,
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  _demoCards(context).elementAt(index),
              itemCount: _demoCards(context).length,
              separatorBuilder: (_, __) => const SizedBox(width: 20),
            ),
          ),
        ),
      ],
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

  void _handleOnTap(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: const _AddLevelModal(),
        );
      },
    );
  }

  double _cardWidth(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return context.screenWidth * 0.9;
    } else if (context.screenWidth <= 1240) {
      return context.screenWidth * 0.4;
    } else {
      return context.screenWidth * 0.16;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleOnTap(context),
      child: Container(
        height: 112,
        width: _cardWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.color.profilePagePrimary.withOpacity(0.1),
        ),
        constraints: BoxConstraints(
          minWidth: 200,
          maxWidth: Responsive.isMobile(context) ? 500 : 300,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              context.localizations.addLevel,
              style: context.text.askButton,
            ),
            Icon(Icons.add, color: context.color.profilePagePrimary, size: 40),
          ],
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

class _AddLevelModalState extends State<_AddLevelModal> with MessageOverlay {
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
        ReferalLevelStateHandler.instance.init();
        ReferalLevelStateHandler.controller.value++;
        Navigator.pop(context);
      } else {
        showMessage(
          "${context.localizations.error}: ${response.data["title"]} ",
          Colors.red,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      constraints: const BoxConstraints(
        maxWidth: 500,
        maxHeight: 400,
      ),
      decoration: BoxDecoration(
        color: context.color.profilePageBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // This will make the modal wrap its content
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localizations.addLevel,
            style: context.text.profileBotsDefault.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              context.localizations.reward,
              style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),
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
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              context.localizations.requiredReferalsCount,
              style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _requiredReferalsCountController,
            decoration: InputDecoration(
              hintText: context.localizations.enterReferalsCountNeededToAchieve,
              hintStyle: context.text.profileBotsDefault.copyWith(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: context.color.profilePagePrimary.withOpacity(0.1),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.color.profilePagePrimaryVariant,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(context.localizations.cancel),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _handleOnTap(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.color.profilePagePrimary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(context.localizations.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
