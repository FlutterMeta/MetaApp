import 'package:flutter/material.dart';

class LocaleDropdownMenu extends StatelessWidget {
  const LocaleDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.language),
        Icon(Icons.arrow_drop_down),
      ],
    );
  }
}
