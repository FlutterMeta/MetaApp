import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final LinearGradient? gradient;

  const GradientBackground({
    Key? key,
    required this.child,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient ?? context.gradient.lightPurple,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
