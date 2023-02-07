import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';

class AdminWindow extends StatelessWidget {
  final String title;
  final Widget content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const AdminWindow({
    required this.title,
    required this.content,
    required this.onConfirm,
    required this.onCancel,
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
          Text(
            title,
            style: context.text.profileBotsDefault.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 10),
          content,
          const SizedBox(height: 30),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColoredButton(
                title: "Confirm",
                onTap: onConfirm,
                color: context.color.profilePageSecondaryVariant,
              ),
              const SizedBox(width: 20),
              ColoredButton(
                title: "Cancel",
                onTap: onCancel,
                color: context.color.profilePageError,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
