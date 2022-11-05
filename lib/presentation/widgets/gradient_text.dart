import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Gradient? gradient;

  const GradientText({
    required this.text,
    this.textAlign,
    this.gradient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) =>
          (gradient ?? context.gradient.indigoVertical).createShader(bounds),
      child: Text(
        text,
        textAlign: textAlign,
        style: context.text.metaverseThatUnitesTitle,
      ),
    );
  }
}
