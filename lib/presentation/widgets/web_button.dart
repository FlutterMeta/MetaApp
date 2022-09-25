import 'package:flutter/material.dart';

import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

class WebButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final BorderRadius? borderRadius;
  final Color? highlightColor;
  final Color? hoverColor;

  const WebButton({
    required this.child,
    required this.onTap,
    this.borderRadius,
    this.highlightColor,
    this.hoverColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius,
      onTap: onTap,
      splashFactory: NoSplash.splashFactory,
      highlightColor: highlightColor ?? context.color.transparency,
      hoverColor: hoverColor ?? context.color.transparency,
      child: child,
    );
  }
}
