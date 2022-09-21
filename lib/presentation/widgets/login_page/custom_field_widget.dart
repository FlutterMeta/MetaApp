import 'package:flutter/material.dart';

import "package:meta_app/core/utils/extensions/build_context_ext.dart";

class CustomFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;

  const CustomFieldWidget({
    Key? key,
    required this.controller,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
