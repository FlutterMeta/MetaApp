import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

class ColoredButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;

  const ColoredButton({
    required this.title,
    required this.color,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minWidth: 128),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: color,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        clipBehavior: Clip.antiAlias,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: context.text.purpleButtonText,
        ),
      ),
    );
  }
}
