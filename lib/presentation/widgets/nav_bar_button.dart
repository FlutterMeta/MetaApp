import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

class NavBarButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const NavBarButton({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebButton(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      hoverColor: context.color.navButtonHover,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(title),
      ),
    );
  }
}
