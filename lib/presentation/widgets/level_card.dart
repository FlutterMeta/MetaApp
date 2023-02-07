import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

class LevelCard extends StatelessWidget {
  final int level;
  final double reward;

  const LevelCard({
    required this.level,
    required this.reward,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 200, maxWidth: 500),
      child: Container(
        height: 88,
        width: context.screenWidth * 0.16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.color.profilePagePrimary.withOpacity(0.1),
        ),
        padding: const EdgeInsets.all(20),
        clipBehavior: Clip.antiAlias,
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
      ),
    );
  }
}
