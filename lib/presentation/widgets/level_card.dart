import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/data/models/referal_level.dart';

import 'package:meta_app/presentation/widgets/responsive.dart';

import '../../core/global.dart';
import '../../core/mixins/message_overlay.dart';
import '../pages/admin_profile/referal_level_state_handler.dart';

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
  final _rewardController = TextEditingController();
  final _requiredReferalsCountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _rewardController.text = widget.level.reward.toString();
    _requiredReferalsCountController.text =
        widget.level.requiredReferralsCount.toString();
  }

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
        requiredReferralsCount: int.parse(requiredReferalsCount),
      );

      Response response = await apiRepository.updateReferalLevel(
        widget.level.id,
        level.toJson(),
      );
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
            context.localizations.editReferalLevel,
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
