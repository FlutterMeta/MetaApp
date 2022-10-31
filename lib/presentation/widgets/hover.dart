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
  bool _isHovered = false;

  void _onEntered(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  Matrix4 _transform() {
    final hovered = Matrix4.identity()..translate(0, -2, 0);

    return _isHovered ? hovered : Matrix4.identity();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onEntered(true),
      onExit: (_) => _onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _transform(),
        child: widget.builder(_isHovered),
      ),
    );
  }
}
