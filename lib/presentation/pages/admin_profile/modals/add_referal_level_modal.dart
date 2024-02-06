import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:provider/provider.dart';

import '../../../../core/mixins/message_overlay.dart';
import '../../../../data/models/referal_level.dart';
import '../../../../data/models/result.dart';
import '../../../providers/levels_notifier.dart';

class AddReferalLevelModal extends StatefulWidget {
  const AddReferalLevelModal({Key? key}) : super(key: key);

  @override
  State<AddReferalLevelModal> createState() => AddReferalLevelModalState();
}

class AddReferalLevelModalState extends State<AddReferalLevelModal>
    with MessageOverlay {
  final _rewardController = TextEditingController();
  final _requiredReferalsCountController = TextEditingController();
  final levelController = TextEditingController();
  late final LevelsNotifier levelsNotifier;

  @override
  void initState() {
    super.initState();
    levelsNotifier = context.read<LevelsNotifier>();
  }

  @override
  void dispose() {
    _rewardController.dispose();
    _requiredReferalsCountController.dispose();
    super.dispose();
  }

  void _handleOnTap(BuildContext context) async {
    final lev = levelController.text;
    final reward = _rewardController.text;
    final requiredReferalsCount = _requiredReferalsCountController.text;

    if (reward.isNotEmpty &&
        requiredReferalsCount.isNotEmpty &&
        lev.isNotEmpty) {
      final level = ReferalLevel(
        id: -1,
        level: int.parse(lev),
        reward: double.parse(reward),
        requiredReferralsCount: int.parse(requiredReferalsCount),
      );

      Result result = await levelsNotifier.addLevel(level);

      if (result.success) {
        showMessage(
          context.localizations.productAddedSuccessfully,
          Colors.green,
        );

        Navigator.pop(context);
      } else {
        showMessage(
          "${context.localizations.error}: ${result.message}",
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
        maxHeight: 500,
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
              context.localizations.level,
              style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: levelController,
            decoration: InputDecoration(
              hintText: context.localizations.level,
              hintStyle: context.text.profileBotsDefault.copyWith(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: context.color.profilePagePrimary.withOpacity(0.1),
            ),
          ),
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
              hintStyle: context.text.profileBotsDefault.copyWith(fontSize: 12),
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
              hintStyle: context.text.profileBotsDefault.copyWith(fontSize: 12),
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
