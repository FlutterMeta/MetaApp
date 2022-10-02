import 'package:flutter/material.dart';

class SliverSizedBox extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  const SliverSizedBox({
    Key? key,
    this.child,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
