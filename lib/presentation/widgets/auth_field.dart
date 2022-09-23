import 'package:flutter/material.dart';
import "package:meta_app/core/utils/extensions/build_context_ext.dart";

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final bool obscureText;
  final String? Function(String?) validator;

  const AuthField({
    required this.controller,
    this.hint,
    this.obscureText = false,
    required this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: context.text.loginFormHint,
        filled: true,
        fillColor: context.color.formFieldFill,
        errorStyle: context.text.loginFormError,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
