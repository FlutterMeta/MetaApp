import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

import '../../../../core/global.dart';
import '../../../../core/mixins/message_overlay.dart';
import '../../../../data/models/referal_level.dart';
import '../referal_level_state_handler.dart';

class AddReferalLevelModal extends StatefulWidget {
  const AddReferalLevelModal({Key? key}) : super(key: key);

  @override
  State<AddReferalLevelModal> createState() => AddReferalLevelModalState();
}

class AddReferalLevelModalState extends State<AddReferalLevelModal>
    with MessageOverlay {
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
