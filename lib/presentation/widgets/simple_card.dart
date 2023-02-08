import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/admin_window.dart';
import 'package:meta_app/presentation/widgets/editing_field.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

class SimpleCard extends StatefulWidget {
  final int level;
  final double reward;
  final bool editable;

  const SimpleCard({
    required this.level,
    required this.reward,
    required this.editable,
    Key? key,
  }) : super(key: key);

  @override
  State<SimpleCard> createState() => _SimpleCardState();
}

class _SimpleCardState extends State<SimpleCard> {
  bool _isTapped = false;
  final _priceController = TextEditingController();

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
      child: Builder(
        builder: (context) {
          if (!widget.editable) {
            return _CardItself(level: widget.level, reward: widget.reward);
          }
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
            child: _CardItself(level: widget.level, reward: widget.reward),
          );
        },
      ),
    );
  }
}

class _CardItself extends StatelessWidget {
  final int level;
  final double reward;

  const _CardItself({
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
