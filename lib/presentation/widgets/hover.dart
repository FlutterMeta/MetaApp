import 'package:flutter/material.dart';

class Hover extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const Hover({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  _HoverState createState() => _HoverState();
}

class _HoverState extends State<Hover> {
  bool _isHovered = false;

  void onEntered(bool isHovered) {
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
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: _transform(),
        child: widget.builder(_isHovered),
      ),
    );
  }
}
