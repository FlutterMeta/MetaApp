import 'package:flutter/material.dart';

import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/data/models/referal_level.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';

import 'package:meta_app/presentation/widgets/responsive.dart';
import 'package:provider/provider.dart';

import '../../core/mixins/message_overlay.dart';
import '../../data/models/result.dart';
import '../providers/levels_notifier.dart';

class LevelCard extends StatelessWidget {
  final ReferalLevel level;

  const LevelCard({
    required this.level,
    Key? key,
  }) : super(key: key);

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
    return Container(
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
            "${context.localizations.level} ${level.level}  ",
            style: context.text.askButton,
          ),
          const SizedBox(height: 10),
          Text(
            "${context.localizations.requiredReferals}:  ${level.requiredReferralsCount}",
            style: context.text.askButton,
          ),
          const SizedBox(height: 10),
          Text(
            "${context.localizations.reward}: ${level.reward} ",
            style: context.text.askButton,
          ),
        ],
      ),
    );
  }
}

class EditableLevelCard extends StatefulWidget {
  final ReferalLevel level;

  const EditableLevelCard({
    required this.level,
    Key? key,
  }) : super(key: key);

  @override
  State<EditableLevelCard> createState() => _EditableLevelCardState();
}

class _EditableLevelCardState extends State<EditableLevelCard> {
  final _priceController = TextEditingController();

  void _handleOnTap(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) {
        return Center(
          child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: _EditLevelModal(level: widget.level),
          ),
        );
      },
    );
  }

  @override
  dispose() {
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _handleOnTap(context),
      child: Builder(
        builder: (context) {
          return LevelCard(level: widget.level);
        },
      ),
    );
  }
}

class _EditLevelModal extends StatefulWidget {
  final ReferalLevel level;
  const _EditLevelModal({Key? key, required this.level}) : super(key: key);

  @override
  State<_EditLevelModal> createState() => _EditLevelModalState();
}

class _EditLevelModalState extends State<_EditLevelModal> with MessageOverlay {
  final _levelController = TextEditingController();
  final _rewardController = TextEditingController();
  final _requiredReferalsCountController = TextEditingController();

  late final LevelsNotifier levelsNotifier;

  @override
  void initState() {
    super.initState();
    _rewardController.text = widget.level.reward.toString();
    _requiredReferalsCountController.text =
        widget.level.requiredReferralsCount.toString();
    _levelController.text = widget.level.level.toString();
    levelsNotifier = context.read<LevelsNotifier>();
  }

  @override
  void dispose() {
    _rewardController.dispose();
    _requiredReferalsCountController.dispose();
    _levelController.dispose();
    super.dispose();
  }

  void _handleOnTap(BuildContext context) async {
    final levelCtrl = _levelController.text;
    final reward = _rewardController.text;
    final requiredReferalsCount = _requiredReferalsCountController.text;

    // List<int> levels = levelsNotifier.levels.map((e) => e.level).toList();

    // if (levels.contains(int.parse(levelCtrl))) {
    //   showMessage(
    //     context.localizations.levelAlreadyExists,
    //     Colors.orange,
    //   );
    //   return;
    // }

    if (reward.isNotEmpty &&
        requiredReferalsCount.isNotEmpty &&
        levelCtrl.isNotEmpty) {
      final level = ReferalLevel(
        id: widget.level.id,
        level: int.parse(levelCtrl),
        reward: double.parse(reward),
        requiredReferralsCount: int.parse(requiredReferalsCount),
      );

      Result result = await levelsNotifier.editLevel(level);

      if (result.success) {
        showMessage(
          context.localizations.editedSuccessfully,
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
        maxHeight: 600,
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
            context.localizations.editReferalLevel,
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
          // Consumer<LevelsNotifier>(builder: (context, levelsNotifier, child) {
          //   return Text(
          //     "${context.localizations.alreadyLevels}: ${levelsNotifier.levels.map((e) => e.level)}",
          //   );
          // }),
          const SizedBox(height: 5),
          Text(
            context.localizations.levelCannotBeChanged,
            style: context.text.profileBotsDefault.copyWith(fontSize: 14),
          ),

          const SizedBox(height: 5),

          TextField(
            enabled: false, // Disable editing
            controller: _levelController,
            decoration: InputDecoration(
              hintText: context.localizations.addLevel,
              hintStyle: context.text.profileBotsDefault.copyWith(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: context.color.profilePagePrimary.withOpacity(0.2),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${context.localizations.reward} (\$)",
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
                ColoredButton(
                  title: context.localizations.cancel,
                  onTap: () => Navigator.pop(context),
                  color: context.color.profilePagePrimaryVariant,
                ),
                const SizedBox(width: 20),
                ColoredButton(
                  title: context.localizations.save,
                  onTap: () => _handleOnTap(context),
                  color: context.color.profilePageSecondaryVariant,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
