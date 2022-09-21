import 'package:flutter/material.dart';
import "package:meta_app/core/utils/extensions/build_context_ext.dart";

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: context.gradient.lightPurple,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
