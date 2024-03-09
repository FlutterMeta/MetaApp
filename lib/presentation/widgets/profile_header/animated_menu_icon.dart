import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

import '../../pages/client_profile/client_menu_controller.dart';

class AnimatedMenuIcon extends StatefulWidget {
  const AnimatedMenuIcon({Key? key}) : super(key: key);

  @override
  State<AnimatedMenuIcon> createState() => _AnimatedMenuIconState();
}

class _AnimatedMenuIconState extends State<AnimatedMenuIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changeState() {
    final menuCollapsedState = ClientMenuController.isCollapsed;

    if (menuCollapsedState.value) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    menuCollapsedState.value = !menuCollapsedState.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeState,
      child: AnimatedIcon(
        icon: AnimatedIcons.arrow_menu,
        color: context.color.profilePageSecondary,
        progress: _controller,
        size: 36,
      ),
    );
  }
}
