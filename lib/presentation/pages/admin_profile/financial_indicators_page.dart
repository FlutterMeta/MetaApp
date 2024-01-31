import 'package:flutter/material.dart';

import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

import 'package:meta_app/presentation/pages/admin_profile/products_state_handler.dart';
import 'package:meta_app/presentation/pages/admin_profile/referal_level_state_handler.dart';
import 'package:meta_app/presentation/widgets/bot_demo_card.dart';
import 'package:meta_app/presentation/widgets/level_card.dart';
import 'package:meta_app/presentation/widgets/rights_reserved_footer.dart';

import '../../widgets/profile_header/profile_header.dart';
import '../../widgets/responsive.dart';
import 'modals/manage_product_modal.dart';
import 'modals/add_referal_level_modal.dart';

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
          decoration: BoxDecoration(gradient: context.gradient.lightIndigo),
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

class _BotDemoCards extends StatefulWidget {
  const _BotDemoCards({Key? key}) : super(key: key);

  @override
  State<_BotDemoCards> createState() => _BotDemoCardsState();
}

class _BotDemoCardsState extends State<_BotDemoCards> {
  @override
  void initState() {
    ProductsStateHandler.instance.init();
    super.initState();
  }

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
          SizedBox(
            height: 380,
            width: double.infinity,
            child: Align(
              child: ValueListenableBuilder(
                valueListenable: ProductsStateHandler.controller,
                builder: (_, __, ___) {
                  return ListView.separated(
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index ==
                          ProductsStateHandler.instance.products.length) {
                        return const AddProduct();
                      }

                      return EditableBotDemoCard(
                        product: ProductsStateHandler.instance.products[index],
                      );
                    },
                    itemCount:
                        ProductsStateHandler.instance.products.length + 1,
                    separatorBuilder: (_, __) => const SizedBox(width: 20),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  void _handleOnTap(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) {
        return SingleChildScrollView(
          child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const ManageProductModal(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleOnTap(context),
      child: CardWrapper(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.localizations.addNewProduct,
              style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Icon(
              Icons.add,
              color: context.color.profilePagePrimary,
              size: 80,
            ),
          ],
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

  void _handleOnTap(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: const AddReferalLevelModal(),
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
