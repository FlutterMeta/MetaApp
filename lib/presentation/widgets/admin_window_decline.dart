import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'package:meta_app/presentation/widgets/message_chip.dart';

class AdminWindowDecline extends StatelessWidget {
  final String title;
  final String confirmText;
  final Widget content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final VoidCallback onDecline;

  const AdminWindowDecline({
    required this.title,
    required this.content,
    required this.confirmText,
    required this.onConfirm,
    required this.onCancel,
    required this.onDecline,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.profilePageBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: context.color.profilePagePrimary.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: onCancel,
            ),
          ),
          Text(
            title,
            style: context.text.profileBotsDefault.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 16),
          content,
          const SizedBox(height: 16),
          MessageChip.warning(message: context.localizations.checkRequisites),
          const SizedBox(height: 16),
          if (context.screenWidth >= 540)
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColoredButton(
                  title: confirmText,
                  onTap: onConfirm,
                  color: context.color.profilePageSecondaryVariant,
                ),
                const SizedBox(width: 20),
                ColoredButton(
                  title: context.localizations.decline,
                  onTap: onDecline,
                  color: context.color.profilePageError,
                ),
              ],
            ),
          if (context.screenWidth < 540)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ColoredButton(
                  title: confirmText,
                  onTap: onConfirm,
                  color: context.color.profilePageSecondaryVariant,
                ),
                const SizedBox(height: 20),
                ColoredButton(
                  title: context.localizations.decline,
                  onTap: onDecline,
                  color: context.color.profilePageError,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
