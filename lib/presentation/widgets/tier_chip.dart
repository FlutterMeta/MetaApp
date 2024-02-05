import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

class TierChip extends StatelessWidget {
  final int tier;

  const TierChip({
    required this.tier,
    Key? key,
  }) : super(key: key);

  Color _getColorForTier(int tier) {
    switch (tier) {
      case 1:
        return Color.fromARGB(255, 218, 196, 0);
      case 2:
        return Colors.orange;
      case 3:
        return Colors.red;
      case 4:
        return Colors.purple;
      case 5:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color chipColor = _getColorForTier(tier);

    return Container(
      decoration: BoxDecoration(
        color: chipColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      child: Text(
        "${context.localizations.subscriptionTier} $tier",
        style: context.text.profilePageInverseBody
            .copyWith(fontSize: 13, color: chipColor),
      ),
    );
  }
}
