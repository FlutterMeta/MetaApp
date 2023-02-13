import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

class SimpleOutlinedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  const SimpleOutlinedButton({
    required this.onTap,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: context.color.greyish),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: context.text.profilePageBody.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
