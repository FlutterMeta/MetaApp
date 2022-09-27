import 'package:flutter/material.dart';

class Hover extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const Hover({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  HoverState createState() => HoverState();
}

class HoverState extends State<Hover> {
  bool isHovered = false;

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hovered = Matrix4.identity()..translate(0, -2, 0);
    final transform = isHovered ? hovered : Matrix4.identity();

    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: transform,
        child: widget.builder(isHovered),
      ),
    );
  }
}
