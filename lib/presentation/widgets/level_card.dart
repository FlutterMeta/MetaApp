import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/admin_window.dart';
import 'package:meta_app/presentation/widgets/editing_field.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

class LevelCard extends StatefulWidget {
  final int level;
  final double reward;

  const LevelCard({
    required this.level,
    required this.reward,
    Key? key,
  }) : super(key: key);

  @override
  State<LevelCard> createState() => _LevelCardState();
}

class _LevelCardState extends State<LevelCard> {
  bool _isTapped = false;
  final _priceController = TextEditingController();

  double _cardWidth(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return context.screenWidth * 0.9;
    } else if (context.screenWidth <= 1240) {
      return context.screenWidth * 0.4;
    } else {
      return context.screenWidth * 0.16;
    }
  }

  void _onConfirm() {
    _priceController.text;
    _priceController.clear();
    setState(() => _isTapped = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => setState(() => _isTapped = !_isTapped),
      child: PortalTarget(
        anchor: const Aligned(
          follower: Alignment.topCenter,
          target: Alignment.bottomCenter,
        ),
        visible: _isTapped,
        portalFollower: AdminWindow(
          title: context.localizations.levelReward,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              EditingField(
                value: widget.reward,
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
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 200,
            maxWidth: Responsive.isMobile(context) ? 500 : 300,
          ),
          child: Container(
            height: 88,
            width: _cardWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.color.profilePagePrimary.withOpacity(0.1),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "${context.localizations.level} ${widget.level}",
                  style: context.text.askButton,
                ),
                const SizedBox(height: 10),
                Text(
                  "${context.localizations.reward}: ${widget.reward}\$",
                  style: context.text.askButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
