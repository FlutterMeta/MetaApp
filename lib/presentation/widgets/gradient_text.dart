import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const GradientText({
    required this.text,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) =>
          context.gradient.purpleVertical.createShader(bounds),
      child: Text(
        context.localizations.metaverseThatUnites,
        textAlign: textAlign,
        style: context.text.metaverseThatUnitesTitle,
      ),
    );
  }
}
