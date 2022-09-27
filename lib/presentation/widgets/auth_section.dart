import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

class AuthSection extends StatelessWidget {
  final VoidCallback onTap;

  const AuthSection({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebButton(
      onTap: onTap,
      child: Text(
        context.localizations.account,
        style: context.text.homePagePurpleBodyText,
      ),
    );
  }
}
