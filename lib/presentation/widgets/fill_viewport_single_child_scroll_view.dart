import 'package:flutter/material.dart';

class FillViewportSingleChildScrollView extends StatelessWidget {
  final Widget child;
  final ScrollPhysics? scrollPhysics;

  const FillViewportSingleChildScrollView({
    Key? key,
    required this.child,
    this.scrollPhysics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          physics: scrollPhysics,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
              minWidth: viewportConstraints.maxWidth,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
