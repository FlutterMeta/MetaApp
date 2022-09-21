import 'package:flutter/material.dart';

import "package:meta_app/core/utils/extensions/build_context_ext.dart";

class PasswordFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;

  const PasswordFieldWidget({
    Key? key,
    required this.controller,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: context.text.loginFormHint,
        filled: true,
        fillColor: context.color.formFieldFill,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
