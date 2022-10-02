import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

import 'hover.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Gradient? gradient;

  const GradientButton({
    required this.title,
    required this.onTap,
    this.gradient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hover(
      builder: (bool _) {
        return Container(
          constraints: const BoxConstraints(minWidth: 128),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: gradient ?? context.gradient.purple,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          clipBehavior: Clip.antiAlias,
          child: WebButton(
            onTap: onTap,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: context.text.purpleButtonText,
            ),
          ),
        );
      },
    );
  }
}
