import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/admin_window.dart';
import 'package:meta_app/presentation/widgets/editing_field.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

class LevelCard extends StatelessWidget {
  final int level;
  final double reward;

  const LevelCard({
    required this.level,
    required this.reward,
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
      height: 88,
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
    );
  }
}

class EditableLevelCard extends StatefulWidget {
  final int level;
  final double reward;
  final int requiredReferalsCount;

  const EditableLevelCard({
    required this.level,
    required this.reward,
    required this.requiredReferalsCount,
    Key? key,
  }) : super(key: key);

  @override
  State<EditableLevelCard> createState() => _EditableLevelCardState();
}

class _EditableLevelCardState extends State<EditableLevelCard> {
  final _priceController = TextEditingController();
  bool _isTapped = false;

  void _onConfirm() {
    _priceController.text;
    _priceController.clear();
    setState(() => _isTapped = false);
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
      onTap: () => setState(() => _isTapped = !_isTapped),
      child: Builder(
        builder: (context) {
          return PortalTarget(
            anchor: const Aligned(
              follower: Alignment.topCenter,
              target: Alignment.bottomCenter,
            ),
            visible: _isTapped,
            portalFollower: AdminWindow(
              title: context.localizations.levelReward,
              confirmText: context.localizations.approve,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  EditingField(
                    value: widget.reward.toString(),
                    width: 120,
                    controller: _priceController,
                  ),
                  Icon(
                    Icons.attach_money_rounded,
                    color: context.color.profilePagePrimaryVariant,
                  ),
                ],
              ),
              onConfirm: _onConfirm,
              onCancel: () => setState(() => _isTapped = false),
            ),
            child: LevelCard(level: widget.level, reward: widget.reward),
          );
        },
      ),
    );
  }
}
